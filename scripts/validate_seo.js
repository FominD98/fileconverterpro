const fs = require("fs");
const path = require("path");

const ROOT = process.cwd();
const DOMAIN = "https://fileconverter.store";
const DOMAIN_HOST = new URL(DOMAIN).host;

const TITLE_MAX = 70;
const DESC_MIN = 140;
const DESC_MAX = 160;
const BODY_WORDS_MIN = 700;
const SCHEMA_MIN = 2;

const STRICT_PATHS = [
  /^en\/convert\/[^/]+\/index\.html$/,
  /^en\/converters\/[^/]+\/index\.html$/,
  /^en\/use-cases\/[^/]+\/index\.html$/,
  /^en\/compare\/[^/]+\/index\.html$/,
  /^blog\/en\/(guides|how-to)\/[^/]+\/index\.html$/,
];

function toPosix(value) {
  return value.split(path.sep).join("/");
}

function listFilesRecursive(dir) {
  const out = [];
  for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
    if ([".git", ".idea", ".claude", "node_modules", "seo", "notpush"].includes(entry.name)) continue;
    const fullPath = path.join(dir, entry.name);
    if (entry.isDirectory()) out.push(...listFilesRecursive(fullPath));
    else out.push(fullPath);
  }
  return out;
}

function urlToLocalPath(urlString) {
  try {
    const url = new URL(urlString);
    const pathname = decodeURIComponent(url.pathname);
    if (pathname.endsWith("/")) {
      const relative = pathname.slice(1);
      return path.join(ROOT, relative, "index.html");
    }
    return path.join(ROOT, pathname.slice(1));
  } catch {
    return null;
  }
}

function isAbsoluteHttpUrl(value) {
  return /^https?:\/\//i.test(value);
}

function decodeEntities(s) {
  if (!s) return s;
  return s
    .replace(/&amp;/g, "&")
    .replace(/&mdash;/g, "—")
    .replace(/&ndash;/g, "–")
    .replace(/&quot;/g, '"')
    .replace(/&#39;|&apos;/g, "'")
    .replace(/&lt;/g, "<")
    .replace(/&gt;/g, ">")
    .replace(/&euro;/g, "€")
    .replace(/&middot;/g, "·")
    .replace(/&nbsp;/g, " ");
}

function parseTitle(html) {
  const m = html.match(/<title>([\s\S]*?)<\/title>/i);
  return m ? decodeEntities(m[1].trim()) : null;
}

function parseCanonical(html) {
  const match = html.match(/<link\s+rel="canonical"\s+href="([^"]+)"\s*\/?>/i);
  return match ? match[1] : null;
}

function parseHreflangLinks(html) {
  const out = [];
  const regex = /<link\s+rel="alternate"\s+hreflang="([^"]+)"\s+href="([^"]+)"\s*\/?>/gi;
  let match;
  while ((match = regex.exec(html)) !== null) {
    out.push({ lang: match[1], href: match[2] });
  }
  return out;
}

function parseMetaContent(html, key) {
  const escaped = key.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
  const patternA = new RegExp(`<meta\\s+property="${escaped}"\\s+content="([^"]*)"\\s*/?>`, "i");
  const patternB = new RegExp(`<meta\\s+name="${escaped}"\\s+content="([^"]*)"\\s*/?>`, "i");
  const patternC = new RegExp(`<meta\\s+content="([^"]*)"\\s+property="${escaped}"\\s*/?>`, "i");
  const patternD = new RegExp(`<meta\\s+content="([^"]*)"\\s+name="${escaped}"\\s*/?>`, "i");
  const raw =
    html.match(patternA)?.[1] ||
    html.match(patternB)?.[1] ||
    html.match(patternC)?.[1] ||
    html.match(patternD)?.[1] ||
    null;
  return raw == null ? null : decodeEntities(raw);
}

function countH1(html) {
  const m = html.match(/<h1[\s>]/gi);
  return m ? m.length : 0;
}

function countSchemaBlocks(html) {
  const m = html.match(/<script\s+type="application\/ld\+json"\s*>/gi);
  return m ? m.length : 0;
}

function parseSchemaBlocks(html) {
  const out = [];
  const re = /<script\s+type="application\/ld\+json"\s*>([\s\S]*?)<\/script>/gi;
  let match;
  while ((match = re.exec(html)) !== null) {
    try {
      const parsed = JSON.parse(match[1]);
      out.push({ ok: true, data: parsed });
    } catch (err) {
      out.push({ ok: false, err: err.message });
    }
  }
  return out;
}

function approxBodyWords(html) {
  const bodyMatch = html.match(/<body[\s\S]*?<\/body>/i);
  if (!bodyMatch) return 0;
  let body = bodyMatch[0];
  body = body.replace(/<script[\s\S]*?<\/script>/gi, " ");
  body = body.replace(/<style[\s\S]*?<\/style>/gi, " ");
  body = body.replace(/<[^>]+>/g, " ");
  body = decodeEntities(body);
  body = body.replace(/\s+/g, " ").trim();
  return body ? body.split(" ").filter(Boolean).length : 0;
}

function isStrictPath(rel) {
  return STRICT_PATHS.some((re) => re.test(rel));
}

function expectedCanonicalForRel(rel) {
  if (rel === "index.html") return DOMAIN + "/";
  if (rel.endsWith("/index.html")) {
    const dir = rel.slice(0, -"index.html".length);
    return DOMAIN + "/" + dir;
  }
  return DOMAIN + "/" + rel;
}

function main() {
  const issues = [];
  const files = listFilesRecursive(ROOT);
  const htmlFiles = files.filter((f) => f.endsWith(`${path.sep}index.html`));
  const byCanonical = new Map();
  const titleCounts = new Map();
  const descCounts = new Map();

  // Sitemap presence + every loc file exists
  const sitemapPath = path.join(ROOT, "sitemap.xml");
  if (!fs.existsSync(sitemapPath)) {
    issues.push("Missing sitemap.xml");
  } else {
    const sitemap = fs.readFileSync(sitemapPath, "utf8");
    const locRegex = /<loc>([^<]+)<\/loc>/gi;
    let locMatch;
    while ((locMatch = locRegex.exec(sitemap)) !== null) {
      const loc = locMatch[1].trim();
      const localPath = urlToLocalPath(loc);
      if (!localPath || !fs.existsSync(localPath)) {
        issues.push(`SITEMAP_MISSING_FILE: ${loc}`);
      }
    }
  }

  for (const filePath of htmlFiles) {
    const rel = toPosix(path.relative(ROOT, filePath));
    if (rel.startsWith("seo/") || rel.startsWith("notpush/")) continue;
    const html = fs.readFileSync(filePath, "utf8");

    const title = parseTitle(html);
    const description = parseMetaContent(html, "description");
    const canonical = parseCanonical(html);
    const hreflangs = parseHreflangLinks(html);
    const h1Count = countH1(html);
    const schemaBlocks = parseSchemaBlocks(html);
    const bodyWords = approxBodyWords(html);

    // Title checks
    if (!title) {
      issues.push(`MISSING_TITLE: ${rel}`);
    } else {
      if (title.length > TITLE_MAX) {
        issues.push(`TITLE_TOO_LONG: ${rel} -> ${title.length} chars`);
      }
      titleCounts.set(title, (titleCounts.get(title) || []).concat(rel));
    }

    // Description checks (strict for content pages, soft elsewhere)
    if (!description) {
      issues.push(`MISSING_DESCRIPTION: ${rel}`);
    } else {
      if (description.length > DESC_MAX) {
        issues.push(`DESC_TOO_LONG: ${rel} -> ${description.length} chars`);
      }
      if (description.length < DESC_MIN && isStrictPath(rel)) {
        issues.push(`DESC_TOO_SHORT_STRICT: ${rel} -> ${description.length} chars (need ${DESC_MIN}-${DESC_MAX})`);
      }
      descCounts.set(description, (descCounts.get(description) || []).concat(rel));
    }

    // Canonical
    if (!canonical) {
      issues.push(`MISSING_CANONICAL: ${rel}`);
    } else {
      byCanonical.set(canonical, {
        file: rel,
        links: new Set(hreflangs.map((item) => item.href)),
      });
      // For strict pages, verify canonical matches expected URL
      if (isStrictPath(rel)) {
        const expected = expectedCanonicalForRel(rel);
        if (canonical !== expected) {
          issues.push(`CANONICAL_MISMATCH: ${rel} -> canonical=${canonical} expected=${expected}`);
        }
      }
    }

    if (rel.startsWith("blog/") && hreflangs.length === 0) {
      issues.push(`MISSING_BLOG_HREFLANG: ${rel}`);
    }

    // Hreflang resolves
    for (const link of hreflangs) {
      try {
        const url = new URL(link.href);
        if (url.host !== DOMAIN_HOST) continue;
      } catch {
        issues.push(`INVALID_HREFLANG_URL: ${rel} -> ${link.href}`);
        continue;
      }
      const targetPath = urlToLocalPath(link.href);
      if (!targetPath || !fs.existsSync(targetPath)) {
        issues.push(`BROKEN_HREFLANG_TARGET: ${rel} -> ${link.lang} -> ${link.href}`);
      }
    }

    // OG/Twitter image absolute
    const ogImage = parseMetaContent(html, "og:image");
    if (ogImage && !isAbsoluteHttpUrl(ogImage)) {
      issues.push(`RELATIVE_OG_IMAGE: ${rel} -> ${ogImage}`);
    }
    const twitterImage = parseMetaContent(html, "twitter:image") || parseMetaContent(html, "twitter:image:src");
    if (twitterImage && !isAbsoluteHttpUrl(twitterImage)) {
      issues.push(`RELATIVE_TWITTER_IMAGE: ${rel} -> ${twitterImage}`);
    }

    // H1 (one only)
    if (h1Count !== 1) {
      issues.push(`H1_COUNT: ${rel} -> ${h1Count} (need 1)`);
    }

    // Schema count
    if (schemaBlocks.length < SCHEMA_MIN) {
      issues.push(`TOO_FEW_SCHEMAS: ${rel} -> ${schemaBlocks.length} (need ${SCHEMA_MIN}+)`);
    }
    for (const block of schemaBlocks) {
      if (!block.ok) {
        issues.push(`SCHEMA_INVALID_JSON: ${rel} -> ${block.err}`);
      }
    }

    // Body word count (strict pages only)
    if (isStrictPath(rel) && bodyWords < BODY_WORDS_MIN) {
      issues.push(`BODY_TOO_SHORT_STRICT: ${rel} -> ${bodyWords} words (need ${BODY_WORDS_MIN}+)`);
    }
  }

  // Reciprocal hreflang
  for (const [canonical, source] of byCanonical.entries()) {
    for (const target of source.links) {
      if (!target.startsWith(DOMAIN)) continue;
      if (!byCanonical.has(target)) continue;
      if (target === canonical) continue;
      const targetLinks = byCanonical.get(target).links;
      if (!targetLinks.has(canonical)) {
        issues.push(`NON_RECIPROCAL_HREFLANG: ${source.file} (${canonical}) -> ${target} has no return link`);
      }
    }
  }

  // Duplicate titles / descriptions across pages
  for (const [title, paths] of titleCounts.entries()) {
    if (paths.length > 1) {
      issues.push(`DUPLICATE_TITLE: "${title.slice(0, 60)}…" -> ${paths.join(", ")}`);
    }
  }
  for (const [desc, paths] of descCounts.entries()) {
    if (paths.length > 1) {
      issues.push(`DUPLICATE_DESCRIPTION: "${desc.slice(0, 60)}…" -> ${paths.join(", ")}`);
    }
  }

  if (issues.length === 0) {
    console.log("SEO validation passed: no issues found.");
    process.exit(0);
  }

  console.log(`SEO validation failed: ${issues.length} issue(s).`);
  for (const issue of issues) {
    console.log(`- ${issue}`);
  }
  process.exit(1);
}

main();

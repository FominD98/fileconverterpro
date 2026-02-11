const fs = require("fs");
const path = require("path");

const ROOT = process.cwd();
const DOMAIN = "https://fileconverter.store";
const DOMAIN_HOST = new URL(DOMAIN).host;

function toPosix(value) {
  return value.split(path.sep).join("/");
}

function listFilesRecursive(dir) {
  const out = [];
  for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
    if (entry.name === ".git" || entry.name === ".idea" || entry.name === ".claude") {
      continue;
    }
    const fullPath = path.join(dir, entry.name);
    if (entry.isDirectory()) {
      out.push(...listFilesRecursive(fullPath));
    } else {
      out.push(fullPath);
    }
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

  return (
    html.match(patternA)?.[1] ||
    html.match(patternB)?.[1] ||
    html.match(patternC)?.[1] ||
    html.match(patternD)?.[1] ||
    null
  );
}

function main() {
  const issues = [];
  const files = listFilesRecursive(ROOT);
  const htmlFiles = files.filter((f) => f.endsWith(`${path.sep}index.html`));
  const byCanonical = new Map();

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
    const html = fs.readFileSync(filePath, "utf8");
    const canonical = parseCanonical(html);
    const hreflangs = parseHreflangLinks(html);

    if (!canonical) {
      issues.push(`MISSING_CANONICAL: ${rel}`);
    } else {
      byCanonical.set(canonical, {
        file: rel,
        links: new Set(hreflangs.map((item) => item.href)),
      });
    }

    if (rel.startsWith("blog/") && hreflangs.length === 0) {
      issues.push(`MISSING_BLOG_HREFLANG: ${rel}`);
    }

    for (const link of hreflangs) {
      try {
        const url = new URL(link.href);
        if (url.host !== DOMAIN_HOST) {
          continue;
        }
      } catch {
        issues.push(`INVALID_HREFLANG_URL: ${rel} -> ${link.href}`);
        continue;
      }

      const targetPath = urlToLocalPath(link.href);
      if (!targetPath || !fs.existsSync(targetPath)) {
        issues.push(`BROKEN_HREFLANG_TARGET: ${rel} -> ${link.lang} -> ${link.href}`);
      }
    }

    const ogImage = parseMetaContent(html, "og:image");
    if (ogImage && !isAbsoluteHttpUrl(ogImage)) {
      issues.push(`RELATIVE_OG_IMAGE: ${rel} -> ${ogImage}`);
    }

    const twitterImage =
      parseMetaContent(html, "twitter:image") ||
      parseMetaContent(html, "twitter:image:src");
    if (twitterImage && !isAbsoluteHttpUrl(twitterImage)) {
      issues.push(`RELATIVE_TWITTER_IMAGE: ${rel} -> ${twitterImage}`);
    }
  }

  for (const [canonical, source] of byCanonical.entries()) {
    for (const target of source.links) {
      if (!target.startsWith(DOMAIN)) continue;
      if (!byCanonical.has(target)) continue;
      if (target === canonical) continue;

      const targetLinks = byCanonical.get(target).links;
      if (!targetLinks.has(canonical)) {
        issues.push(
          `NON_RECIPROCAL_HREFLANG: ${source.file} (${canonical}) -> ${target} has no return link`
        );
      }
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

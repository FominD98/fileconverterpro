const fs = require("fs");
const path = require("path");

const ROOT = process.cwd();
const DOMAIN = "https://fileconverter.store";
const BLOG_DIR = path.join(ROOT, "blog");
const KNOWN_LANGS = new Set([
  "en",
  "ru",
  "es",
  "fr",
  "de",
  "it",
  "pt",
  "pl",
  "nl",
  "tr",
  "uk",
  "ja",
  "ko",
  "zh",
  "ar",
  "hi",
]);
const LANG_ORDER = [
  "ru",
  "en",
  "es",
  "fr",
  "de",
  "it",
  "pt",
  "pl",
  "nl",
  "tr",
  "uk",
  "ja",
  "ko",
  "zh",
  "ar",
  "hi",
];

function toPosix(value) {
  return value.split(path.sep).join("/");
}

function escapeRegExp(value) {
  return value.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
}

function listFilesRecursive(dir) {
  const out = [];
  for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
    const fullPath = path.join(dir, entry.name);
    if (entry.isDirectory()) {
      out.push(...listFilesRecursive(fullPath));
    } else {
      out.push(fullPath);
    }
  }
  return out;
}

function getBlogEntry(filePath) {
  const rel = toPosix(path.relative(ROOT, filePath));
  if (!rel.startsWith("blog/") || !rel.endsWith("/index.html")) {
    return null;
  }

  let rest = rel.slice("blog/".length);
  let lang = "ru";

  const langMatch = rest.match(/^([a-z]{2})\/(.*)$/);
  if (langMatch && KNOWN_LANGS.has(langMatch[1]) && langMatch[1] !== "ru") {
    lang = langMatch[1];
    rest = langMatch[2];
  }

  if (rest === "index.html") {
    return {
      filePath,
      lang,
      clusterKey: "",
      routePath: lang === "ru" ? "/blog/" : `/blog/${lang}/`,
    };
  }

  if (!rest.endsWith("/index.html")) {
    return null;
  }

  const routeSuffix = rest.slice(0, -"/index.html".length).replace(/^\/+|\/+$/g, "");
  if (!routeSuffix) {
    return null;
  }

  return {
    filePath,
    lang,
    clusterKey: routeSuffix,
    routePath: lang === "ru" ? `/blog/${routeSuffix}/` : `/blog/${lang}/${routeSuffix}/`,
  };
}

function sortLangs(a, b) {
  const ai = LANG_ORDER.indexOf(a);
  const bi = LANG_ORDER.indexOf(b);
  const av = ai === -1 ? 999 : ai;
  const bv = bi === -1 ? 999 : bi;
  if (av !== bv) return av - bv;
  return a.localeCompare(b);
}

function getMetaContent(html, attrName, attrValue) {
  const a = escapeRegExp(attrValue);
  const r1 = new RegExp(`<meta\\s+${attrName}="${a}"\\s+content="([^"]*)"\\s*/?>`, "i");
  const r2 = new RegExp(`<meta\\s+content="([^"]*)"\\s+${attrName}="${a}"\\s*/?>`, "i");
  const m1 = html.match(r1);
  if (m1) return m1[1];
  const m2 = html.match(r2);
  if (m2) return m2[1];
  return null;
}

function hasMetaTag(html, attrName, attrValue) {
  const a = escapeRegExp(attrValue);
  const r1 = new RegExp(`<meta\\s+${attrName}="${a}"\\s+content="[^"]*"\\s*/?>`, "i");
  const r2 = new RegExp(`<meta\\s+content="[^"]*"\\s+${attrName}="${a}"\\s*/?>`, "i");
  return r1.test(html) || r2.test(html);
}

function upsertMetaTag(html, attrName, attrValue, content) {
  const a = escapeRegExp(attrValue);
  const c = content.replace(/"/g, "&quot;");
  const r1 = new RegExp(`<meta\\s+${attrName}="${a}"\\s+content="[^"]*"\\s*/?>`, "gi");
  const r2 = new RegExp(`<meta\\s+content="[^"]*"\\s+${attrName}="${a}"\\s*/?>`, "gi");
  const replacement = `<meta ${attrName}="${attrValue}" content="${c}">`;

  let out = html.replace(r1, replacement);
  out = out.replace(r2, replacement);
  if (out !== html) return out;

  if (/<link\s+rel="canonical"\s+href="[^"]*"\s*\/?>/i.test(out)) {
    return out.replace(
      /<link\s+rel="canonical"\s+href="[^"]*"\s*\/?>/i,
      (m) => `${m}\n    ${replacement}`
    );
  }
  return out.replace(/<\/head>/i, `    ${replacement}\n</head>`);
}

function setCanonical(html, canonicalUrl) {
  if (/<link\s+rel="canonical"\s+href="[^"]*"\s*\/?>/i.test(html)) {
    return html.replace(
      /<link\s+rel="canonical"\s+href="[^"]*"\s*\/?>/i,
      `<link rel="canonical" href="${canonicalUrl}">`
    );
  }
  return html.replace(/<\/head>/i, `    <link rel="canonical" href="${canonicalUrl}">\n</head>`);
}

function setHreflangBlock(html, alternateLinks) {
  const cleaned = html.replace(
    /\n?\s*<link\s+rel="alternate"\s+hreflang="[^"]+"\s+href="[^"]*"\s*\/?>\s*/gi,
    "\n"
  );

  const block = alternateLinks
    .map((item) => `    <link rel="alternate" hreflang="${item.lang}" href="${item.href}">`)
    .join("\n");

  if (/<link\s+rel="canonical"\s+href="[^"]*"\s*\/?>/i.test(cleaned)) {
    return cleaned.replace(
      /<link\s+rel="canonical"\s+href="[^"]*"\s*\/?>/i,
      (m) => `${m}\n${block}`
    );
  }
  return cleaned.replace(/<\/head>/i, `${block}\n</head>`);
}

function absolutizeUrl(url, baseUrl) {
  if (!url) return url;
  if (url.startsWith("http://") || url.startsWith("https://")) return url;
  if (url.startsWith("//")) return `https:${url}`;
  try {
    return new URL(url, baseUrl).href;
  } catch {
    return url;
  }
}

function buildAlternateMap(entries) {
  const clusterMap = new Map();
  for (const entry of entries) {
    if (!clusterMap.has(entry.clusterKey)) {
      clusterMap.set(entry.clusterKey, new Map());
    }
    clusterMap.get(entry.clusterKey).set(entry.lang, entry);
  }

  const byFile = new Map();
  for (const langMap of clusterMap.values()) {
    const langs = Array.from(langMap.keys()).sort(sortLangs);
    const xDefaultLang = langs.includes("en")
      ? "en"
      : langs.includes("ru")
        ? "ru"
        : langs[0];
    const xDefaultHref = `${DOMAIN}${langMap.get(xDefaultLang).routePath}`;

    for (const lang of langs) {
      const entry = langMap.get(lang);
      const links = langs.map((altLang) => ({
        lang: altLang,
        href: `${DOMAIN}${langMap.get(altLang).routePath}`,
      }));
      links.push({ lang: "x-default", href: xDefaultHref });
      byFile.set(entry.filePath, links);
    }
  }
  return byFile;
}

function main() {
  if (!fs.existsSync(BLOG_DIR)) {
    throw new Error(`Blog folder not found: ${BLOG_DIR}`);
  }

  const files = listFilesRecursive(BLOG_DIR).filter((f) => f.endsWith(`${path.sep}index.html`));
  const entries = files.map(getBlogEntry).filter(Boolean);
  const alternatesByFile = buildAlternateMap(entries);

  let changedCount = 0;
  for (const entry of entries) {
    const canonicalUrl = `${DOMAIN}${entry.routePath}`;
    const alternateLinks = alternatesByFile.get(entry.filePath) || [
      { lang: entry.lang, href: canonicalUrl },
      { lang: "x-default", href: canonicalUrl },
    ];

    const original = fs.readFileSync(entry.filePath, "utf8");
    let html = original;

    html = setCanonical(html, canonicalUrl);
    html = setHreflangBlock(html, alternateLinks);

    html = upsertMetaTag(html, "property", "og:url", canonicalUrl);
    html = upsertMetaTag(html, "property", "twitter:url", canonicalUrl);

    const ogImage = getMetaContent(html, "property", "og:image");
    if (ogImage) {
      html = upsertMetaTag(html, "property", "og:image", absolutizeUrl(ogImage, canonicalUrl));
    }

    const twitterImageProp = getMetaContent(html, "property", "twitter:image");
    const twitterImageName = getMetaContent(html, "name", "twitter:image");
    if (twitterImageProp) {
      html = upsertMetaTag(
        html,
        "property",
        "twitter:image",
        absolutizeUrl(twitterImageProp, canonicalUrl)
      );
    } else if (twitterImageName) {
      html = upsertMetaTag(
        html,
        "name",
        "twitter:image",
        absolutizeUrl(twitterImageName, canonicalUrl)
      );
    } else if (ogImage) {
      html = upsertMetaTag(
        html,
        "property",
        "twitter:image",
        absolutizeUrl(ogImage, canonicalUrl)
      );
    }

    if (!hasMetaTag(html, "property", "twitter:card")) {
      html = upsertMetaTag(html, "property", "twitter:card", "summary_large_image");
    }

    if (html !== original) {
      fs.writeFileSync(entry.filePath, html, "utf8");
      changedCount += 1;
    }
  }

  console.log(`Processed blog pages: ${entries.length}`);
  console.log(`Updated blog pages: ${changedCount}`);
}

main();

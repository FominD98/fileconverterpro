const fs = require("fs");
const path = require("path");
const vm = require("vm");

const ROOT = process.cwd();
const DOMAIN = "https://fileconverter.store";
const TEMPLATE_PATH = path.join(ROOT, "index.html");
const TRANSLATIONS_PATH = path.join(ROOT, "assets", "js", "translations.js");

const LANG_TO_LOCALE = {
  en: "en-US",
  ru: "ru-RU",
  es: "es-ES",
  fr: "fr-FR",
  de: "de-DE",
  it: "it-IT",
  pt: "pt-PT",
  pl: "pl-PL",
  nl: "nl-NL",
  tr: "tr-TR",
  uk: "uk-UA",
  ja: "ja-JP",
  ko: "ko-KR",
  zh: "zh-CN",
  ar: "ar-SA",
  hi: "hi-IN",
};

function escapeRegExp(value) {
  return value.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
}

function stripHtml(value) {
  if (!value) return "";
  return value.replace(/<[^>]*>/g, " ").replace(/\s+/g, " ").trim();
}

function getNested(obj, key) {
  return key.split(".").reduce((acc, part) => (acc ? acc[part] : undefined), obj);
}

function setHtmlLang(html, langCode) {
  return html.replace(/<html\s+lang="[^"]*">/i, `<html lang="${langCode}">`);
}

function setTitle(html, title) {
  return html.replace(/<title>[\s\S]*?<\/title>/i, `<title>${title}</title>`);
}

function setMetaName(html, name, content) {
  const regex = new RegExp(
    `<meta\\s+name="${escapeRegExp(name)}"\\s+content="[^"]*">`,
    "i"
  );
  return html.replace(regex, `<meta name="${name}" content="${content}">`);
}

function setMetaProperty(html, property, content) {
  const regex = new RegExp(
    `<meta\\s+property="${escapeRegExp(property)}"\\s+content="[^"]*">`,
    "i"
  );
  return html.replace(regex, `<meta property="${property}" content="${content}">`);
}

function setCanonical(html, canonicalUrl) {
  return html.replace(
    /<link\s+rel="canonical"\s+href="[^"]*">/i,
    `<link rel="canonical" href="${canonicalUrl}">`
  );
}

function setSchemaDescription(html, description) {
  return html.replace(
    /"description":\s*"[^"]*"/,
    `"description": "${description.replace(/"/g, '\\"')}"`
  );
}

function setSchemaInLanguage(html, locale) {
  const lang = locale.split("-")[0];
  return html.replace(/"inLanguage":\s*"[^"]*"/, `"inLanguage": "${lang}"`);
}

function normalizePaths(html) {
  let out = html;
  out = out.replace(/(href|src)="assets\//g, '$1="/assets/');
  out = out.replace(/href="blog\//g, 'href="/blog/');
  out = out.replace(/href="index\.html#([a-zA-Z0-9_-]+)"/g, 'href="/#$1"');
  return out;
}

function buildHreflangBlock() {
  const links = Object.keys(LANG_TO_LOCALE)
    .map((code) => `    <link rel="alternate" hreflang="${code}" href="${DOMAIN}/${code}/">`)
    .join("\n");

  return `${links}\n    <link rel="alternate" hreflang="x-default" href="${DOMAIN}/">`;
}

function upsertHreflang(html, canonicalUrl) {
  let out = html.replace(/\n?\s*<link rel="alternate" hreflang="[^"]+" href="[^"]*">\s*/gi, "\n");
  const block = buildHreflangBlock();
  const canonicalRegex = /<link\s+rel="canonical"\s+href="[^"]*">/i;
  const canonicalTag = `<link rel="canonical" href="${canonicalUrl}">`;
  return out.replace(canonicalRegex, `${canonicalTag}\n${block}`);
}

function readTranslations() {
  const source = fs.readFileSync(TRANSLATIONS_PATH, "utf8");
  const sandbox = {};
  vm.runInNewContext(`${source}; this.__translations = translations;`, sandbox);
  if (!sandbox.__translations) {
    throw new Error("translations object not found in assets/js/translations.js");
  }
  return sandbox.__translations;
}

function applyStaticTranslations(html, translation) {
  return html.replace(
    /(<([a-zA-Z0-9]+)\b[^>]*\bdata-i18n="([^"]+)"[^>]*>)([\s\S]*?)(<\/\2>)/g,
    (full, open, _tag, key, _inner, close) => {
      const value = getNested(translation, key);
      if (value === undefined || value === null) {
        return full;
      }
      return `${open}${value}${close}`;
    }
  );
}

function setLanguageOptionLabels(html) {
  const labels = {
    "en-US": "🇬🇧 English",
    "ru-RU": "🇷🇺 Русский",
    "es-ES": "🇪🇸 Español",
    "fr-FR": "🇫🇷 Français",
    "de-DE": "🇩🇪 Deutsch",
    "it-IT": "🇮🇹 Italiano",
    "pt-PT": "🇵🇹 Português",
    "pl-PL": "🇵🇱 Polski",
    "nl-NL": "🇳🇱 Nederlands",
    "tr-TR": "🇹🇷 Türkçe",
    "uk-UA": "🇺🇦 Українська",
    "ja-JP": "🇯🇵 日本語",
    "ko-KR": "🇰🇷 한국어",
    "zh-CN": "🇨🇳 简体中文",
    "ar-SA": "🇸🇦 العربية",
    "hi-IN": "🇮🇳 हिन्दी",
  };

  let out = html;
  for (const [locale, label] of Object.entries(labels)) {
    const regex = new RegExp(
      `<button class="language-option" data-lang="${escapeRegExp(locale)}">[\\s\\S]*?<\\/button>`,
      "g"
    );
    out = out.replace(regex, `<button class="language-option" data-lang="${locale}">${label}</button>`);
  }
  return out;
}

function setCurrentLangBadge(html, langCode) {
  return html.replace(/<span id="currentLang">[^<]*<\/span>/, `<span id="currentLang">${langCode.toUpperCase()}</span>`);
}

function buildLocalizedHtml(template, translations, langCode) {
  const locale = LANG_TO_LOCALE[langCode];
  const t = translations[locale] || translations["en-US"];
  const heroTitle = stripHtml(getNested(t, "hero.title")) || "Offline File Converter";
  const heroSubtitle =
    stripHtml(getNested(t, "hero.subtitle")) ||
    "Convert files locally on Windows with full privacy.";

  const title = `${heroTitle} - File Converter Pro`;
  const description = heroSubtitle;
  const keywords =
    "file converter, pdf converter, image converter, video converter, audio converter, windows converter, offline converter";
  const canonicalUrl = `${DOMAIN}/${langCode}/`;
  const ogLocale = locale.replace("-", "_");

  let html = template;
  html = setHtmlLang(html, langCode);
  html = setTitle(html, title);
  html = setMetaName(html, "title", title);
  html = setMetaName(html, "description", description);
  html = setMetaName(html, "keywords", keywords);
  html = setMetaProperty(html, "og:title", title);
  html = setMetaProperty(html, "og:description", description);
  html = setMetaProperty(html, "og:url", canonicalUrl);
  html = setMetaProperty(html, "og:locale", ogLocale);
  html = setMetaProperty(html, "og:image", `${DOMAIN}/assets/images/og-image.png`);
  html = setMetaProperty(html, "twitter:title", title);
  html = setMetaProperty(html, "twitter:description", description);
  html = setMetaProperty(html, "twitter:url", canonicalUrl);
  html = setMetaProperty(html, "twitter:image", `${DOMAIN}/assets/images/og-image.png`);
  html = setCanonical(html, canonicalUrl);
  html = upsertHreflang(html, canonicalUrl);
  html = setSchemaDescription(html, description);
  html = setSchemaInLanguage(html, locale);
  html = html.replace(/"screenshot":\s*"assets\/images\/screenshot\.png"/, `"screenshot": "${DOMAIN}/assets/images/screenshot.png"`);
  html = setLanguageOptionLabels(html);
  html = setCurrentLangBadge(html, langCode);
  html = applyStaticTranslations(html, t);
  html = normalizePaths(html);

  return html;
}

function buildRootHtml(template, translations) {
  const t = translations["en-US"];
  const heroTitle = stripHtml(getNested(t, "hero.title")) || "Offline File Converter";
  const heroSubtitle =
    stripHtml(getNested(t, "hero.subtitle")) ||
    "Convert files locally on Windows with full privacy.";
  const title = `${heroTitle} - File Converter Pro`;
  const description = heroSubtitle;
  const keywords =
    "file converter, pdf converter, image converter, video converter, audio converter, windows converter, offline converter";
  const canonicalUrl = `${DOMAIN}/`;

  let html = template;
  html = setHtmlLang(html, "en");
  html = setTitle(html, title);
  html = setMetaName(html, "title", title);
  html = setMetaName(html, "description", description);
  html = setMetaName(html, "keywords", keywords);
  html = setMetaProperty(html, "og:title", title);
  html = setMetaProperty(html, "og:description", description);
  html = setMetaProperty(html, "og:url", canonicalUrl);
  html = setMetaProperty(html, "og:locale", "en_US");
  html = setMetaProperty(html, "og:image", `${DOMAIN}/assets/images/og-image.png`);
  html = setMetaProperty(html, "twitter:title", title);
  html = setMetaProperty(html, "twitter:description", description);
  html = setMetaProperty(html, "twitter:url", canonicalUrl);
  html = setMetaProperty(html, "twitter:image", `${DOMAIN}/assets/images/og-image.png`);
  html = setCanonical(html, canonicalUrl);
  html = upsertHreflang(html, canonicalUrl);
  html = setSchemaDescription(html, description);
  html = setSchemaInLanguage(html, "en-US");
  html = html.replace(/"screenshot":\s*"assets\/images\/screenshot\.png"/, `"screenshot": "${DOMAIN}/assets/images/screenshot.png"`);
  html = setLanguageOptionLabels(html);
  html = setCurrentLangBadge(html, "en");
  html = applyStaticTranslations(html, t);
  html = normalizePaths(html);

  return html;
}

function writeUtf8(filePath, content) {
  fs.mkdirSync(path.dirname(filePath), { recursive: true });
  fs.writeFileSync(filePath, content, { encoding: "utf8" });
}

function main() {
  if (!fs.existsSync(TEMPLATE_PATH)) {
    throw new Error(`Template not found: ${TEMPLATE_PATH}`);
  }

  const template = fs.readFileSync(TEMPLATE_PATH, "utf8");
  const translations = readTranslations();

  const rootHtml = buildRootHtml(template, translations);
  writeUtf8(TEMPLATE_PATH, rootHtml);
  console.log("Updated root landing: index.html");

  for (const langCode of Object.keys(LANG_TO_LOCALE)) {
    const localized = buildLocalizedHtml(rootHtml, translations, langCode);
    const outputPath = path.join(ROOT, langCode, "index.html");
    writeUtf8(outputPath, localized);
    console.log(`Generated localized landing: ${langCode}/index.html`);
  }
}

main();

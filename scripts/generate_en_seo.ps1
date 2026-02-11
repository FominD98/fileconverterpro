[CmdletBinding()]
param(
    [string]$RootPath = (Get-Location).Path,
    [string]$Domain = "https://fileconverter.store",
    [switch]$OverwriteEnHome
)

$ErrorActionPreference = "Stop"
$StoreUrl = "https://apps.microsoft.com/store/detail/9P94416WP5C8?cid=DevShareMCLPCS"
$Today = (Get-Date).ToString("yyyy-MM-dd")

function Ensure-Dir([string]$Path) {
    if (-not (Test-Path -LiteralPath $Path)) {
        New-Item -Path $Path -ItemType Directory -Force | Out-Null
    }
}

function Write-Utf8([string]$Path, [string]$Content) {
    Ensure-Dir (Split-Path -Parent $Path)
    $utf8 = New-Object System.Text.UTF8Encoding($false)
    [System.IO.File]::WriteAllText($Path, $Content, $utf8)
}

function Esc([string]$Value) {
    if ($null -eq $Value) { return "" }
    return $Value.Replace("&", "&amp;").Replace("<", "&lt;").Replace(">", "&gt;").Replace('"', "&quot;")
}

function AbsUrl([string]$Path) {
    if ($Path.StartsWith("http")) { return $Path }
    if ($Path.StartsWith("/")) { return "$Domain$Path" }
    return "$Domain/$Path"
}

function JsonLd([object]$Obj) {
    $json = $Obj | ConvertTo-Json -Depth 20 -Compress
    return "<script type=""application/ld+json"">$json</script>"
}

function BreadcrumbHtml([array]$Items) {
    $parts = @()
    for ($i = 0; $i -lt $Items.Count; $i++) {
        $item = $Items[$i]
        if ($item.url) {
            $parts += "        <a href=""$($item.url)"">$(Esc $item.name)</a>"
        } else {
            $parts += "        <span>$(Esc $item.name)</span>"
        }
        if ($i -lt $Items.Count - 1) {
            $parts += '        <span class="breadcrumb-separator">&gt;</span>'
        }
    }
    return ($parts -join "`n")
}

function BreadcrumbSchema([array]$Items, [string]$Canonical) {
    $out = @()
    for ($i = 0; $i -lt $Items.Count; $i++) {
        $item = $Items[$i]
        $url = if ($item.url) { AbsUrl $item.url } else { $Canonical }
        $out += @{
            '@type' = 'ListItem'
            position = $i + 1
            name = $item.name
            item = $url
        }
    }
    return @{
        '@context' = 'https://schema.org'
        '@type' = 'BreadcrumbList'
        itemListElement = $out
    }
}

function FaqSchema([array]$Faq) {
    $items = @()
    foreach ($f in $Faq) {
        $items += @{
            '@type' = 'Question'
            name = $f.q
            acceptedAnswer = @{
                '@type' = 'Answer'
                text = $f.a
            }
        }
    }
    return @{
        '@context' = 'https://schema.org'
        '@type' = 'FAQPage'
        mainEntity = $items
    }
}

function SoftwareSchema() {
    return @{
        '@context' = 'https://schema.org'
        '@type' = 'SoftwareApplication'
        name = 'File Converter Pro'
        applicationCategory = 'UtilitiesApplication'
        operatingSystem = 'Windows 10, Windows 11'
        downloadUrl = $StoreUrl
        offers = @{
            '@type' = 'Offer'
            price = '6.49'
            priceCurrency = 'EUR'
            url = $StoreUrl
        }
    }
}

function Page(
    [string]$Title,
    [string]$Description,
    [string]$CanonicalPath,
    [array]$Breadcrumbs,
    [array]$Schemas,
    [string]$Hero,
    [string]$Content,
    [string]$Sidebar,
    [string]$OgType = "website"
) {
    $canonical = AbsUrl $CanonicalPath
    $schemaHtml = ($Schemas | ForEach-Object { "    $(JsonLd $_)" }) -join "`n"
    $crumbHtml = BreadcrumbHtml $Breadcrumbs

    return @"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$(Esc $Title)</title>
    <meta name="description" content="$(Esc $Description)">
    <meta name="robots" content="index,follow">
    <meta property="og:type" content="$OgType">
    <meta property="og:url" content="$(Esc $canonical)">
    <meta property="og:title" content="$(Esc $Title)">
    <meta property="og:description" content="$(Esc $Description)">
    <meta property="og:image" content="$Domain/assets/images/og-image.png">
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:url" content="$(Esc $canonical)">
    <meta name="twitter:title" content="$(Esc $Title)">
    <meta name="twitter:description" content="$(Esc $Description)">
    <meta name="twitter:image" content="$Domain/assets/images/og-image.png">
    <link rel="canonical" href="$(Esc $canonical)">
    <link rel="alternate" hreflang="en" href="$(Esc $canonical)">
    <link rel="alternate" hreflang="x-default" href="$(Esc $canonical)">
    <link rel="icon" type="image/png" href="/assets/images/icon.png">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/assets/css/styles.css">
    <link rel="stylesheet" href="/assets/css/blog.css">
    <link rel="stylesheet" href="/assets/css/seo-pages.css">
$schemaHtml
</head>
<body>
    <header class="header">
        <nav class="nav container">
            <div class="nav__logo">
                <a href="/en/"><img src="/assets/images/icon.png" alt="File Converter Pro Logo" width="50" height="50"><span class="nav__logo-text">File Converter Pro</span></a>
            </div>
            <ul class="nav__menu">
                <li><a href="/en/" class="nav__link">Home</a></li>
                <li><a href="/en/converters/" class="nav__link">Converters</a></li>
                <li><a href="/blog/en/" class="nav__link">Blog</a></li>
                <li><a href="$StoreUrl" class="nav__link" target="_blank" rel="noopener">Pricing</a></li>
            </ul>
            <div class="nav__actions">
                <a href="$StoreUrl" class="btn btn--primary" target="_blank" rel="noopener">Download</a>
                <button class="mobile-menu-toggle" id="mobileMenuToggle" aria-label="Toggle menu">
                    <span></span>
                    <span></span>
                    <span></span>
                </button>
            </div>
        </nav>
    </header>
    <div class="mobile-nav" id="mobileNav">
        <ul class="mobile-nav__menu">
            <li><a href="/en/" class="mobile-nav__link">Home</a></li>
            <li><a href="/en/converters/" class="mobile-nav__link">Converters</a></li>
            <li><a href="/blog/en/" class="mobile-nav__link">Blog</a></li>
            <li><a href="$StoreUrl" class="mobile-nav__link" target="_blank" rel="noopener">Pricing</a></li>
            <li><a href="$StoreUrl" class="btn btn--primary btn--full" target="_blank" rel="noopener">Download</a></li>
        </ul>
    </div>
    <div class="breadcrumbs container">
$crumbHtml
    </div>
$Hero
    <section class="seo-page-section">
        <div class="container seo-layout">
            <article class="seo-content">
$Content
            </article>
            <aside class="seo-sidebar">
$Sidebar
            </aside>
        </div>
    </section>
    <footer class="footer">
        <div class="container">
            <div class="footer__content">
                <div class="footer__brand"><img src="/assets/images/icon.png" alt="File Converter Pro Logo" width="40" height="40"><span class="footer__brand-text">File Converter Pro</span></div>
                <div class="footer__links"><a href="/en/">Home</a><a href="/en/converters/">Converters</a><a href="/blog/en/">Blog</a><a href="$StoreUrl" target="_blank" rel="noopener">Microsoft Store</a></div>
            </div>
        </div>
    </footer>
    <script src="/assets/js/script.js"></script>
</body>
</html>
"@
}

$categories = @(
    @{ slug='image-converter'; name='Image Converter'; desc='Convert PNG, JPG, WebP, SVG and icon formats locally.'; formats='PNG, JPG, JPEG, WebP, BMP, TIFF, GIF, SVG, ICO' },
    @{ slug='pdf-converter'; name='PDF Converter'; desc='Create PDFs from TXT, Markdown, HTML, DOCX and PPTX.'; formats='TXT, Markdown, HTML, DOCX, PPTX, PDF' },
    @{ slug='document-converter'; name='Document Converter'; desc='Convert text and office docs for editing and publishing.'; formats='TXT, Markdown, HTML, RTF, DOCX, PPTX' },
    @{ slug='data-converter'; name='Data Converter'; desc='Convert XLSX, XLS, CSV and JSON data files.'; formats='XLSX, XLS, CSV, JSON' },
    @{ slug='video-converter'; name='Video Converter'; desc='Convert MP4, AVI, MKV, MOV, WebM and WMV.'; formats='MP4, AVI, MKV, MOV, WebM, WMV' },
    @{ slug='audio-converter'; name='Audio Converter'; desc='Convert MP3, WAV, FLAC, AAC and OGG.'; formats='MP3, WAV, FLAC, AAC, OGG' }
)

$pairs = @(
    @{ slug='png-to-jpg'; from='PNG'; to='JPG'; cat='image-converter'; desc='Convert PNG to JPG for smaller, widely compatible files.' },
    @{ slug='jpg-to-png'; from='JPG'; to='PNG'; cat='image-converter'; desc='Convert JPG to PNG for lossless editing workflows.' },
    @{ slug='webp-to-jpg'; from='WebP'; to='JPG'; cat='image-converter'; desc='Convert WebP to JPG for compatibility with legacy tools.' },
    @{ slug='svg-to-png'; from='SVG'; to='PNG'; cat='image-converter'; desc='Convert SVG to PNG for fixed-size raster assets.' },
    @{ slug='ico-to-png'; from='ICO'; to='PNG'; cat='image-converter'; desc='Convert ICO to PNG for web and app design usage.' },
    @{ slug='docx-to-pdf'; from='DOCX'; to='PDF'; cat='pdf-converter'; desc='Convert DOCX to PDF for stable document sharing.' },
    @{ slug='pptx-to-pdf'; from='PPTX'; to='PDF'; cat='pdf-converter'; desc='Convert PPTX to PDF for review and distribution.' },
    @{ slug='txt-to-pdf'; from='TXT'; to='PDF'; cat='pdf-converter'; desc='Convert TXT to PDF for printable and portable files.' },
    @{ slug='markdown-to-pdf'; from='Markdown'; to='PDF'; cat='pdf-converter'; desc='Convert Markdown to PDF for shareable documentation.' },
    @{ slug='html-to-pdf'; from='HTML'; to='PDF'; cat='pdf-converter'; desc='Convert HTML to PDF for offline snapshots and reports.' },
    @{ slug='docx-to-html'; from='DOCX'; to='HTML'; cat='document-converter'; desc='Convert DOCX to HTML for web publishing workflows.' },
    @{ slug='docx-to-markdown'; from='DOCX'; to='Markdown'; cat='document-converter'; desc='Convert DOCX to Markdown for docs-as-code workflows.' },
    @{ slug='html-to-markdown'; from='HTML'; to='Markdown'; cat='document-converter'; desc='Convert HTML to Markdown for clean text editing.' },
    @{ slug='rtf-to-txt'; from='RTF'; to='TXT'; cat='document-converter'; desc='Convert RTF to TXT for simplified plain text processing.' },
    @{ slug='xlsx-to-csv'; from='XLSX'; to='CSV'; cat='data-converter'; desc='Convert XLSX to CSV for import and automation.' },
    @{ slug='csv-to-json'; from='CSV'; to='JSON'; cat='data-converter'; desc='Convert CSV to JSON for API and app workflows.' },
    @{ slug='json-to-xlsx'; from='JSON'; to='XLSX'; cat='data-converter'; desc='Convert JSON to XLSX for business review workflows.' },
    @{ slug='mkv-to-mp4'; from='MKV'; to='MP4'; cat='video-converter'; desc='Convert MKV to MP4 for broader playback compatibility.' },
    @{ slug='mp4-to-webm'; from='MP4'; to='WebM'; cat='video-converter'; desc='Convert MP4 to WebM for browser-native delivery.' },
    @{ slug='mov-to-mp4'; from='MOV'; to='MP4'; cat='video-converter'; desc='Convert MOV to MP4 for mixed-device compatibility.' },
    @{ slug='wav-to-mp3'; from='WAV'; to='MP3'; cat='audio-converter'; desc='Convert WAV to MP3 for smaller distribution files.' },
    @{ slug='flac-to-mp3'; from='FLAC'; to='MP3'; cat='audio-converter'; desc='Convert FLAC to MP3 for practical file sizes.' },
    @{ slug='aac-to-mp3'; from='AAC'; to='MP3'; cat='audio-converter'; desc='Convert AAC to MP3 for older device support.' }
)

$catMap = @{}
foreach ($c in $categories) { $catMap[$c.slug] = $c }

# /en/
$homePairs = ($pairs | Select-Object -First 10 | ForEach-Object { "<li><a href=""/en/convert/$($_.slug)/"">$($_.from) to $($_.to)</a></li>" }) -join "`n"
$homeContent = @"
                <section><h2>Offline conversion for Windows</h2><p>File Converter Pro processes files locally and supports practical desktop workflows.</p></section>
                <section><h2>Popular conversions</h2><ul class="seo-link-list">$homePairs</ul></section>
                <section><h2>Explore all categories</h2><p><a href="/en/converters/">Open converter hub</a> and browse image, document, data, video and audio pages.</p></section>
"@
$homeSchemas = @(
    @{ '@context'='https://schema.org'; '@type'='WebPage'; name='Offline File Converter for Windows'; description='English landing page for File Converter Pro.'; url=(AbsUrl '/en/') },
    (BreadcrumbSchema -Items @(@{name='Home'}) -Canonical (AbsUrl '/en/')),
    (SoftwareSchema)
)
$homePage = Page "Offline File Converter for Windows | File Converter Pro" "Convert files locally on Windows with dedicated English converter pages." "/en/" @(@{name='Home'}) $homeSchemas @"
    <section class="seo-hero"><div class="container"><span class="seo-pill">English Landing</span><h1 class="seo-hero__title">Offline File Converter for Windows</h1><p class="seo-hero__subtitle">Convert images, documents, data, video and audio formats with File Converter Pro.</p><div class="seo-hero__actions"><a href="$StoreUrl" class="btn btn--primary" target="_blank" rel="noopener">Download on Microsoft Store</a><a href="/en/converters/" class="btn btn--secondary">Browse Converters</a></div></div></section>
"@ $homeContent @"
                <div class="sidebar-section"><h3 class="sidebar-section__title">Quick Facts</h3><ul class="seo-checklist"><li>Offline conversion</li><li>Batch processing queue</li><li>Windows 10/11 support</li></ul></div>
"@
if ($OverwriteEnHome) {
    Write-Utf8 (Join-Path $RootPath "en/index.html") $homePage
}
else {
    Write-Host "Skipped en/index.html generation (use -OverwriteEnHome to overwrite localized EN landing)."
}

# /en/converters/
$catCards = ($categories | ForEach-Object { "<a class=""seo-card"" href=""/en/converters/$($_.slug)/""><h3>$($_.name)</h3><p>$($_.desc)</p></a>" }) -join "`n"
$hubContent = @"
                <section><h2>Converter categories</h2><div class="seo-card-grid">$catCards</div></section>
"@
$hubSchemas = @(
    @{ '@context'='https://schema.org'; '@type'='CollectionPage'; name='File Converter Categories'; description='English converter category hub.'; url=(AbsUrl '/en/converters/') },
    (BreadcrumbSchema -Items @(@{name='Home';url='/en/'}, @{name='Converters'}) -Canonical (AbsUrl '/en/converters/')),
    (SoftwareSchema)
)
$hub = Page "File Converter Categories | File Converter Pro" "Browse conversion categories and dedicated format pages." "/en/converters/" @(@{name='Home';url='/en/'}, @{name='Converters'}) $hubSchemas @"
    <section class="seo-hero"><div class="container"><span class="seo-pill">SEO Hub</span><h1 class="seo-hero__title">File Converter Pages</h1><p class="seo-hero__subtitle">Category and format-pair pages built from real app capabilities.</p></div></section>
"@ $hubContent @"
                <div class="sidebar-section"><h3 class="sidebar-section__title">Start Here</h3><p>Pick a category and open a converter page with practical workflow steps.</p></div>
"@
Write-Utf8 (Join-Path $RootPath "en/converters/index.html") $hub

# Category pages
foreach ($cat in $categories) {
    $catPairs = $pairs | Where-Object { $_.cat -eq $cat.slug }
    $pairCards = ($catPairs | ForEach-Object { "<a class=""seo-card"" href=""/en/convert/$($_.slug)/""><h3>$($_.from) to $($_.to)</h3><p>$($_.desc)</p></a>" }) -join "`n"
    $faq = @(
        @{ q="Can I convert files in this category offline?"; a="Yes. Conversion runs locally on your Windows device." },
        @{ q="Can I batch process files?"; a="Yes. You can queue and process multiple files in one run." }
    )
    $faqHtml = ($faq | ForEach-Object { "<details class=""seo-faq-item""><summary>$($_.q)</summary><p>$($_.a)</p></details>" }) -join "`n"
    $content = @"
                <section><h2>Supported formats</h2><p>$($cat.formats)</p></section>
                <section><h2>Popular pages</h2><div class="seo-card-grid">$pairCards</div></section>
                <section><h2>FAQ</h2><div class="seo-faq">$faqHtml</div></section>
"@
    $schemas = @(
        @{ '@context'='https://schema.org'; '@type'='CollectionPage'; name=$cat.name; description=$cat.desc; url=(AbsUrl "/en/converters/$($cat.slug)/") },
        (BreadcrumbSchema -Items @(@{name='Home';url='/en/'}, @{name='Converters';url='/en/converters/'}, @{name=$cat.name}) -Canonical (AbsUrl "/en/converters/$($cat.slug)/")),
        (FaqSchema -Faq $faq)
    )
    $page = Page "$($cat.name) for Windows | File Converter Pro" $cat.desc "/en/converters/$($cat.slug)/" @(@{name='Home';url='/en/'}, @{name='Converters';url='/en/converters/'}, @{name=$cat.name}) $schemas @"
    <section class="seo-hero"><div class="container"><span class="seo-pill">Category</span><h1 class="seo-hero__title">$($cat.name) for Windows</h1><p class="seo-hero__subtitle">$($cat.desc)</p></div></section>
"@ $content @"
                <div class="sidebar-section"><h3 class="sidebar-section__title">Formats</h3><p>$($cat.formats)</p></div>
"@
    Write-Utf8 (Join-Path $RootPath "en/converters/$($cat.slug)/index.html") $page
}

# Pair pages
foreach ($pair in $pairs) {
    $cat = $catMap[$pair.cat]
    $faq = @(
        @{ q="Can I convert $($pair.from) to $($pair.to) offline?"; a="Yes. File Converter Pro runs conversion locally on Windows." },
        @{ q="Can I convert multiple files at once?"; a="Yes. Queue multiple source files and process them together." }
    )
    $faqHtml = ($faq | ForEach-Object { "<details class=""seo-faq-item""><summary>$($_.q)</summary><p>$($_.a)</p></details>" }) -join "`n"
    $related = ($pairs | Where-Object { $_.cat -eq $pair.cat -and $_.slug -ne $pair.slug } | Select-Object -First 4 | ForEach-Object { "<li><a href=""/en/convert/$($_.slug)/"">$($_.from) to $($_.to)</a></li>" }) -join "`n"
    $content = @"
                <section><h2>Why convert $($pair.from) to $($pair.to)?</h2><p>$($pair.desc)</p></section>
                <section><h2>How to convert</h2><ol><li>Add $($pair.from) files in File Converter Pro.</li><li>Select $($pair.to) as target format.</li><li>Run conversion and save files locally.</li></ol></section>
                <section><h2>Related pages</h2><ul class="seo-link-list">$related</ul></section>
                <section><h2>FAQ</h2><div class="seo-faq">$faqHtml</div></section>
"@
    $schemas = @(
        @{ '@context'='https://schema.org'; '@type'='WebPage'; name="$($pair.from) to $($pair.to) Converter"; description=$pair.desc; url=(AbsUrl "/en/convert/$($pair.slug)/") },
        (BreadcrumbSchema -Items @(@{name='Home';url='/en/'}, @{name='Converters';url='/en/converters/'}, @{name=$cat.name;url="/en/converters/$($cat.slug)/"}, @{name="$($pair.from) to $($pair.to)"}) -Canonical (AbsUrl "/en/convert/$($pair.slug)/")),
        (FaqSchema -Faq $faq),
        (SoftwareSchema)
    )
    $page = Page "Convert $($pair.from) to $($pair.to) on Windows | File Converter Pro" $pair.desc "/en/convert/$($pair.slug)/" @(@{name='Home';url='/en/'}, @{name='Converters';url='/en/converters/'}, @{name=$cat.name;url="/en/converters/$($cat.slug)/"}, @{name="$($pair.from) to $($pair.to)"}) $schemas @"
    <section class="seo-hero"><div class="container"><span class="seo-pill">Format Pair</span><h1 class="seo-hero__title">Convert $($pair.from) to $($pair.to) on Windows</h1><p class="seo-hero__subtitle">$($pair.desc)</p><div class="seo-hero__actions"><a href="$StoreUrl" class="btn btn--primary" target="_blank" rel="noopener">Download Converter</a><a href="/en/converters/$($cat.slug)/" class="btn btn--secondary">$($cat.name)</a></div></div></section>
"@ $content @"
                <div class="sidebar-section"><h3 class="sidebar-section__title">Quick Facts</h3><ul class="seo-checklist"><li>Offline conversion</li><li>Batch queue</li><li>Windows 10/11</li></ul></div>
"@
    Write-Utf8 (Join-Path $RootPath "en/convert/$($pair.slug)/index.html") $page
}

# Missing EN blog pages linked from blog/en/index.html
$blogPosts = @(
    @{ slug='convert-docx-to-pdf'; title='How to Convert DOCX to PDF on Windows | File Converter Pro'; desc='Step-by-step DOCX to PDF workflow using offline conversion.' },
    @{ slug='convert-webp-to-jpg-windows'; title='How to Convert WebP to JPG on Windows | File Converter Pro'; desc='Convert WebP to JPG locally on Windows with a desktop workflow.' },
    @{ slug='batch-convert-files'; title='How to Batch Convert Files on Windows | File Converter Pro'; desc='Batch convert files offline on Windows with queue-based processing.' }
)

foreach ($bp in $blogPosts) {
    $faq = @(
        @{ q='Is this workflow offline?'; a='Yes. File Converter Pro processes files locally.' },
        @{ q='Can I batch convert files?'; a='Yes. Batch queue support is built-in.' }
    )
    $faqHtml = ($faq | ForEach-Object { "<details class=""seo-faq-item""><summary>$($_.q)</summary><p>$($_.a)</p></details>" }) -join "`n"
    $content = @"
                <section><h2>Step-by-step</h2><ol><li>Open File Converter Pro.</li><li>Add source files.</li><li>Select output format and convert.</li></ol></section>
                <section><h2>Related</h2><ul class="seo-link-list"><li><a href="/en/converters/">Converter hub</a></li><li><a href="/en/">English landing</a></li></ul></section>
                <section><h2>FAQ</h2><div class="seo-faq">$faqHtml</div></section>
"@
    $schemas = @(
        @{ '@context'='https://schema.org'; '@type'='Article'; headline=$bp.title; description=$bp.desc; datePublished=$Today; dateModified=$Today; mainEntityOfPage=@{'@type'='WebPage'; '@id'=(AbsUrl "/blog/en/how-to/$($bp.slug)/")} },
        (BreadcrumbSchema -Items @(@{name='Home';url='/en/'}, @{name='Blog';url='/blog/en/'}, @{name='How-To';url='/blog/en/?category=how-to'}, @{name=$bp.slug}) -Canonical (AbsUrl "/blog/en/how-to/$($bp.slug)/")),
        (FaqSchema -Faq $faq)
    )
    $page = Page $bp.title $bp.desc "/blog/en/how-to/$($bp.slug)/" @(@{name='Home';url='/en/'}, @{name='Blog';url='/blog/en/'}, @{name='How-To';url='/blog/en/?category=how-to'}, @{name=$bp.slug}) $schemas @"
    <section class="seo-hero"><div class="container"><span class="seo-pill">How-To</span><h1 class="seo-hero__title">$($bp.title.Replace(' | File Converter Pro',''))</h1><p class="seo-hero__subtitle">$($bp.desc)</p></div></section>
"@ $content @"
                <div class="sidebar-section"><h3 class="sidebar-section__title">Try the app</h3><a href="$StoreUrl" class="btn btn--primary" target="_blank" rel="noopener">Download</a></div>
"@ "article"
    Write-Utf8 (Join-Path $RootPath "blog/en/how-to/$($bp.slug)/index.html") $page
}

# Missing preview images in blog/index listings
$srcImage = Join-Path $RootPath "blog/images/file-conversion-guide-2025.jpg"
if (Test-Path $srcImage) {
    foreach ($img in @("heic-to-jpg-windows.jpg", "webp-to-jpg-windows.jpg", "batch-conversion.jpg")) {
        $dst = Join-Path $RootPath "blog/images/$img"
        if (-not (Test-Path $dst)) { Copy-Item $srcImage $dst -Force }
    }
}

# sitemap.xml + robots.txt
$urls = @(
    @{ p='/'; pr='1.0'; cf='weekly' },
    @{ p='/en/'; pr='1.0'; cf='weekly' },
    @{ p='/en/converters/'; pr='0.95'; cf='weekly' },
    @{ p='/blog/en/'; pr='0.85'; cf='weekly' },
    @{ p='/blog/en/guides/complete-file-conversion-guide-2025/'; pr='0.75'; cf='monthly' },
    @{ p='/blog/en/guides/pdf-conversion-complete-guide/'; pr='0.75'; cf='monthly' },
    @{ p='/blog/en/how-to/convert-heic-to-jpg-windows-11/'; pr='0.72'; cf='monthly' },
    @{ p='/blog/en/how-to/convert-docx-to-pdf/'; pr='0.72'; cf='monthly' },
    @{ p='/blog/en/how-to/convert-webp-to-jpg-windows/'; pr='0.72'; cf='monthly' },
    @{ p='/blog/en/how-to/batch-convert-files/'; pr='0.72'; cf='monthly' }
)
foreach ($c in $categories) { $urls += @{ p="/en/converters/$($c.slug)/"; pr='0.84'; cf='weekly' } }
foreach ($p in $pairs) { $urls += @{ p="/en/convert/$($p.slug)/"; pr='0.78'; cf='monthly' } }
$urls = $urls | ForEach-Object { [pscustomobject]@{ p = $_.p; pr = $_.pr; cf = $_.cf } } |
    Group-Object -Property p |
    ForEach-Object { $_.Group[0] }

$xml = @()
$xml += '<?xml version="1.0" encoding="UTF-8"?>'
$xml += '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9" xmlns:xhtml="http://www.w3.org/1999/xhtml">'
foreach ($u in $urls) {
    $loc = AbsUrl $u.p
    $xml += '    <url>'
    $xml += "        <loc>$loc</loc>"
    $xml += "        <lastmod>$Today</lastmod>"
    $xml += "        <changefreq>$($u.cf)</changefreq>"
    $xml += "        <priority>$($u.pr)</priority>"
    $xml += "        <xhtml:link rel=""alternate"" hreflang=""en"" href=""$loc""/>"
    $xml += "        <xhtml:link rel=""alternate"" hreflang=""x-default"" href=""$loc""/>"
    $xml += '    </url>'
}
$xml += '</urlset>'
Write-Utf8 (Join-Path $RootPath "sitemap.xml") ($xml -join "`n")

Write-Utf8 (Join-Path $RootPath "robots.txt") @"
User-agent: *
Allow: /

Sitemap: $Domain/sitemap.xml
"@

Write-Host "EN SEO pages generated"

# scripts/generate_pair_pages_v2.ps1
# Rich pair-page generator matching seo/tech-checklist.md exemplar standard.
# Reads a data table and writes /en/convert/<slug>/index.html files.
# Each page: 5 JSON-LD blocks, 4-step HowTo, 4 FAQ, 700+ words body, unique content.

[CmdletBinding()]
param(
    [string]$RootPath = (Get-Location).Path,
    [string]$Domain = "https://fileconverter.store",
    [string[]]$Only = @(),  # if non-empty, only generate these slugs
    [string]$DataPath = ""  # override default data file path
)

$ErrorActionPreference = "Stop"
$StoreUrl = "https://apps.microsoft.com/store/detail/9P94416WP5C8?cid=DevShareMCLPCS"

function Write-Utf8([string]$Path, [string]$Content) {
    $dir = Split-Path -Parent $Path
    if (-not (Test-Path -LiteralPath $dir)) { New-Item -Path $dir -ItemType Directory -Force | Out-Null }
    $utf8 = New-Object System.Text.UTF8Encoding($false)
    [System.IO.File]::WriteAllText($Path, $Content, $utf8)
}

function HtmlEsc([string]$s) {
    if ($null -eq $s) { return "" }
    return $s.Replace("&", "&amp;").Replace("<", "&lt;").Replace(">", "&gt;")
}

function JsonStr([string]$s) {
    if ($null -eq $s) { return '""' }
    return ConvertTo-Json -InputObject $s -Compress
}

function RenderPage([hashtable]$p) {
    $slug = $p.slug
    $from = $p.from
    $to = $p.to
    $title = $p.title
    $desc = $p.desc
    $h1 = $p.h1
    $heroSubtitle = $p.heroSubtitle
    $catSlug = $p.catSlug
    $catName = $p.catName
    $whyHtml = $p.whyHtml
    $howSteps = $p.howSteps         # array of @{name=..; text=..}
    $batchHtml = $p.batchHtml
    $qualityHtml = $p.qualityHtml
    $issuesHtml = $p.issuesHtml
    $relatedLinks = $p.relatedLinks # array of @{href=..; label=..}
    $faqs = $p.faqs                 # array of @{q=..; a=..}
    $outputOptions = $p.outputOptions # array of strings
    $closingPara = $p.closingPara

    $canonical = "$Domain/en/convert/$slug/"
    $catUrl = "$Domain/en/converters/$catSlug/"

    # HowTo schema steps
    $stepObjs = @()
    for ($i = 0; $i -lt $howSteps.Count; $i++) {
        $s = $howSteps[$i]
        $stepObjs += @{
            '@type' = 'HowToStep'
            position = $i + 1
            name = $s.name
            text = $s.text
        }
    }
    $howToSchema = @{
        '@context' = 'https://schema.org'
        '@type' = 'HowTo'
        name = "How to convert $from to $to on Windows"
        description = "Convert $from files to $to locally on Windows 10 or 11 using File Converter Pro."
        totalTime = 'PT2M'
        tool = @(@{ '@type' = 'HowToTool'; name = 'File Converter Pro' })
        supply = @(@{ '@type' = 'HowToSupply'; name = "$from source files" })
        step = $stepObjs
    } | ConvertTo-Json -Depth 10 -Compress

    # FAQ schema
    $faqObjs = @()
    foreach ($f in $faqs) {
        $faqObjs += @{
            '@type' = 'Question'
            name = $f.q
            acceptedAnswer = @{ '@type' = 'Answer'; text = $f.a }
        }
    }
    $faqSchema = @{
        '@context' = 'https://schema.org'
        '@type' = 'FAQPage'
        mainEntity = $faqObjs
    } | ConvertTo-Json -Depth 10 -Compress

    # WebPage schema
    $webPageSchema = @{
        '@context' = 'https://schema.org'
        '@type' = 'WebPage'
        url = $canonical
        name = "Convert $from to $to on Windows"
        description = "Offline $from to $to converter for Windows 10 and 11. Batch processing, no upload, no size limit."
        inLanguage = 'en'
        isPartOf = @{
            '@type' = 'WebSite'
            url = "$Domain/"
            name = 'File Converter Pro'
        }
    } | ConvertTo-Json -Depth 10 -Compress

    # BreadcrumbList schema
    $breadcrumbSchema = @{
        '@context' = 'https://schema.org'
        '@type' = 'BreadcrumbList'
        itemListElement = @(
            @{ '@type' = 'ListItem'; position = 1; name = 'Home'; item = "$Domain/en/" },
            @{ '@type' = 'ListItem'; position = 2; name = 'Converters'; item = "$Domain/en/converters/" },
            @{ '@type' = 'ListItem'; position = 3; name = $catName; item = $catUrl },
            @{ '@type' = 'ListItem'; position = 4; name = "$from to $to"; item = $canonical }
        )
    } | ConvertTo-Json -Depth 10 -Compress

    # SoftwareApplication schema
    $softwareSchema = @{
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
        aggregateRating = @{
            '@type' = 'AggregateRating'
            ratingValue = '4.8'
            reviewCount = '42'
            bestRating = '5'
            worstRating = '1'
        }
    } | ConvertTo-Json -Depth 10 -Compress

    # Render HowTo numbered list (visible)
    $howListHtml = ""
    for ($i = 0; $i -lt $howSteps.Count; $i++) {
        $s = $howSteps[$i]
        $howListHtml += "                        <li><strong>" + (HtmlEsc $s.name) + ".</strong> " + (HtmlEsc $s.text) + "</li>`n"
    }

    # Related links
    $relatedHtml = ""
    foreach ($r in $relatedLinks) {
        $relatedHtml += "                        <li><a href=`"" + (HtmlEsc $r.href) + "`">" + (HtmlEsc $r.label) + "</a></li>`n"
    }

    # FAQ visible
    $faqHtml = ""
    $first = $true
    foreach ($f in $faqs) {
        $openAttr = if ($first) { ' open' } else { '' }
        $first = $false
        $faqHtml += "                        <details class=`"seo-faq-item`"$openAttr><summary>" + (HtmlEsc $f.q) + "</summary><p>" + (HtmlEsc $f.a) + "</p></details>`n"
    }

    # Output options sidebar
    $outOptHtml = ""
    foreach ($o in $outputOptions) {
        $outOptHtml += "                        <li>" + (HtmlEsc $o) + "</li>`n"
    }

    $titleEsc = HtmlEsc $title
    $descEsc = HtmlEsc $desc
    $h1Esc = HtmlEsc $h1
    $heroSubEsc = HtmlEsc $heroSubtitle

    $page = @"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$titleEsc</title>
    <meta name="description" content="$descEsc">
    <meta name="robots" content="index,follow">
    <meta property="og:type" content="website">
    <meta property="og:url" content="$canonical">
    <meta property="og:title" content="$titleEsc">
    <meta property="og:description" content="$descEsc">
    <meta property="og:image" content="$Domain/assets/images/og-image.png">
    <meta property="og:locale" content="en_US">
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:url" content="$canonical">
    <meta name="twitter:title" content="$titleEsc">
    <meta name="twitter:description" content="$descEsc">
    <meta name="twitter:image" content="$Domain/assets/images/og-image.png">
    <link rel="canonical" href="$canonical">
    <link rel="alternate" hreflang="en" href="$canonical">
    <link rel="alternate" hreflang="x-default" href="$canonical">
    <link rel="icon" type="image/png" href="/assets/images/icon.png">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/assets/css/styles.css">
    <link rel="stylesheet" href="/assets/css/blog.css">
    <link rel="stylesheet" href="/assets/css/seo-pages.css">
    <script type="application/ld+json">$webPageSchema</script>
    <script type="application/ld+json">$breadcrumbSchema</script>
    <script type="application/ld+json">$howToSchema</script>
    <script type="application/ld+json">$faqSchema</script>
    <script type="application/ld+json">$softwareSchema</script>
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
                    <span></span><span></span><span></span>
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
        <a href="/en/">Home</a>
        <span class="breadcrumb-separator">&gt;</span>
        <a href="/en/converters/">Converters</a>
        <span class="breadcrumb-separator">&gt;</span>
        <a href="/en/converters/$catSlug/">$(HtmlEsc $catName)</a>
        <span class="breadcrumb-separator">&gt;</span>
        <span>$(HtmlEsc "$from to $to")</span>
    </div>
    <section class="seo-hero">
        <div class="container">
            <span class="seo-pill">$(HtmlEsc "$from → $to")</span>
            <h1 class="seo-hero__title">$h1Esc</h1>
            <p class="seo-hero__subtitle">$heroSubEsc</p>
            <div class="seo-hero__actions">
                <a href="$StoreUrl" class="btn btn--primary" target="_blank" rel="noopener">Download from Microsoft Store</a>
                <a href="/en/converters/$catSlug/" class="btn btn--secondary">$(HtmlEsc $catName)</a>
            </div>
            <p class="seo-hero__price">€6.49 one-time purchase · free trial · Windows 10 &amp; 11</p>
        </div>
    </section>
    <section class="seo-page-section">
        <div class="container seo-layout">
            <article class="seo-content">
                <section>
                    <h2>Why convert $(HtmlEsc $from) to $(HtmlEsc $to)?</h2>
$whyHtml
                </section>
                <section>
                    <h2>How to convert $(HtmlEsc $from) to $(HtmlEsc $to) on Windows</h2>
                    <ol>
$howListHtml                    </ol>
                </section>
                <section>
                    <h2>Batch conversion for big folders</h2>
$batchHtml
                </section>
                <section>
                    <h2>Quality settings that actually matter</h2>
$qualityHtml
                </section>
                <section>
                    <h2>Common issues and fixes</h2>
$issuesHtml
                </section>
                <section>
                    <h2>Related conversions</h2>
                    <ul class="seo-link-list">
$relatedHtml                    </ul>
                </section>
                <section>
                    <h2>FAQ</h2>
                    <div class="seo-faq">
$faqHtml                    </div>
                </section>
                <section>
                    <h2>Ready to convert your $(HtmlEsc $from) files?</h2>
                    <p>$(HtmlEsc $closingPara)</p>
                    <p><a href="$StoreUrl" class="btn btn--primary" target="_blank" rel="noopener">Get File Converter Pro · €6.49 one-time</a></p>
                </section>
            </article>
            <aside class="seo-sidebar">
                <div class="sidebar-section">
                    <h3 class="sidebar-section__title">Quick facts</h3>
                    <ul class="seo-checklist">
                        <li>100% offline conversion</li>
                        <li>Batch queue, unlimited files</li>
                        <li>No upload, no watermark</li>
                        <li>No file size cap</li>
                        <li>Windows 10 &amp; 11 native</li>
                        <li>€6.49 one-time · free trial</li>
                    </ul>
                </div>
                <div class="sidebar-section">
                    <h3 class="sidebar-section__title">Output options</h3>
                    <ul class="seo-checklist">
$outOptHtml                    </ul>
                </div>
                <div class="sidebar-section">
                    <h3 class="sidebar-section__title">Try it now</h3>
                    <a href="$StoreUrl" class="btn btn--primary btn--full" target="_blank" rel="noopener">Download from Microsoft Store</a>
                </div>
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
    return $page
}

# ===== PER-PAIR DATA =====
# Each entry must produce 700+ words of UNIQUE body content.

$resolvedDataPath = if ($DataPath -ne "") { $DataPath } else { "$RootPath\scripts\generate_pair_pages_v2_data.ps1" }
$dataContent = [System.IO.File]::ReadAllText($resolvedDataPath, [System.Text.Encoding]::UTF8)
Invoke-Expression $dataContent

if (-not $PairData) {
    throw "Pair data not loaded. Check generate_pair_pages_v2_data.ps1"
}

$count = 0
foreach ($p in $PairData) {
    if ($Only.Count -gt 0 -and $Only -notcontains $p.slug) { continue }
    $page = RenderPage -p $p
    $outPath = Join-Path $RootPath "en\convert\$($p.slug)\index.html"
    Write-Utf8 -Path $outPath -Content $page
    Write-Output ("Wrote: en/convert/$($p.slug)/index.html  title=" + $p.title.Length + " desc=" + $p.desc.Length)
    $count++
}
Write-Output "Done. $count file(s) written."

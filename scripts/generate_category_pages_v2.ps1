# scripts/generate_category_pages_v2.ps1
# Rich category-page generator matching the /en/converters/image-converter exemplar.

[CmdletBinding()]
param(
    [string]$RootPath = (Get-Location).Path,
    [string]$Domain = "https://fileconverter.store",
    [string[]]$Only = @()
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

function RenderCategoryPage([hashtable]$c) {
    $slug = $c.slug
    $name = $c.name
    $title = $c.title
    $desc = $c.desc
    $h1 = $c.h1
    $heroSubtitle = $c.heroSubtitle
    $introHtml = $c.introHtml
    $formatsHtml = $c.formatsHtml
    $cards = $c.cards               # array of @{href; from; to; blurb}
    $whyHtml = $c.whyHtml
    $workflowsHtml = $c.workflowsHtml
    $faqs = $c.faqs                 # array of @{q; a}
    $sidebarFormats = $c.sidebarFormats # one-line summary
    $closingPara = $c.closingPara

    $canonical = "$Domain/en/converters/$slug/"

    # Schemas
    $collectionSchema = @{
        '@context' = 'https://schema.org'
        '@type' = 'CollectionPage'
        url = $canonical
        name = $name
        description = $heroSubtitle
        inLanguage = 'en'
        isPartOf = @{
            '@type' = 'WebSite'
            url = "$Domain/"
            name = 'File Converter Pro'
        }
    } | ConvertTo-Json -Depth 10 -Compress

    $breadcrumbSchema = @{
        '@context' = 'https://schema.org'
        '@type' = 'BreadcrumbList'
        itemListElement = @(
            @{ '@type' = 'ListItem'; position = 1; name = 'Home'; item = "$Domain/en/" },
            @{ '@type' = 'ListItem'; position = 2; name = 'Converters'; item = "$Domain/en/converters/" },
            @{ '@type' = 'ListItem'; position = 3; name = $name; item = $canonical }
        )
    } | ConvertTo-Json -Depth 10 -Compress

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

    # Cards HTML
    $cardsHtml = ""
    foreach ($card in $cards) {
        $cardsHtml += "                        <a class=`"seo-card`" href=`"$($card.href)`"><h3>$(HtmlEsc $card.from) to $(HtmlEsc $card.to)</h3><p>$(HtmlEsc $card.blurb)</p></a>`n"
    }

    # FAQ
    $faqHtml = ""
    $first = $true
    foreach ($f in $faqs) {
        $openAttr = if ($first) { ' open' } else { '' }
        $first = $false
        $faqHtml += "                        <details class=`"seo-faq-item`"$openAttr><summary>$(HtmlEsc $f.q)</summary><p>$(HtmlEsc $f.a)</p></details>`n"
    }

    # Other categories sidebar
    $otherCats = @(
        @{ slug='image-converter'; name='Image Converter' }
        @{ slug='pdf-converter'; name='PDF Converter' }
        @{ slug='document-converter'; name='Document Converter' }
        @{ slug='data-converter'; name='Data Converter' }
        @{ slug='video-converter'; name='Video Converter' }
        @{ slug='audio-converter'; name='Audio Converter' }
    )
    $otherCatsHtml = ""
    foreach ($oc in $otherCats) {
        if ($oc.slug -eq $slug) { continue }
        $otherCatsHtml += "                        <li><a href=`"/en/converters/$($oc.slug)/`">$($oc.name)</a></li>`n"
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
    <script type="application/ld+json">$collectionSchema</script>
    <script type="application/ld+json">$breadcrumbSchema</script>
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
        <span>$(HtmlEsc $name)</span>
    </div>
    <section class="seo-hero">
        <div class="container">
            <span class="seo-pill">Category</span>
            <h1 class="seo-hero__title">$h1Esc</h1>
            <p class="seo-hero__subtitle">$heroSubEsc</p>
            <div class="seo-hero__actions">
                <a href="$StoreUrl" class="btn btn--primary" target="_blank" rel="noopener">Download from Microsoft Store</a>
                <a href="#popular" class="btn btn--secondary">Browse format pairs</a>
            </div>
        </div>
    </section>
    <section class="seo-page-section">
        <div class="container seo-layout">
            <article class="seo-content">
                <section>
                    <h2>A desktop-grade $(HtmlEsc $name.ToLower()) for Windows</h2>
$introHtml
                </section>
                <section>
                    <h2>Supported formats</h2>
$formatsHtml
                </section>
                <section id="popular">
                    <h2>Popular conversions</h2>
                    <div class="seo-card-grid">
$cardsHtml                    </div>
                </section>
                <section>
                    <h2>Why choose File Converter Pro for $(HtmlEsc $name.ToLower().Replace(' converter','')) conversion</h2>
$whyHtml
                </section>
                <section>
                    <h2>Real-world workflows</h2>
$workflowsHtml
                </section>
                <section>
                    <h2>FAQ</h2>
                    <div class="seo-faq">
$faqHtml                    </div>
                </section>
                <section>
                    <h2>Start converting now</h2>
                    <p>$(HtmlEsc $closingPara)</p>
                    <p><a href="$StoreUrl" class="btn btn--primary" target="_blank" rel="noopener">Download from Microsoft Store · €6.49 one-time</a></p>
                </section>
            </article>
            <aside class="seo-sidebar">
                <div class="sidebar-section">
                    <h3 class="sidebar-section__title">All formats</h3>
                    <p>$(HtmlEsc $sidebarFormats)</p>
                </div>
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
                    <h3 class="sidebar-section__title">Other categories</h3>
                    <ul class="seo-link-list">
$otherCatsHtml                    </ul>
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

# Load data
$dataPath = "$RootPath\scripts\generate_category_pages_v2_data.ps1"
$dataContent = [System.IO.File]::ReadAllText($dataPath, [System.Text.Encoding]::UTF8)
Invoke-Expression $dataContent

if (-not $CategoryData) { throw "CategoryData not loaded" }

$count = 0
foreach ($c in $CategoryData) {
    if ($Only.Count -gt 0 -and $Only -notcontains $c.slug) { continue }
    $page = RenderCategoryPage -c $c
    $outPath = Join-Path $RootPath "en\converters\$($c.slug)\index.html"
    Write-Utf8 -Path $outPath -Content $page
    Write-Output ("Wrote: en/converters/$($c.slug)/index.html  title=" + $c.title.Length + " desc=" + $c.desc.Length)
    $count++
}
Write-Output "Done. $count file(s) written."

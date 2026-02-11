[CmdletBinding()]
param(
    [string]$RootPath = (Get-Location).Path,
    [string]$Domain = "https://fileconverter.store"
)

$ErrorActionPreference = "Stop"
$today = (Get-Date).ToString("yyyy-MM-dd")

$languages = @('en', 'ru', 'es', 'fr', 'de', 'it', 'pt', 'pl', 'nl', 'tr', 'uk', 'ja', 'ko', 'zh', 'ar', 'hi')

function Ensure-Dir {
    param([string]$Path)
    if (-not (Test-Path -LiteralPath $Path)) {
        New-Item -Path $Path -ItemType Directory -Force | Out-Null
    }
}

function Write-Utf8 {
    param(
        [string]$Path,
        [string]$Content
    )
    Ensure-Dir -Path (Split-Path -Parent $Path)
    $utf8NoBom = New-Object System.Text.UTF8Encoding($false)
    [System.IO.File]::WriteAllText($Path, $Content, $utf8NoBom)
}

function To-AbsoluteUrl {
    param([string]$Path)
    if ($Path.StartsWith("http://") -or $Path.StartsWith("https://")) {
        return $Path
    }
    if ($Path.StartsWith("/")) {
        return "$Domain$Path"
    }
    return "$Domain/$Path"
}

function Get-Changefreq {
    param([string]$Path)
    if ($Path -eq '/' -or $Path -match '^/[a-z]{2}/$') { return 'weekly' }
    if ($Path -eq '/en/converters/' -or $Path -eq '/blog/en/') { return 'weekly' }
    if ($Path -match '^/en/converters/[^/]+/$') { return 'weekly' }
    return 'monthly'
}

function Get-Priority {
    param([string]$Path)
    if ($Path -eq '/' -or $Path -eq '/en/') { return '1.0' }
    if ($Path -match '^/[a-z]{2}/$') { return '0.9' }
    if ($Path -eq '/en/converters/') { return '0.95' }
    if ($Path -eq '/blog/en/') { return '0.85' }
    if ($Path -match '^/en/converters/[^/]+/$') { return '0.84' }
    if ($Path -match '^/en/convert/[^/]+/$') { return '0.78' }
    if ($Path -match '^/blog/en/') { return '0.72' }
    return '0.70'
}

$localizedLandingPaths = @()
$localizedLandingPaths += '/'
foreach ($lang in $languages) {
    $filePath = Join-Path $RootPath "$lang/index.html"
    if (Test-Path $filePath) {
        $localizedLandingPaths += "/$lang/"
    }
}

$urls = New-Object System.Collections.Generic.HashSet[string]
foreach ($p in $localizedLandingPaths) {
    [void]$urls.Add($p)
}

$enConvertersRoot = Join-Path $RootPath 'en/converters/index.html'
if (Test-Path $enConvertersRoot) {
    [void]$urls.Add('/en/converters/')
}

$enConvertersDir = Join-Path $RootPath 'en/converters'
if (Test-Path $enConvertersDir) {
    Get-ChildItem -Path $enConvertersDir -Directory | ForEach-Object {
        if (Test-Path (Join-Path $_.FullName 'index.html')) {
            [void]$urls.Add("/en/converters/$($_.Name)/")
        }
    }
}

$enConvertDir = Join-Path $RootPath 'en/convert'
if (Test-Path $enConvertDir) {
    Get-ChildItem -Path $enConvertDir -Directory | ForEach-Object {
        if (Test-Path (Join-Path $_.FullName 'index.html')) {
            [void]$urls.Add("/en/convert/$($_.Name)/")
        }
    }
}

$blogEnDir = Join-Path $RootPath 'blog/en'
if (Test-Path $blogEnDir) {
    Get-ChildItem -Path $blogEnDir -Recurse -File -Filter 'index.html' | ForEach-Object {
        $relative = $_.FullName.Substring($RootPath.Length).TrimStart('\').Replace('\', '/')
        if ($relative -eq 'blog/en/index.html') {
            [void]$urls.Add('/blog/en/')
        }
        else {
            $dirPart = $relative.Substring(0, $relative.Length - 'index.html'.Length).TrimEnd('/')
            [void]$urls.Add("/$dirPart/")
        }
    }
}

$sortedPaths = @($urls) | Sort-Object

$xml = @()
$xml += '<?xml version="1.0" encoding="UTF-8"?>'
$xml += '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9" xmlns:xhtml="http://www.w3.org/1999/xhtml">'

$landingAltUrls = @{}
foreach ($landingPath in $localizedLandingPaths) {
    if ($landingPath -eq '/') {
        continue
    }
    $langCode = $landingPath.Trim('/').ToLowerInvariant()
    $landingAltUrls[$langCode] = To-AbsoluteUrl -Path $landingPath
}

foreach ($path in $sortedPaths) {
    $loc = To-AbsoluteUrl -Path $path
    $changefreq = Get-Changefreq -Path $path
    $priority = Get-Priority -Path $path

    $xml += '    <url>'
    $xml += "        <loc>$loc</loc>"
    $xml += "        <lastmod>$today</lastmod>"
    $xml += "        <changefreq>$changefreq</changefreq>"
    $xml += "        <priority>$priority</priority>"

    if ($path -eq '/' -or $path -match '^/[a-z]{2}/$') {
        foreach ($lang in $languages) {
            if ($landingAltUrls.ContainsKey($lang)) {
                $xml += "        <xhtml:link rel=""alternate"" hreflang=""$lang"" href=""$($landingAltUrls[$lang])""/>"
            }
        }
        $xml += "        <xhtml:link rel=""alternate"" hreflang=""x-default"" href=""$Domain/""/>"
    }
    else {
        $xml += "        <xhtml:link rel=""alternate"" hreflang=""en"" href=""$loc""/>"
        $xml += "        <xhtml:link rel=""alternate"" hreflang=""x-default"" href=""$loc""/>"
    }

    $xml += '    </url>'
}

$xml += '</urlset>'

Write-Utf8 -Path (Join-Path $RootPath 'sitemap.xml') -Content ($xml -join "`n")

$robots = @"
User-agent: *
Allow: /

Sitemap: $Domain/sitemap.xml
"@

Write-Utf8 -Path (Join-Path $RootPath 'robots.txt') -Content $robots

Write-Host "Generated sitemap.xml with $($sortedPaths.Count) URLs"

[CmdletBinding()]
param(
    [string]$RootPath = (Get-Location).Path,
    [string]$Domain = "https://fileconverter.store"
)

$ErrorActionPreference = "Stop"
$today = (Get-Date).ToString("yyyy-MM-dd")

$landingLanguages = @('en', 'ru', 'es', 'fr', 'de', 'it', 'pt', 'pl', 'nl', 'tr', 'uk', 'ja', 'ko', 'zh', 'ar', 'hi')
$langSortOrder = @('ru', 'en', 'es', 'fr', 'de', 'it', 'pt', 'pl', 'nl', 'tr', 'uk', 'ja', 'ko', 'zh', 'ar', 'hi')

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
    if ($Path -eq '/en/converters/' -or $Path -match '^/en/converters/[^/]+/$') { return 'weekly' }
    if ($Path -match '^/en/convert/[^/]+/$') { return 'monthly' }
    if ($Path -match '^/blog(?:/[a-z]{2})?/$') { return 'weekly' }
    if ($Path -match '^/blog(?:/[a-z]{2})?/.+/$') { return 'monthly' }

    return 'monthly'
}

function Get-Priority {
    param([string]$Path)

    if ($Path -eq '/' -or $Path -eq '/en/') { return '1.0' }
    if ($Path -match '^/[a-z]{2}/$') { return '0.9' }
    if ($Path -eq '/en/converters/') { return '0.95' }
    if ($Path -match '^/en/converters/[^/]+/$') { return '0.84' }
    if ($Path -match '^/en/convert/[^/]+/$') { return '0.78' }
    if ($Path -match '^/blog(?:/[a-z]{2})?/$') { return '0.85' }
    if ($Path -match '^/blog(?:/[a-z]{2})?/.+/$') { return '0.72' }

    return '0.70'
}

function Get-LangSortValue {
    param([string]$Lang)
    $idx = [Array]::IndexOf($langSortOrder, $Lang)
    if ($idx -lt 0) { return 999 }
    return $idx
}

function Get-BlogEntryFromRelativePath {
    param([string]$RelativePath)

    $relative = $RelativePath.Replace('\', '/')
    if (-not $relative.StartsWith('blog/')) {
        return $null
    }
    if (-not $relative.EndsWith('/index.html')) {
        return $null
    }

    $afterBlog = $relative.Substring(5)
    $lang = 'ru'
    $rest = $afterBlog

    if ($afterBlog -match '^([a-z]{2})/(.*)$') {
        $candidateLang = $Matches[1].ToLowerInvariant()
        if ($candidateLang -in $landingLanguages -and $candidateLang -ne 'ru') {
            $lang = $candidateLang
            $rest = $Matches[2]
        }
    }

    $langPrefix = if ($lang -eq 'ru') { '/blog/' } else { "/blog/$lang/" }

    if ($rest -eq 'index.html') {
        return [pscustomobject]@{
            Path       = $langPrefix
            Lang       = $lang
            ClusterKey = ''
        }
    }

    if ($rest.EndsWith('/index.html')) {
        $dirPart = $rest.Substring(0, $rest.Length - 'index.html'.Length).TrimEnd('/')
        if (-not $dirPart) {
            return $null
        }
        $path = if ($lang -eq 'ru') {
            "/blog/$dirPart/"
        } else {
            "/blog/$lang/$dirPart/"
        }

        return [pscustomobject]@{
            Path       = $path
            Lang       = $lang
            ClusterKey = $dirPart
        }
    }

    return $null
}

$localizedLandingPaths = @('/')
foreach ($lang in $landingLanguages) {
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

$blogEntries = New-Object System.Collections.Generic.List[object]
$blogDir = Join-Path $RootPath 'blog'
if (Test-Path $blogDir) {
    Get-ChildItem -Path $blogDir -Recurse -File -Filter 'index.html' | ForEach-Object {
        $relative = $_.FullName.Substring($RootPath.Length).TrimStart('\')
        $entry = Get-BlogEntryFromRelativePath -RelativePath $relative
        if ($null -ne $entry) {
            $blogEntries.Add($entry) | Out-Null
            [void]$urls.Add($entry.Path)
        }
    }
}

$landingAltUrls = @{}
foreach ($landingPath in $localizedLandingPaths) {
    if ($landingPath -eq '/') { continue }
    $langCode = $landingPath.Trim('/').ToLowerInvariant()
    $landingAltUrls[$langCode] = To-AbsoluteUrl -Path $landingPath
}

$blogClusters = @{}
foreach ($entry in $blogEntries) {
    if (-not $blogClusters.ContainsKey($entry.ClusterKey)) {
        $blogClusters[$entry.ClusterKey] = @{}
    }
    $blogClusters[$entry.ClusterKey][$entry.Lang] = $entry.Path
}

$blogAlternatesByPath = @{}
foreach ($clusterKey in $blogClusters.Keys) {
    $langToPath = $blogClusters[$clusterKey]
    $langsInCluster = @($langToPath.Keys) | Sort-Object `
        @{ Expression = { Get-LangSortValue -Lang $_ } }, `
        @{ Expression = { $_ } }

    if ($langsInCluster.Count -eq 0) { continue }

    $xDefaultLang = if ($langsInCluster -contains 'en') {
        'en'
    } elseif ($langsInCluster -contains 'ru') {
        'ru'
    } else {
        $langsInCluster[0]
    }
    $xDefaultHref = To-AbsoluteUrl -Path $langToPath[$xDefaultLang]

    foreach ($sourceLang in $langsInCluster) {
        $sourcePath = $langToPath[$sourceLang]
        $alts = New-Object System.Collections.Generic.List[object]

        foreach ($altLang in $langsInCluster) {
            $alts.Add([pscustomobject]@{
                    Lang = $altLang
                    Href = To-AbsoluteUrl -Path $langToPath[$altLang]
                }) | Out-Null
        }
        $alts.Add([pscustomobject]@{
                Lang = 'x-default'
                Href = $xDefaultHref
            }) | Out-Null

        $blogAlternatesByPath[$sourcePath] = $alts
    }
}

$sortedPaths = @($urls) | Sort-Object

$xml = @()
$xml += '<?xml version="1.0" encoding="UTF-8"?>'
$xml += '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9" xmlns:xhtml="http://www.w3.org/1999/xhtml">'

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
        foreach ($lang in $landingLanguages) {
            if ($landingAltUrls.ContainsKey($lang)) {
                $xml += "        <xhtml:link rel=""alternate"" hreflang=""$lang"" href=""$($landingAltUrls[$lang])""/>"
            }
        }
        $xml += "        <xhtml:link rel=""alternate"" hreflang=""x-default"" href=""$Domain/""/>"
    } elseif ($blogAlternatesByPath.ContainsKey($path)) {
        foreach ($alt in $blogAlternatesByPath[$path]) {
            $xml += "        <xhtml:link rel=""alternate"" hreflang=""$($alt.Lang)"" href=""$($alt.Href)""/>"
        }
    } else {
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

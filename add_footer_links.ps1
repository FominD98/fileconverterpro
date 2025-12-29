# Add footer.links structure to translations.js

$file = "assets\js\translations.js"
$content = [System.IO.File]::ReadAllText($file, [System.Text.Encoding]::UTF8)

# Add footer.links structure for all instances
# Pattern: footer: {\n            features: 'xxx',\n            formats: 'xxx',\n            pricing: 'xxx',

$pattern = "(\s+footer: \{\s+)(features: '([^']+)',\s+formats: '([^']+)',\s+pricing: '([^']+)')"

$content = [regex]::Replace($content, $pattern, {
    param($match)
    $indent = $match.Groups[1].Value
    $original = $match.Groups[2].Value
    $features = $match.Groups[3].Value
    $formats = $match.Groups[4].Value
    $pricing = $match.Groups[5].Value

    $links = @"
links: {
                store: 'Microsoft Store',
                features: '$features',
                formats: '$formats',
                pricing: '$pricing'
            },

"@
    return $indent + $links + $original
})

# Save the file
[System.IO.File]::WriteAllText($file, $content, [System.Text.Encoding]::UTF8)

Write-Host "Fixed footer structure!" -ForegroundColor Green
Write-Host "  - Added footer.links wrapper"

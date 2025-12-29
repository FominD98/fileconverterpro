# Fix translations.js structure

$file = "assets\js\translations.js"
$content = [System.IO.File]::ReadAllText($file, [System.Text.Encoding]::UTF8)

# Fix FAQ - change question: to q: and answer: to a:
$content = $content -replace "question: '", "q: '"
$content = $content -replace 'question: "', 'q: "'
$content = $content -replace "answer: '", "a: '"
$content = $content -replace 'answer: "', 'a: "'

# Rename q1-q6 to descriptive names
$content = $content -replace '\bq1:', 'safe:'
$content = $content -replace '\bq2:', 'fileSize:'
$content = $content -replace '\bq3:', 'batch:'
$content = $content -replace '\bq4:', 'internet:'
$content = $content -replace '\bq5:', 'requirements:'
$content = $content -replace '\bq6:', 'trial:'

# Save the file
[System.IO.File]::WriteAllText($file, $content, [System.Text.Encoding]::UTF8)

Write-Host "Fixed translations structure!" -ForegroundColor Green
Write-Host "  - FAQ: question/answer to q/a"
Write-Host "  - FAQ: q1-q6 to safe/fileSize/batch/internet/requirements/trial"

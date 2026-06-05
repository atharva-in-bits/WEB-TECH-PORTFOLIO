# Fix malformed UTF-8 symbols
$content = Get-Content -Path "index.html" -Raw -Encoding UTF8

$fixes = @{
    'â–¼' = '▼'
    'Â·' = '·'
    'â€"' = '—'
    'â€™' = "'"
    'ðŸ"·' = '📷'
    'ðŸ–¥ï¸' = '🖥️'
    'âš™ï¸' = '⚙️'
    'ðŸ"Œ' = '🔌'
    'ðŸŒ' = '🌐'
    'ðŸ'¾' = '💾'
    'ðŸ"¨' = '🔨'
    'âš¡' = '⚡'
    'ðŸ"º' = '📺'
    'ðŸ› ï¸' = '🛠️'
    'ðŸ"''' = '🔐'
    'ðŸ"¦' = '📦'
    'ðŸ'¼' = '👔'
    'ðŸ'¤' = '👤'
    'âœ…' = '✅'
    'ðŸž' = '🐛'
    'ðŸ¤' = '🤝'
    'ðŸ"Š' = '📊'
    'ðŸ'¬' = '💬'
    'ðŸ"' = '📂'
    'ðŸ"ˆ' = '📈'
    'ðŸ"'' = '🔒'
    'ðŸ"±' = '📱'
    'â±ï¸' = '⏰'
    'Â© 2026' = '© 2026'
}

foreach($old in $fixes.Keys) {
    $content = $content -replace [regex]::Escape($old), $fixes[$old]
}

Set-Content -Path "index.html" -Value $content -Encoding UTF8
Write-Host "✅ All weird symbols replaced successfully!"

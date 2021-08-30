if (-Not (Test-Path "$env:APPDATA\lsd")) {
    New-Item -ItemType "directory" -Name "$env:APPDATA\lsd"
}
Push-Location "$env:APPDATA\lsd"

try {
    New-Item -ItemType SymbolicLink -Name config.yaml -Target $HOME/dotfiles/lsd/config.yaml -ea Stop
    echo 'Linked config.yaml'
} catch [Exception] {
    Write-Host 'Failed to link config.yaml: ' -NoNewLine
    Write-Host $_.Exception.Message
}
Pop-Location

Push-Location $env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\LocalState
try {
    New-Item -ItemType SymbolicLink -Name settings.json -Target $HOME/dotfiles/windows-terminal/settings.json -ea Stop
    echo 'Linked settings.json (Windows Terminal Preview)'
} catch [Exception] {
    Write-Host 'Failed to link settings.json (Windows Terminal Preview): ' -NoNewLine
    Write-Host $_.Exception.Message
}
Pop-Location

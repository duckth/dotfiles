Push-Location $env:APPDATA/alacritty
try {
    New-Item -ItemType SymbolicLink -Name alacritty.yml -Target $HOME/dotfiles/alacritty/alacritty.yml -ea Stop
    echo 'Linked alacritty.yml'
} catch [Exception] {
    Write-Host 'Failed to link alacritty.yml: ' -NoNewLine
    Write-Host $_.Exception.Message
}
Pop-Location


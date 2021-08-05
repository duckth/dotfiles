Push-Location $HOME/.config
try {
    New-Item -ItemType SymbolicLink -Name starship.toml -Target C:/Users/andre/dotfiles/starship/starship.toml -ea Stop
    echo 'Linked starship.toml (Starship Terminal)'
} catch [Exception] {
    Write-Host 'Failed to link starship.toml (Starship Terminal): ' -NoNewLine
    Write-Host $_.Exception.Message
}
Pop-Location

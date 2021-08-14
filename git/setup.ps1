Rename-Item -Path .gitconfig.default -NewName .gitconfig
Push-Location $HOME
try {
    New-Item -ItemType SymbolicLink -Name .gitconfig -Target $HOME/dotfiles/git/.gitconfig -ea Stop
    echo 'linked .gitconfig'
} catch [Exception] {
    Write-Host 'Failed to link .gitconfig: ' -NoNewLine
    Write-Host $_.Exception.Message
}
Pop-Location

Push-Location $HOME
try {
    New-Item -ItemType SymbolicLink -Name .vimrc -Target $HOME/dotfiles/vim/.vimrc -ea Stop
    echo 'Linked .vimrc'
} catch [Exception] {
    Write-Host 'Failed to link .vimrc: ' -NoNewLine
    Write-Host $_.Exception.Message
}
Pop-Location

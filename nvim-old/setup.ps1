Push-Location $VIMDIR 
try {
    New-Item -ItemType SymbolicLink -Name init.vim -Target $HOME/dotfiles/nvim/init.vim -ea Stop
    echo 'Linked init.vim'
} catch [Exception] {
    Write-Host 'Failed to link init.vim: ' -NoNewLine
    Write-Host $_.Exception.Message
}
Pop-Location

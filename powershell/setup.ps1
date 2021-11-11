Push-Location 'C:\Program Files\PowerShell\7'
try {
    New-Item -ItemType SymbolicLink -Name profile.ps1 -Target $HOME/dotfiles/powershell/profile.ps1 -ea Stop
    echo 'Linked profile.ps1'
} catch [Exception] {
    Write-Host 'Failed to link profile.ps1: ' -NoNewLine
    Write-Host $_.Exception.Message
}
Pop-Location


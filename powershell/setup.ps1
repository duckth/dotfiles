Push-Location $HOME\Documents\WindowsPowerShell
try {
    New-Item -ItemType SymbolicLink -Name Microsoft.PowerShell_profile.ps1 -Target $HOME/dotfiles/powershell/Microsoft.PowerShell_profile.ps1 -ea Stop
    echo 'Linked Microsoft.PowerShell_profile.ps1'
} catch [Exception] {
    Write-Host 'Failed to link Microsoft.PowerShell_profile.ps1: ' -NoNewLine
    Write-Host $_.Exception.Message
}
Pop-Location


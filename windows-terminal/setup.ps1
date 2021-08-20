$WTDIR = $Env:LocalAppData\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState
if (Test-Path -Path $WTDIR ) { Remove-Item -Path $WTDIR -Force –Recurse }
Push-Location $env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe
try {
    New-Item -ItemType SymbolicLink -Name LocalState -Target $HOME/dotfiles/windows-terminal/settings -ea Stop
    Write-Host 'Linked settings (Windows Terminal Preview)'
}
catch [Exception] {
    Write-Host 'Failed to link settings (Windows Terminal Preview): ' -NoNewLine
    Write-Host $_.Exception.Message
}
Pop-Location

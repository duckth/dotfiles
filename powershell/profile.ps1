# Startup message
$CurUser = (Get-ChildItem Env:\USERNAME).Value

# Dynamic greeting based on current time or luck:
$CurTime = Get-Date -UFormat "%R"
if ($CurTime -le 12) {
  $Greeting = "Good morning, "
}
elseif ($CurTime -gt 12 -and $CurTime -le 19) {
  $Greeting = "Good afternoon, "
}
elseif ($CurTime -gt 19 -or $CurTime -le 3) {
  $Greeting = "Good evening, "
}
$num = Get-Random -Maximum 100
if ($num -eq 69 ) {
  $Greeting = "Go fuck yourself, "
}
Write-Host "Launching Windows PowerShell..."

# Load own custom functions at startup
if ( Test-Path -Path "$env:USERPROFILE\custom-functions-ps" ) {
  $functions = "$env:USERPROFILE\custom-functions-ps"
}

Write-Host "Loaded custom functions." -ForegroundColor Green
Get-ChildItem "$functions\*.ps1" | % { .$_ }

Write-Host -NoNewLine $Greeting
Write-Host "$CurUser" -ForegroundColor Blue
Write-Host ''

#Custom prompt
#function Prompt {

#Write-Host -NoNewline "pwsh "
#Write-Host -NoNewLine "$((Get-Location).Path)" -ForegroundColor Blue
#Write-Host -NoNewLine " ~> " -ForegroundColor Red

#$host.UI.RawUI.WindowTitle = "pwsh >> Current DIR: $((Get-Location).Path)"

#Return " "

#}

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# Useful modules
Set-PsFzfOption -PSReadlineChordReverseHistory 'Ctrl+r'

Import-Module git-aliases -DisableNameChecking

$env:PYTHONIOENCODING = "utf-8"
iex "$(thefuck --alias)"

# Custom variables
$VIMDIR = "$HOME\Appdata\Local\nvim"
$VIMFILE = "$HOME\dotfiles\nvim\init.vim"


# Custom aliases
Set-Alias -Name "path" -Value "Get-PathEnvironmentVariable"
Set-Alias -Name "addpath" -Value "Update-PathEnvironmentVariable"
Set-Alias -Name "grep" -Value "rg"
Set-Alias -Name "vim" -Value "nvim"
Set-Alias -Name "vi" -Value "nvim"
Set-Alias -Name "touch" -Value "New-Item"
Set-Alias -Name "vlc" -Value "C:\Program Files\VideoLAN\VLC\vlc.exe" 
Set-Alias -Name "which" -VALUE "where.exe"
function ll() { lsd -l }





# Starship stuff
Invoke-Expression (&starship init powershell)

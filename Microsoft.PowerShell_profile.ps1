Set-Alias vi nvim

$VIMDIR = "$HOME\Appdata\Local\nvim"
$VIMFILE = "$VIMDIR\init.vim"

function prompt {
    # Abbreviate the path unix-style
    $path = "$(Get-Location)".replace($HOME, "~")

    # Add the path to the prompt in a different style
    Write-Host $path -NoNewline -ForegroundColor Yellow

    # Return the remaining prompt content
    "`r`n$("+"*(Get-Location -Stack).Count)> "
}

# Assumes that alacritty is installed
function elevate {
    Start-Process "alacritty" -Verb RunAs
}

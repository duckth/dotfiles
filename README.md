# terminal-config

These are the files for setting up my terminal.

## Installation

### Prerequisites

See the [wiki](https://github.com/Duckth/dotfiles/wiki/Setting-up-prerequisites) for help

- [Windows Package Manager](https://github.com/microsoft/winget-cli/releases)
- [Chocolatey](https://chocolatey.org/install)
- [Scoop](https://scoop.sh)

### PowerShell 7

```
winget install --id Microsoft.PowerShell -e
```

### Windows Terminal Preview

```
winget install --id Microsoft.WindowsTerminalPreview -e
```

### Starship

```
choco install starship
```

or use Scoop

```
scoop install starship
```

### Neovim

```ps
choco install neovim
```

### vim-plug

```powershell
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
```

Open the vim config file and install the listed plugins with:

```
:PlugInstall
```

### coc.vim (CoC - Conquer of Completion)

Install your wanted packages with

```
:CocInstall <package-name>
```

To find packages, I recommend

```
:CocInstall coc-marketplace
```

Then you can run

```
:CocList marketplace
```

and search for available packages by their name and description.

### Various cli utilities

#### ripgrep

```powershell
choco install ripgrep
```

#### fzf for pwsh

```powershell
choco install fzf
Install-Module -Name PSFzf
```

#### zlocation (z for pwsh)

```powershell
Install-Module -Name ZLocation
```

#### bat (cat clone with highlighting)

```
scoop install bat
```

#### lsd (improved ls)

```
scoop install lsd
```

## Todos

- [ ] Write an installation script (to put these files in the correct places, install dependencies if necessary etc.)

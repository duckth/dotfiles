# terminal-config

These are the files for setting up my terminal.

## Installation for windows

### Prerequisites

- [Windows Package Manager](https://github.com/microsoft/winget-cli/releases) should actually come preinstalled - maybe update "App Installer" from ms store

### PowerShell 7

```
winget install --id Microsoft.PowerShell -e
```

### Starship

```ps
winget install Starship.Starship
```

### Neovim

```ps
winget install Neovim.Neovim
```

### vim-plug

```powershell
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
```

```
:PlugInstall
```
### Various cli utilities

For some of these Cargo is needed, because I don't want chocolatey or scoop if i can be free

Get it here: https://www.rust-lang.org/learn/get-started
#### ripgrep

```powershell
cargo install ripgrep
```

#### lsd (improved ls)

```
cargo install lsd
```

## Linux (Ubuntu 22.04)

### Install Homebrew (linuxbrew)
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
and follow the instructions

### Install pip
To check if already installed:
```bash
python3 -m pip -V
```
if not:
```bash
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py --user
```

### Install Ansible and plugins
```bash
python3 -m pip install --user ansible
```
then
```bash
ansible-galaxy collection install community.general
```

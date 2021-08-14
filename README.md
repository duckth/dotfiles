# terminal-config
These are the files for setting up my terminal.

## Installation
### Neovim
```ps
choco install neovim
```

### vim-plug
```ps
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

### Ripgrep
```
choco install ripgrep
```

## Todos
- [ ] Write an installation script (to put these files in the correct places, install dependencies if necessary etc.)

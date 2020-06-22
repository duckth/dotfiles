# terminal-config
These are the files for setting up my terminal - files such as alacritty config and vim config.

## Installation
### Neovim
At the time of writing, v0.4x is broken on Windows - specifically it is not possible to insert characters utilising the Alt key, such as `{` on Nordic-layout keyboards. Install the pre-release (v0.5x) to fix.
```ps
choco install neovim --pre
```

### vim-plug
```ps
$destination_dir = "$env:USERPROFILE\AppData\Local\nvim\autoload\"
md $destination_dir -Force
$uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
(New-Object Net.WebClient).DownloadFile($uri, $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath("$destination_dir\plug.vim"))
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
:CocInstall marketplace
```
Then you can run
```
:CocList marketplace
```
and search for available packages by their name and description.

At the time of writing, these are the most useful to me:
 - [`coc-rls`](https://github.com/neoclide/coc-rls) (or `coc-rust-analyzer`) for Rust
 - [`coc-tsserver`](https://github.com/neoclide/coc-tsserver) for JavaScript
 - [`coc-snippets`](https://github.com/neoclide/coc-snippets) for great snippet tooling. A great feature is to download VS Code snippet extensions into vim - for example `:CocInstall https://github.com/xabikos/vscode-javascript` to install a lot of JavaScript snippets.

Install all three with:
```
:CocInstall coc-rls coc-snippets coc-tsserver
```

### Ripgrep
```
choco install ripgrep
```

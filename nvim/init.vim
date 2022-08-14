call plug#begin('~/.nvim/plugged')

Plug 'gruvbox-community/gruvbox'
Plug 'tpope/vim-surround'
Plug 'mbbill/undotree'
Plug 'preservim/nerdcommenter'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'folke/which-key.nvim'
Plug 'romgrk/barbar.nvim'
Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.*'}
Plug 'neovim/nvim-lspconfig'
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Language specific
Plug 'PProvost/vim-ps1'
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'pangloss/vim-javascript'
Plug 'uiiaoo/java-syntax.vim'
Plug 'rust-lang/rust.vim'

call plug#end()

set termguicolors

:lua require("nvim-tree").setup()
:lua require("which-key").setup()
:lua require("toggleterm").setup()
:lua require('gitsigns').setup()

colorscheme gruvbox 

set number
set relativenumber

" Indentation settings
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

" File type specific indentation spacings
autocmd FileType javascript set tabstop=2 softtabstop=2
autocmd FileType javascript set shiftwidth=2
autocmd FileType yaml set tabstop=2 softtabstop=2
autocmd FileType yaml set shiftwidth=2

set noswapfile
set undodir=$HOME/.nvim/undodir
set undofile

set incsearch

set nowrap

" Set leader key to space
let mapleader = " "

" Sets search for ripgrep to project root
if executable('rg')
    let g:rg_derive_root='true'
endif

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<CR>
nnoremap <leader>fb <cmd>Telescope git_branches<CR>
nnoremap <leader>fr <cmd>Telescope oldfiles<CR>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" ToggleTerm
nnoremap <leader>tt :ToggleTerm direction="float"<CR>

" Floating LazyGit terminal
nnoremap <leader>gt <cmd>lua require ('utils.term').git_client_toggle()<CR>

" Clear highlights after search
nnoremap <leader><Esc> :noh<CR>

" Remaps for pasting from yank and not delete ( the 0 register)
noremap <Leader>p "0p
noremap <Leader>P "0P
vnoremap <Leader>p "0p

nnoremap + <End>

nnoremap æ :
nnoremap q: :q<CR>

" NvimTree keybinds (leader = space)
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>nr :NvimTreeRefresh<CR>
nnoremap <leader>nf :NvimTreeFocus<CR>
nnoremap <leader>nc :NvimTreeClose<CR>

" Move to previous/next
nnoremap <silent>    <leader>, <Cmd>BufferPrevious<CR>
nnoremap <silent>    <leader>. <Cmd>BufferNext<CR>

" Goto buffer in position...
nnoremap <silent>    <leader>1 <Cmd>BufferGoto 1<CR>
nnoremap <silent>    <leader>2 <Cmd>BufferGoto 2<CR>
nnoremap <silent>    <leader>3 <Cmd>BufferGoto 3<CR>
nnoremap <silent>    <leader>4 <Cmd>BufferGoto 4<CR>
nnoremap <silent>    <leader>5 <Cmd>BufferGoto 5<CR>
nnoremap <silent>    <leader>6 <Cmd>BufferGoto 6<CR>
nnoremap <silent>    <leader>7 <Cmd>BufferGoto 7<CR>
nnoremap <silent>    <leader>8 <Cmd>BufferGoto 8<CR>
nnoremap <silent>    <leader>9 <Cmd>BufferGoto 9<CR>
" Close buffer
nnoremap <silent>    <leader>w <Cmd>BufferClose<CR>

" Close commands
"                          :BufferCloseAllButCurrent
"                          :BufferCloseAllButPinned
"                          :BufferCloseAllButCurrentOrPinned
"                          :BufferCloseBuffersLeft
"                          :BufferCloseBuffersRight
" Magic buffer-picking mode
nnoremap <silent> <leader>bp    <Cmd>BufferPick<CR>
" Sort automatically by...
"
" Other:
" :BarbarEnable - enables barbar (enabled by default)
" :BarbarDisable - very bad command, should never be used


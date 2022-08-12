call plug#begin('~/.nvim/plugged')

Plug 'gruvbox-community/gruvbox'
Plug 'Luxed/ayu-vim'
Plug 'tpope/vim-surround'
Plug 'mbbill/undotree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'folke/which-key.nvim'
Plug 'romgrk/barbar.nvim'
Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.*'}

" Language specific
Plug 'PProvost/vim-ps1'
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'pangloss/vim-javascript'
Plug 'uiiaoo/java-syntax.vim'
Plug 'rust-lang/rust.vim'

call plug#end()

:lua require("nvim-tree").setup()
:lua require("which-key").setup()
:lua require("toggleterm").setup()

set termguicolors
colorscheme gruvbox 

set number
set relativenumber

" Indentation settings
set tabstop=4 softtabstop=4
set shiftwidth=4
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

" Open fzf with Ctrl + p
nnoremap <C-f> :Files<CR>
let $FZF_DEFAULT_COMMAND = 'rg --files'

" Floating LazyGit terminal
nnoremap <leader>gt <cmd>lua require ('utils.term').git_client_toggle()<CR>

" Use tab and shift-tab to navigate coc completions. Enter to use completion.
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Show docs
nnoremap <leader>d :call CocAction('doHover')<CR>
" Jump to definition
nnoremap <leader>gd :call CocAction('jumpDefinition')<CR>

" Clear highlights after search
nnoremap <leader><Esc> :noh<CR>

" Remaps for pasting from yank and not delete ( the 0 register)
noremap <Leader>p "0p
noremap <Leader>P "0P
vnoremap <Leader>p "0p

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
nnoremap <silent> <C-p>    <Cmd>BufferPick<CR>
" Sort automatically by...
"
" Other:
" :BarbarEnable - enables barbar (enabled by default)
" :BarbarDisable - very bad command, should never be used

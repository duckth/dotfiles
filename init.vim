call plug#begin('~/AppData/Local/nvim/plugged')

Plug 'gruvbox-community/gruvbox'
Plug 'tpope/vim-surround'
Plug 'jremmen/vim-ripgrep'
Plug 'mbbill/undotree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'PProvost/vim-ps1'

call plug#end()

colorscheme gruvbox

set number
set relativenumber

" Indentation settings
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set noswapfile
set undodir=$HOME/.nvim/undodir
set undofile

set incsearch

set colorcolumn=80,100
set nowrap

let mapleader = " "

" Automatically insert closing string, brace etc. ( -> ()
"inoremap " ""<left>
"inoremap ' ''<left>
"inoremap ( ()<left>
"inoremap [ []<left>
"inoremap { {}<left>
"inoremap {<CR> {<CR>}<ESC>O
"inoremap {;<CR> {<CR>};<ESC>O
inoremap {<CR> {<CR>}<ESC>O

" Keybinds to copy to and paste from clipboard (Windows only has one clipboard)
vnoremap <leader>y "*y
nnoremap <leader>p "*p

" Keybinds to navigate splits
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Sets search for ripgrep to project root
if executable('rg')
    let g:rg_derive_root='true'
endif

" Use tab and shift-tab to navigate coc completions. Enter to use completion.
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Compile and run Rust project with a keybind
:nnoremap <leader>r :w <bar> !cargo run<CR>

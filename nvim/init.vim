call plug#begin('~/.nvim/plugged')

Plug 'tpope/vim-surround'
Plug 'sainnhe/gruvbox-material'
Plug 'mbbill/undotree'
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'lewis6991/impatient.nvim'
Plug 'terrortylor/nvim-comment'
Plug 'folke/which-key.nvim'
Plug 'eandrju/cellular-automaton.nvim'

call plug#end()

:lua require('impatient')
:lua require('nvim-tree').setup()
:lua require('which-key').setup()
:lua require('nvim_comment').setup()

if has('termguicolors')
  set termguicolors
endif
" For dark version.
set background=dark
" Available values: 'hard', 'medium'(default), 'soft'
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_foreground = 'mix'
" For better performance
let g:gruvbox_material_better_performance = 1
colorscheme gruvbox-material

set number
set relativenumber

" Unix line terminate
set ff=unix

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
autocmd FileType cs set tabstop=4 softtabstop=4
autocmd FileType cs set shiftwidth=4

set noswapfile
set undodir=$HOME/.nvim/undodir
set undofile

set incsearch

set nowrap

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Set leader key to space
let mapleader = " "

if executable('rg')
    let g:rg_derive_root='true'
endif

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<CR>
nnoremap <leader>fb <cmd>Telescope git_branches<CR>
nnoremap <leader>fr <cmd>Telescope oldfiles<CR>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" NvimTree keybinds (leader = space)
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>nr :NvimTreeRefresh<CR>
nnoremap <leader>nf :NvimTreeFocus<CR>
nnoremap <leader>nc :NvimTreeClose<CR>

" Clear highlights after search
nnoremap <leader><Esc> :noh<CR>

" Remaps for pasting from yank and not delete ( the 0 register)
noremap <Leader>p "0p
noremap <Leader>P "0P
vnoremap <Leader>p "0p

" Select all with space+a
nnoremap <Leader>a ggVG

" end of line right next to start of line!
noremap + <End>

" rebind æ to : because it makes writing commands faster
nnoremap æ :

" rebind q: becuase i always hit it when trying to quti
nnoremap q: :q<CR>

" save on leader+s
noremap <leader>s :w<CR>

nnoremap <leader>fml <cmd>CellularAutomaton make_it_rain<CR>


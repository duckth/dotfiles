call plug#begin('~/.vim/plugged')

Plug 'gruvbox-community/gruvbox'
Plug 'tpope/vim-surround'
Plug 'sainnhe/gruvbox-material'
Plug 'mbbill/undotree'
Plug 'jiangmiao/auto-pairs'
Plug 'rhysd/conflict-marker.vim'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()


" Weird ass hack to fix colors in tmux
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set termguicolors

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
set undodir=$HOME/.vim/undodir
set undofile

set incsearch

set nowrap

" disable the default highlight group
let g:conflict_marker_highlight_group = ''

" Include text after begin and end markers
let g:conflict_marker_begin = '^<<<<<<< .*$'
let g:conflict_marker_end   = '^>>>>>>> .*$'

highlight ConflictMarkerBegin guibg=#2f7366
highlight ConflictMarkerOurs guibg=#2e5049
highlight ConflictMarkerTheirs guibg=#344f69
highlight ConflictMarkerEnd guibg=#2f628e
highlight ConflictMarkerCommonAncestorsHunk guibg=#754a81

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Set leader key to space
let mapleader = " "

" File explorer
nnoremap <leader>e :Explore<CR>

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


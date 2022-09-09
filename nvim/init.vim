call plug#begin('~/.nvim/plugged')

Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'tpope/vim-surround'
Plug 'mbbill/undotree'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'folke/which-key.nvim'
" Plug 'romgrk/barbar.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.*'}
Plug 'neovim/nvim-lspconfig'
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'lewis6991/impatient.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'terrortylor/nvim-comment'
Plug 'jiangmiao/auto-pairs'
Plug 'APZelos/blamer.nvim'

" Language specific
Plug 'pearofducks/ansible-vim'

call plug#end()

" True colors
set termguicolors

set nofoldenable

" For nvim-cmp ? dont know what it does
set completeopt=menu,menuone,noselect
set pumheight=10
:lua require('impatient')
:lua require('nvim-tree').setup()
:lua require('which-key').setup()
:lua require('gitsigns').setup()
:lua require('mason').setup()
:lua require('mason-lspconfig').setup()
:lua require('bufferline').setup()
:lua require('nvim_comment').setup()

" Lua plugins with custom setup
:lua require('plugins/lspconfig')
:lua require('plugins/indent-blankline')
:lua require('plugins/null-ls')
:lua require('plugins/nvim-cmp')

:lua require('plugins/toggleterm')


" let g:catppuccin_flavour = 'mocha' " latte, frappe, macchiato, mocha
" :lua require('catppuccin').setup()
" colorscheme catppuccin

let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_foreground = 'mix'
colorscheme gruvbox-material 

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

" No git blame in inset mode
let g:blamer_show_in_insert_modes = 0

" Sets search for ripgrep to project root
if executable('rg')
    let g:rg_derive_root='true'
endif

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" DadBod (db) stuff
nnoremap <silent> <leader>du :DBUIToggle<CR>
nnoremap <silent> <leader>df :DBUIFindBuffer<CR>
nnoremap <silent> <leader>dr :DBUIRenameBuffer<CR>
nnoremap <silent> <leader>dl :DBUILastQueryInfo<CR>
let g:db_ui_save_location = '~/.config/db_ui'

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<CR>
nnoremap <leader>fb <cmd>Telescope git_branches<CR>
nnoremap <leader>fr <cmd>Telescope oldfiles<CR>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" ToggleTerm
nnoremap <leader>tt :ToggleTerm direction="float"<CR>
nnoremap <leader>th :ToggleTerm direction="horizontal"<CR>

" Floating LazyGit terminal
nnoremap <leader>gt <cmd>lua require ('utils.term').git_client_toggle()<CR>

" Clear highlights after search
nnoremap <leader><Esc> :noh<CR>

" Remaps for pasting from yank and not delete ( the 0 register)
noremap <Leader>p "0p
noremap <Leader>P "0P
vnoremap <Leader>p "0p

" Select all with space+a
nnoremap <Leader>a ggVG

" Toggle git blame on space+b
noremap <Leader>b <cmd>BlamerToggle<CR>

" end of line right next to start of line!
noremap + <End>

" rebind æ to : because it makes writing commands faster
nnoremap æ :

" rebind q: becuase i always hit it when trying to quti
nnoremap q: :q<CR>

" save on leader+s
noremap <leader>s :w<CR>

" NvimTree keybinds (leader = space)
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>nr :NvimTreeRefresh<CR>
nnoremap <leader>nf :NvimTreeFocus<CR>
nnoremap <leader>nc :NvimTreeClose<CR>

" commented because i now use bufferline
" " Move to previous/next
" nnoremap <silent>    <leader>, <Cmd>BufferPrevious<CR>
" nnoremap <silent>    <leader>. <Cmd>BufferNext<CR>
"
" " Goto buffer in position...
" nnoremap <silent>    <leader>1 <Cmd>BufferGoto 1<CR>
" nnoremap <silent>    <leader>2 <Cmd>BufferGoto 2<CR>
" nnoremap <silent>    <leader>3 <Cmd>BufferGoto 3<CR>
" nnoremap <silent>    <leader>4 <Cmd>BufferGoto 4<CR>
" nnoremap <silent>    <leader>5 <Cmd>BufferGoto 5<CR>
" nnoremap <silent>    <leader>6 <Cmd>BufferGoto 6<CR>
" nnoremap <silent>    <leader>7 <Cmd>BufferGoto 7<CR>
" nnoremap <silent>    <leader>8 <Cmd>BufferGoto 8<CR>
" nnoremap <silent>    <leader>9 <Cmd>BufferGoto 9<CR>
" " Close buffer
" nnoremap <silent>    <leader>q <Cmd>BufferClose<CR>
"
" " Close commands
" "                          :BufferCloseAllButCurrent
" "                          :BufferCloseAllButPinned
" "                          :BufferCloseAllButCurrentOrPinned
" "                          :BufferCloseBuffersLeft
" "                          :BufferCloseBuffersRight
" " Magic buffer-picking mode
" nnoremap <silent> <leader>bp    <Cmd>BufferPick<CR>
" " Sort automatically by...
" "
" Other:
" :BarbarEnable - enables barbar (enabled by default)
" :BarbarDisable - very bad command, should never be used

" Bufferline maps
nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>
nnoremap <silent><leader>q <Cmd>bdelete<CR>

" NOTE: You can use other key to expand snippet.

" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)

" If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
let g:vsnip_filetypes = {}
let g:vsnip_filetypes.javascriptreact = ['javascript']
let g:vsnip_filetypes.typescriptreact = ['typescript']

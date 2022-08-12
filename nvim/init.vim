call plug#begin('~/.nvim/plugged')

Plug 'gruvbox-community/gruvbox'
Plug 'tpope/vim-surround'
Plug 'mbbill/undotree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'folke/which-key.nvim'
Plug 'romgrk/barbar.nvim'
Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.*'}
Plug 'neovim/nvim-lspconfig'
Plug 'lewis6991/gitsigns.nvim'

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

lua << EOF
require'lspconfig'.solargraph.setup{}
EOF

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

" ToggleTerm
nnoremap <leader>tt :ToggleTerm direction="float"<CR>

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
nnoremap <silent> <leader>bp    <Cmd>BufferPick<CR>
" Sort automatically by...
"
" Other:
" :BarbarEnable - enables barbar (enabled by default)
" :BarbarDisable - very bad command, should never be used
"

lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "solargraph" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
	on_attach = on_attach,
	flags = {
	  debounce_text_changes = 150,
	}
  }
end
EOF

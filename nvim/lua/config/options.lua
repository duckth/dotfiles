-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_foreground = "mix"
-- vim.o.foldcolumn = "1" -- '0' is not bad

-- fold stuff
vim.g.gruvbox_material_better_performance = 1
vim.o.foldmethod = "indent"

vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- fix for weird ruby indent thing
vim.cmd([[autocmd FileType ruby setlocal indentkeys-=.]])

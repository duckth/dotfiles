-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.cmd([[autocmd BufLeave * silent! :noa w]])

vim.cmd([[autocmd FileType c set tabstop=4 softtabstop=4]])
vim.cmd([[autocmd FileType c set shiftwidth=4]])

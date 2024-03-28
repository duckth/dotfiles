-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- select everything on ctrl + a
map("n", "<C-A>", "ggVG", { desc = "Select everything" })

-- end of line next to start of line
map({ "n", "v" }, "+", "<End>", { desc = "End of line" })

-- find files on ctrl + p
map("n", "<C-P>", ":Telescope find_files<CR>", { desc = "Find files" })

-- buffers (currently disabled bc i disabled bufferline)
-- map("n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", { desc = "Go to buffer 5" })
-- map("n", "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", { desc = "Go to buffer 6" })
-- map("n", "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>", { desc = "Go to buffer 7" })
-- map("n", "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>", { desc = "Go to buffer 8" })
-- map("n", "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>", { desc = "Go to buffer 9" })

-- map comma to backtick so i can use precise marks
map({ "n", "v" }, ",", "`", { desc = "Use backtick instead of comma" })
-- map dash to tilde so i can use it
map({ "n", "v" }, "-", "~", { desc = "Use dash instead of tilde" })

-- recent files on ½
map("n", "½", "<Cmd>Telescope oldfiles<CR>", { desc = "Show recent files (Telescope)" })

-- buffers on tab
map("n", "<Tab>", "<Cmd>Telescope buffers<CR>", { desc = "Show buffers (Telescope)" })

-- map leader + dot to harpoon marks
map("n", "<leader>.", "<Cmd>Telescope harpoon marks<CR>", { desc = "Show harpoon marks (Telescope)" })

map("n", "<leader>e", "<Cmd>Neotree reveal<CR>", { desc = "NeoTree Reveal" })

map("i", "<C-a>", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true, silent = true, desc = "Codeium Accept" })

map("i", "<C-x>", function()
  return vim.fn["codeium#Clear"]()
end, { expr = true, silent = true, desc = "Codeium Clear" })

map("i", "<C-l>", function()
  return vim.fn["codeium#CycleCompletions"](1)
end, { expr = true, silent = true, desc = "Codeium Cycle" })

map("i", "<C-h>", function()
  return vim.fn["codeium#CycleCompletions"](-1)
end, { expr = true, silent = true, desc = "Codeium Cycle" })

-- Desc: Plugins and config
return {
  {
    "eandrju/cellular-automaton.nvim",
    -- lazy load on keybind
    keys = {
      { "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>", desc = "Give up" },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to find files with hidden included
      {
        "<leader>fh",
        function()
          require("telescope.builtin").find_files({ hidden = true })
        end,
        desc = "Find Files (hidden)",
      },
    },
  },
  {
    "nvim-neotest/neotest",
    dependencies = { "olimorris/neotest-rspec" },
    opts = { adapters = { "neotest-rspec" } },
  },
  {
    "christoomey/vim-tmux-navigator",
  },
  {
    "akinsho/bufferline.nvim",
    enabled = false,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        position = "float",
      },
      filesystem = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },
      },
    },
  },
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
    -- config = function()
    --   vim.keymap.set("i", "<S-Tab>", function()
    --     return vim.fn["codeium#Accept"]()
    --   end, { expr = true, silent = true })
    --   vim.keymap.set("i", "<C-l>", function()
    --     return vim.fn["codeium#CycleCompletions"](1)
    --   end, { expr = true, silent = true })
    --   vim.keymap.set("i", "<C-h>", function()
    --     return vim.fn["codeium#CycleCompletions"](-1)
    --   end, { expr = true, silent = true })
    --   vim.keymap.set("i", "<C-x>", function()
    --     return vim.fn["codeium#Clear"]()
    --   end, { expr = true, silent = true })
    -- end,
  },
}

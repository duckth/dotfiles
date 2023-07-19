-- Desc: Plugins and config
return {
  {
    "eandrju/cellular-automaton.nvim",
    -- lazy load on keybind
    keys = {
      { "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>", desc = "Give up" },
    }
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to find files with hidden included
      {
        "<leader>fh",
        function() require("telescope.builtin").find_files({ hidden = true }) end,
        desc = "Find Files (hidden)",
      },
    },
  },
  {
    "nvim-neotest/neotest",
    dependencies = { "olimorris/neotest-rspec" },
    opts = { adapters = { "neotest-rspec" } }
  }
}

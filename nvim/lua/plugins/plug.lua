-- Desc: Plugins and config
return {
  {
    "eandrju/cellular-automaton.nvim",
    -- lazy load on keybind
    keys = {
      { "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>", desc = "Give up" },
    }
  },
}

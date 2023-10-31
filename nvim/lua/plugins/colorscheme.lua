return {
  { "ellisonleao/gruvbox.nvim", lazy = false, priority = 1000 },
  { "duckth/gruvbox-material", priority = 1000 },
  -- { "catppuccin/nvim", lazy = false, name = "catppuccin", priority = 1000 },
  {
    "neanias/everforest-nvim",
    version = false,
    priority = 1000,
    config = function()
      require("everforest").setup({
        background = "hard",
        transparent_background_level = 0,
        italics = false,
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
}

return {
  { "ellisonleao/gruvbox.nvim", priority = 1000 },
  { "sainnhe/gruvbox-material", priority = 1000 },
  { "catppuccin/nvim",          name = "catppuccin", priority = 1000 },
  {
    "neanias/everforest-nvim",
    version = false,
    priority = 1000,
    config = function()
      require("everforest").setup({
        background = "soft",
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

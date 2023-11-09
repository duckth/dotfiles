return {
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        local telescope = require("telescope")
        telescope.load_extension("fzf")
        telescope.load_extension("harpoon")
      end,
    },
  },
}

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      {
        "Fildo7525/reloader.nvim",
        "nvim-telescope/telescope-smart-history.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
        "kkharji/sqlite.lua",
      },
    },
    config = function()
      require "raivo.telescope"
    end,
  },
}

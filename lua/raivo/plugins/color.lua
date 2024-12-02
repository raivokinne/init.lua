return {
  {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup {
        themes = {
          "rose-pine",
          "colorbuddy",
          "gruvbuddy",
          "radioactive_waste"
        },
        livePreview = true,
      }
      vim.keymap.set("n", "<leader>th", vim.cmd.Themery)
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end,
  },
  {
    "rockerBOO/boo-colorscheme-nvim"
  },
  {
    "tjdevries/colorbuddy.nvim",
  },
  {
    "rose-pine/nvim",
    name = "rose-pine",
    lazy = false,
    priority = 1000, -- Make sure to load this before all the other start plugins.
    opts = {
      enable = {
        terminal = true,
        legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
        migrations = true,        -- Handle deprecated options automatically
      },
      styles = {
        bold = false,
        italic = false,
        transparency = true,
      },
    },
    config = function(_, opts)
      require("rose-pine").setup(opts)
    end,
  },
}

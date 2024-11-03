return {
  "rose-pine/nvim",
  name = "rose-pine",
  lazy = false,
  priority = 1000, -- Make sure to load this before all the other start plugins.
  opts = {
    enable = {
      terminal = true,
      legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
      migrations = true, -- Handle deprecated options automatically
    },

    styles = {
      bold = false,
      italic = false,
      transparency = true,
    },
  },
  init = function(_, opts)
    require("rose-pine").setup(opts)
    vim.cmd.colorscheme "rose-pine"
  end,
}

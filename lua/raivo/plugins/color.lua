function SetColor(color)
  color = color or "tokyonight"
  vim.cmd.colorscheme(color)
end

return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    opts = {
      disable_background = true,
      disable_float_background = true,
      disable_italics = true,
    },
    config = function(_, opts)
      require("rose-pine").setup(opts)
      SetColor "rose-pine"
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "moon",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
    end,
  },
}

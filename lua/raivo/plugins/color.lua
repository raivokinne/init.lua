return {
  "rose-pine/neovim",
  lazy = true,
  priority = 1000,
  name = "rose-pine",
  opts = {
    styles = {
      italic = false,
      bold = true,
      transparency = true,
    },
  },
  config = function(_, opts)
    require("rose-pine").setup(opts)
  end,
  init = function()
    vim.cmd [[colorscheme rose-pine-moon]]
  end,
}

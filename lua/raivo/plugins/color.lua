return {
  "rose-pine/neovim",
  name = "rose-pine",
  lazy = false,
  priority = 1000,
  opts = {
    disable_italics = true,
    disable_background = true,
    disable_float_background = true
  },
  init = function()
    vim.cmd.colorscheme 'rose-pine'
  end
}

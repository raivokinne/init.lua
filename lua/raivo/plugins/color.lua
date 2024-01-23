return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "moon",
    transparent = true,
    terminal_colors = true,
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
  },
  init = function()
    vim.cmd [[colorscheme tokyonight]]
  end,
}

return {
  "https://gitlab.com/motaz-shokry/gruvbox.nvim",
  name = "gruvbox",
  lazy = false,
  priority = 1000,
  opts = {
    styles = {
      bold = true,
      italic = false,
      transparency = true,
    },
  },
  config = function(_, opts)
    require("gruvbox").setup(opts)
  end,
  init = function()
    vim.cmd "colorscheme gruvbox"
  end,
}

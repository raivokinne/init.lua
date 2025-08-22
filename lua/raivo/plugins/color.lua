return {
  "https://gitlab.com/motaz-shokry/gruvbox.nvim",
  name = "gruvbox",
  lazy = false,
  priority = 1000,
  opts = {
    enable = {
      terminal = true,
      legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
      migrations = true, -- Handle deprecated options automatically
    },

    styles = {
      bold = true,
      italic = true,
      transparency = true,
    },
  },
  config = function(_, opts)
    require("gruvbox").setup(opts)
    vim.cmd "colorscheme gruvbox-hard"
  end,
}

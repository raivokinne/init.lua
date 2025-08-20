return {
  "vague2k/vague.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other plugins
  opts = {
    transparent = true, -- don't set background
    italic = false,
    colors = {
      bg = "#18191a",
      fg = "#cfe2f3",
      floatBorder = "#878787",
      line = "#282830",
      comment = "#646477",
      func = "#8e7cc3",
      keyword = "#787bab",
      builtin = "#bad1ce",
      string = "#f2e6ff",
      property = "#eeeeee",
      constant = "#b4b4ce",
      parameter = "#b2d8d8",
      visual = "#363738",
      error = "#d2788c",
      warning = "#e6be8c",
      hint = "#8ca0dc",
      operator = "#96a3b2",
      number = "#e6e6fa",
      type = "#8ed2cc",
      search = "#465362",
      plus = "#8faf77",
      delta = "#e6be8c",
    },
  },
  config = function(_, opts)
    require("vague").setup(opts)

    vim.cmd.colorscheme "vague"
  end,
}

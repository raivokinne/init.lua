return {
  "rockerBOO/boo-colorscheme-nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme "radioactive_waste"
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end,
  -- {
  --   "ramojus/mellifluous.nvim",
  --   version = "v0.*", -- uncomment for stable config (some features might be missed if/when v1 comes out)
  --   opts = {
  --     colorset = "mellifluous",
  --     transparent_background = {
  --       enabled = true,
  --       floating_windows = true,
  --       telescope = true,
  --       file_tree = true,
  --       cursor_line = true,
  --       status_line = true,
  --     },
  --     plugins = {
  --       cmp = true,
  --       gitsigns = true,
  --       telescope = {
  --         enabled = true,
  --         nvchad_like = true,
  --       },
  --     },
  --   },
  --   config = function(_, opts)
  --     require("mellifluous").setup(opts) -- optional, see configuration section.
  --     vim.cmd "colorscheme mellifluous"
  --   end,
  -- },
  -- "vague2k/vague.nvim",
  -- lazy = false,
  -- priority = 1000,
  -- opts = {
  --   transparent = true, -- don't set background
  --   style = {
  --     -- "italic" is the same thing as default. But "italic" and "bold" are also valid options
  --     boolean = "italic",
  --     number = "italic",
  --     float = "italic",
  --     error = "italic",
  --     comments = "italic",
  --     conditionals = "italic",
  --     functions = "italic",
  --     headings = "italic",
  --     operators = "italic",
  --     strings = "italic",
  --     variables = "italic",
  --
  --     -- keywords
  --     keywords = "italic",
  --     keyword_return = "italic",
  --     keywords_loop = "italic",
  --     keywords_label = "italic",
  --     keywords_exception = "italic",
  --
  --     -- builtin
  --     builtin_constants = "italic",
  --     builtin_functions = "italic",
  --     builtin_types = "italic",
  --     builtin_variables = "italic",
  --   },
  --   -- Override colors
  --   colors = {
  --     func = "#7accc8",
  --     keyword = "#787bab",
  --     string = "#8a739a",
  --     number = "#8f729e",
  --   },
  -- },
  -- config = function(_, opts)
  --   require("vague").setup(opts)
  --   vim.cmd.colorscheme "vague"
  -- end,
}

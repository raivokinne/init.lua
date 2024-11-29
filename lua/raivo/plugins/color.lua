return {
  {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup {
        themes = {
          "gruvbox",
          "rose-pine",
          "rose-pine-moon",
          "tokyonight",
          "bamboo",
          "kanagawa",
          "forestbones",
          "nordbones",
          "tokyobones",
          "duckbones",
          "zenburned",
        },
        livePreview = true,
      }
      vim.keymap.set("n", "<leader>th", vim.cmd.Themery)
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end,
  },
  {
    "zenbones-theme/zenbones.nvim",
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    priority = 1000,
    -- you can set set configuration options here
    config = function()
      vim.g.duckbones_transparent_background = true
      vim.g.nordbones_transparent_background = true
      vim.g.tokyobones_transparent_background = true
      vim.g.zenburned_transparent_background = true
      vim.g.forestbones_transparent_background = true
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      require("kanagawa").setup {
        compile = false,
        dimInactive = true,
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = false },
        statementStyle = { bold = false },
        typeStyle = {},
        transparent = true, -- do not set background color
        terminalColors = true,
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
              },
            },
          },
        },
      }
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    config = function()
      require("gruvbox").setup {
        terminal_colors = true, -- add neovim terminal colors
        undercurl = true,
        underline = false,
        bold = false,
        italic = {
          strings = false,
          emphasis = false,
          comments = false,
          operators = false,
          folds = false,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = "", -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = true,
      }
    end,
  },
  {
    "ribru17/bamboo.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("bamboo").setup {
        style = "multiplex",
        transparent = true,
        code_style = {
          comments = { italic = true },
          conditionals = { italic = false },
          keywords = {},
          functions = {},
          namespaces = { italic = false },
          parameters = { italic = false },
          strings = {},
          variables = {},
        },
      }
    end,
  },
  {
    "folke/tokyonight.nvim",
    config = function()
      require("tokyonight").setup {
        style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
        transparent = true, -- Enable this to disable setting the background color
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
        styles = {
          comments = { italic = false },
          keywords = { italic = false },
          sidebars = "dark", -- style for sidebars, see below
          floats = "dark", -- style for floating windows
        },
      }
    end,
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
        migrations = true, -- Handle deprecated options automatically
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

return {
  "jwalton512/vim-blade",
  "nvim-tree/nvim-web-devicons",
	"rktjmp/lush.nvim",
  -- comments
  {
    "numToStr/Comment.nvim",
    opts = {},
    lazy = false,
  },
  {
    {
      "aserowy/tmux.nvim",
      config = function()
        return require("tmux").setup {
          resize = {
            enable_default_keybindings = false,
          },
        }
      end,
    },
  },
  {
    "alexghergh/nvim-tmux-navigation",
    event = "VeryLazy",
    config = function()
      local nvim_tmux_nav = require "nvim-tmux-navigation"
      nvim_tmux_nav.setup {
        disable_when_zoomed = true,
        -- defaults to false
        keybindings = {
          left = "<C-h>",
          down = "<C-j>",
          up = "<C-k>",
          right = "<C-l>",
          last_active = "<C-\\>",
          next = "<C-Space>",
        },
      }
    end,
  },
  {
    "NStefan002/screenkey.nvim",
    lazy = false,
    version = "*", -- or branch = "dev", to use the latest commit
  },
}

vim.pack.add({
	{ src = "https://github.com/williamboman/mason.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-ui-select.nvim" },
	{ src = "https://github.com/LinArcX/telescope-env.nvim" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/saghen/blink.cmp",                        version = vim.version.range("^1") },
	{ src = "https://github.com/supermaven-inc/supermaven-nvim" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/folke/tokyonight.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/tpope/vim-fugitive" },
	{ src = "https://github.com/echasnovski/mini.nvim" },
	{ src = "https://github.com/folke/todo-comments.nvim" },
})

require("mason").setup()
require("plugins.treesitter").setup()
require("plugins.telescope")
require("plugins.luasnip")
require("plugins.blink")
require("plugins.conform")
require("supermaven-nvim").setup({})
require("plugins.oil")
require("plugins.fugitive")
require("plugins.mini")
require("plugins.todo")

require("tokyonight").setup({
	style = "night",
	transparent = true,
	styles = {
		comments = { italic = false },
		keywords = { italic = false },

		sidebars = "transparent",
		floats = "transparent",
	},
})

vim.cmd.colorscheme("tokyonight")


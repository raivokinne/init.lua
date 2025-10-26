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
	{ src = "https://github.com/rose-pine/neovim", name = "rose-pine" },
})

require("mason").setup()
require("plugins.treesitter").setup()
require("plugins.telescope")
require("plugins.luasnip")
require("plugins.blink")
require("plugins.conform")
require("supermaven-nvim").setup({})

require("rose-pine").setup({
	styles = {
		italic = false,
		bold = true,
		transparency = true,
	}
})

vim.cmd.colorscheme("rose-pine")


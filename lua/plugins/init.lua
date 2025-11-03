vim.pack.add({
	{ src = "https://github.com/williamboman/mason.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/tjdevries/colorbuddy.nvim" },
	{ src = "https://github.com/tpope/vim-fugitive" },
	{ src = "https://github.com/mbbill/undotree" },
	{ src = "https://github.com/saghen/blink.cmp",                        version = vim.version.range("^1") },
	{ src = "https://github.com/ThePrimeagen/harpoon",                    version = "harpoon2" },
	{ src = "https://github.com/adalessa/laravel.nvim" },
	{ src = "https://github.com/tpope/vim-dotenv" },
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
	{ src = "https://github.com/nvim-neotest/nvim-nio" },
	{ src = "https://github.com/ravitemer/mcphub.nvim" },
	{ src = "https://github.com/rcarriga/nvim-notify"},
	{ src = "https://github.com/folke/trouble.nvim" },
})

require("mason").setup()
require("plugins.treesitter").setup()
require("plugins.telescope")
require("plugins.luasnip")
require("plugins.undotree")
require("plugins.blink")
require("plugins.harpoon")
require("plugins.laravel")
require("plugins.notify")
require("plugins.trouble")

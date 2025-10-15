vim.pack.add({
	{ src = "https://github.com/mfussenegger/nvim-dap" },
	{ src = "https://github.com/nvim-neotest/nvim-nio" },
	{ src = "https://github.com/rcarriga/nvim-dap-ui" },
	{ src = "https://github.com/jay-babu/mason-nvim-dap.nvim" },
	{ src = "https://github.com/williamboman/mason.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/folke/trouble.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-ui-select.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/tpope/vim-fugitive" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/RRethy/base16-nvim" },
	{ src = "https://github.com/ThePrimeagen/harpoon",                    version = "harpoon2" },
	{ src = "https://github.com/chentoast/marks.nvim" },
	{ src = "https://github.com/aznhe21/actions-preview.nvim" },
})

require("mason").setup()
require("plugins.theme")
require("plugins.harpoon")
require("plugins.treesitter")
require("plugins.dap")
require("plugins.trouble")
require("plugins.telescope")
require("plugins.fugitive")
require("plugins.luasnip")
require("plugins.marks")
require("plugins.actions-preview")

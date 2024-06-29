return {
	{
		"vague2k/huez.nvim",
		branch = "stable",
		event = "UIEnter",
		lazy = false,
		priority = 1000,
		opts = {},
		keys = {
			{ "<leader>ct", "<cmd>Huez<cr>", desc = "Colorizer" },
		},
		config = function()
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			require("huez").setup {}
		end,
	},
	{
		"rockerBOO/boo-colorscheme-nvim",
		lazy = false,
		priority = 1000,
		config = function(_, opts)
			require("boo-colorscheme").setup(opts)
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		opts = {
			disable_italics = true,
			disable_background = true,
			disable_float_background = true,
		},
		config = function(_, opts)
			require("rose-pine").setup(opts)
		end,
	},
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
		},
		config = function(_, opts)
			require("cyberdream").setup(opts)
		end,
	},
	{
		"notken12/base46-colors",
		lazy = false,
		priority = 1000,
	},
}

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
		"ramojus/mellifluous.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent_background = {
				enabled = false,
				floating_windows = true,
				telescope = true,
				file_tree = true,
				cursor_line = true,
				status_line = false,
			},
		},
		config = function(_, opts)
			require('mellifluous').setup(opts)
		end,
	},
	{
		"tiagovla/tokyodark.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent_background = true,
			styles = {
				comments = { italic = false }, -- style for comments
				keywords = { italic = false }, -- style for keywords
				identifiers = { italic = false }, -- style for identifiers
				functions = { italic = false }, -- style for functions
				variables = { italic = false }, -- style for variables
			},
		},
		config = function(_, opts)
			require("tokyodark").setup(opts)
		end,
	}
}

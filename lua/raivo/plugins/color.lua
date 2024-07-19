return {
	{
		"rockerBOO/boo-colorscheme-nvim",
		lazy = false,
		priority = 1000,
		config = function(_, opts)
			require("boo-colorscheme").setup(opts)
		end,
	},
	{
		"loctvl842/monokai-pro.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent_background = true,
			terminal_colors = true,
			background_clear = {
				"toggleterm",
				"telescope",
				"renamer",
				"notify",
			},
		},
		config = function(_, opts)
			require("monokai-pro").setup(opts)
			vim.cmd.colorscheme("monokai-pro-octagon")
			vim.cmd.colorscheme("radioactive_waste")
		end
	}
}

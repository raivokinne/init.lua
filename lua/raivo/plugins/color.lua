return {
	{
		"rockerBOO/boo-colorscheme-nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.boo_colorscheme_italic = false
		end,
	},
	{
		"loctvl842/monokai-pro.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent_background = true,
			background_clear = {
				"toggleterm",
				"telescope",
				"renamer",
				"notify",
			},
			styles = {
				comment = { italic = true },
				keyword = { italic = false }, -- any other keyword
				type = { italic = false }, -- (preferred) int, long, char, etc
				storageclass = { italic = false }, -- static, register, volatile, etc
				structure = { italic = false }, -- struct, union, enum, etc
				parameter = { italic = false }, -- parameter pass in function
				annotation = { italic = false },
				tag_attribute = { italic = false }, -- attribute of tag in reactjs
			},
		},
		config = function(_, opts)
			require("monokai-pro").setup(opts)
			vim.cmd.colorscheme("monokai-pro-octagon")
			vim.cmd.colorscheme("radioactive_waste")
		end
	},
}

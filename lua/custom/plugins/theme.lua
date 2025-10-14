return {
	"rose-pine/neovim",
	name = "rose-pine",
	lazy = false,
	priority = 1000,
	opts = {
		styles = {
			italic = false,
			bold = true,
			transparency = true,
		},
	},
	config = function(_, opts)
		require("rose-pine").setup(opts)
	end,
	init = function()
		vim.cmd("colorscheme rose-pine")
	end
}

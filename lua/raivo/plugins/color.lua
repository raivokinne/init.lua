return {
	"rockerBOO/boo-colorscheme-nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.boo_colorscheme_italic = false
	end,

	init = function()
		vim.cmd.colorscheme("radioactive_waste")
	end
}

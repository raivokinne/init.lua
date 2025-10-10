return {
	"adisen99/codeschool.nvim",
	dependencies = {
		"rktjmp/lush.nvim",
	},
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.codeschool_contrast_dark = "hard"
		vim.cmd("colorscheme codeschool")
	end,
}

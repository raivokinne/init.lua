return {
	"armannikoyan/rusty",
	lazy = false,
	priority = 1000,
	opts = {
		transparent = true,
	},
	config = function(_, opts)
		require("rusty").setup(opts)
		vim.cmd("colorscheme rusty")
	end,
}

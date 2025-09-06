return {
	"vague2k/vague.nvim",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other plugins
	config = function()
		require("vague").setup({
			transparent = true, -- don't set background
			-- disable bold/italic globally in `style`
			bold = true,
			italic = false,
			colors = {
				func = "#bc96b0",
				keyword = "#787bab",
				string = "#8a739a",
				number = "#8f729e",
			},
		})

		vim.cmd.colorscheme("vague")
	end,
}

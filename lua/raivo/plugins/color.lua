return {
	"vague2k/vague.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("vague").setup({
			transparent = true,
			style = {
				-- "none" is the same thing as default. But "italic" and "bold" are also valid options
				boolean = "none",
				number = "none",
				float = "none",
				error = "none",
				comments = "none",
				conditionals = "none",
				functions = "none",
				headings = "bold",
				operators = "none",
				strings = "none",
				variables = "none",

				-- keywords
				keywords = "none",
				keyword_return = "none",
				keywords_loop = "none",
				keywords_label = "none",
				keywords_exception = "none",

				-- builtin
				builtin_constants = "none",
				builtin_functions = "none",
				builtin_types = "none",
				builtin_variables = "none",
			},
			colors = {
				bg = "#18191a",
				fg = "#cfe2f3",
				floatBorder = "#878787",
				line = "#282830",
				comment = "#646477",
				func = "#9fc5e8",
				-- func = "#8e7cc3",
				-- keyword = "#787bab",
				builtin = "#bad1ce",
				keyword = "#c9f2ba",
				-- string = "#e69138",
				-- string = "#8a739a",
				-- string = "#f2e6ff",
				-- number = "#f2e6ff",
				string = "#d8d5b1",
				property = "#eeeeee",
				constant = "#b4b4ce",
				parameter = "#b2d8d8",
				visual = "#363738",
				error = "#d2788c",
				warning = "#e6be8c",
				hint = "#8ca0dc",
				operator = "#96a3b2",
				number = "#e6e6fa",
				type = "#8ed2cc",
				search = "#465362",
				plus = "#8faf77",
				delta = "#e6be8c",
			},
		})
	end,

	init = function()
		vim.cmd.colorscheme("vague")
	end
}

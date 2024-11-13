local function SetColor(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		opts = {
			styles = {
				italic = false,
				bold = false,
				transparency = true
			}
		},
		config = function(_, opts)
			require("rose-pine").setup(opts)
		end,
	},
	{
		"vague2k/vague.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true, -- don't set background
			style = {
				-- "none" is the same thing as default. But "italic" and "bold" are also valid options
				boolean = "none",
				number = "none",
				float = "none",
				error = "none",
				comments = "italic",
				conditionals = "none",
				functions = "none",
				headings = "none",
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
			-- Override colors
			colors = {
				func = "#7accc8",
				keyword = "#787bab",
				string = "#8a739a",
				number = "#8f729e",
			},
		},
		config = function(_, opts)
			require("vague").setup(opts)
			SetColor("vague")
		end,
	},
}


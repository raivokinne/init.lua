local config = {
	style = "night",
	light_style = "day",
	transparent = true,
	terminal_colors = true,
	styles = {
		comments = { italic = false },
		keywords = { italic = false },
		functions = {},
		variables = {},
		sidebars = "transparent",
		floats = "transparent",
	},
}

require("tokyonight").setup(config)

vim.cmd.colorscheme("tokyonight")

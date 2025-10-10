return {
	"xiyaowong/transparent.nvim",
	config = function()
		require("transparent").setup({
			groups = {
				"Normal",
				"NormalNC",
				"Comment",
				"Constant",
				"Special",
				"Identifier",
				"Statement",
				"PreProc",
				"Type",
				"Underlined",
				"Todo",
				"String",
				"Function",
				"Conditional",
				"Repeat",
				"Operator",
				"Structure",
				"LineNr",
				"NonText",
				"SignColumn",
				"EndOfBuffer",
			},
			exclude_groups = {
				"CursorLine",
				"CursorLineNr",
				"StatusLine",
				"StatusLineNC",
			},
		})
	end,
}

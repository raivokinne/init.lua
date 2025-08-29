return {
	"folke/trouble.nvim",
	opts = {},
	cmd = "Trouble",
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"[t",
			"<cmd>Trouble prev<cr>",
			desc = "Previous (Trouble)",
		},
		{
			"]t",
			"<cmd>Trouble next<cr>",
			desc = "Next (Trouble)",
		},
	},
}

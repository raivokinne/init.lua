return {
	{
		"folke/which-key.nvim",
		enabled = true,
		opts = {
			preset = "helix",
			debug = vim.uv.cwd():find("which%-key"),
			win = {},
			spec = {},
		},
	},
	"folke/twilight.nvim",
	{
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		opts = {
			window = { backdrop = 0.7 },
			plugins = {
				gitsigns = true,
				tmux = true,
				kitty = { enabled = false, font = "+2" },
			},
		},
		keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
	},
}

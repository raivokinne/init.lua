return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",     -- required
		"sindrets/diffview.nvim",    -- optional - Diff integration
		"nvim-telescope/telescope.nvim", -- optional
	},
	event = "VeryLazy",
	cmd = "Neogit",
	keys = {
		{ "<leader>gs", "<cmd>Neogit<CR>",             desc = "Neogit" },
		{ "<leader>gc", ":Neogit commit<CR>",          desc = "Commit" },
		{ "<leader>gp", ":Neogit pull<CR>",            desc = "Pull" },
		{ "<leader>gP", ":Neogit push<CR>",            desc = "Push" },
		{ "<leader>gb", ":Telescope git_branches<CR>", desc = "Branch" },
	},
	opts = {
		integrations = {
			diffview = true
		}
	},
	config = function(_, opts)
		require("neogit").setup(opts)
	end
}

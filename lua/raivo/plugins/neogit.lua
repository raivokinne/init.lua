return {
	"NeogitOrg/neogit",
	cmd = "Neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",  -- required
		"sindrets/diffview.nvim", -- optional - Diff integration

		-- Only one of these is needed.
		"ibhagwan/fzf-lua",      -- optional
		"echasnovski/mini.pick", -- optional
	},
	config = function()
		require("neogit").setup({
			kind = "floating", -- opens neogit in a split
		})

		vim.keymap.set("n", "<leader>gs", ":Neogit kind=floating<CR>")
	end,
}

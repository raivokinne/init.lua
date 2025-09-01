return {
	"kndndrj/nvim-dbee",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	build = function()
		require("dbee").install()
	end,
	config = function()
		require("dbee").setup(--[[optional config]])

		vim.keymap.set("n", "<leader>db", "<cmd>Dbee<cr>", { desc = "Toggle DBEE" })
	end,
}

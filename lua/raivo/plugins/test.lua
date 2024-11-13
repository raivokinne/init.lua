return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-neotest/neotest-jest",
		"marilari88/neotest-vitest"
	},
	config = function(_, opts)
		local neotest = require("neotest")
		neotest.setup({
			adapters = {
				require("neotest-vitest"),
				require("neotest-jest")
			}
		})
		vim.keymap.set("n", "<leader>tc", function()
			neotest.run.run()
		end)
	end,
}

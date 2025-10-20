require("neotest").setup({
	adapters = {
		require("neotest-golang")({
			dap = { justMyCode = false },
		}),
		require("neotest-pest")({}),
	},
})

vim.keymap.set("n", "<leader>tr", function()
	require("neotest").run.run({
		suite = false,
		testify = true,
	})
end, { desc = "Debug: Running Nearest Test" })

vim.keymap.set("n", "<leader>tv", function()
	require("neotest").summary.toggle()
end, { desc = "Debug: Summary Toggle" })

vim.keymap.set("n", "<leader>ts", function()
	require("neotest").run.run({
		suite = true,
		testify = true,
	})
end, { desc = "Debug: Running Test Suite" })

vim.keymap.set("n", "<leader>td", function()
	require("neotest").run.run({
		suite = false,
		testify = true,
		strategy = "dap",
	})
end, { desc = "Debug: Debug Nearest Test" })

vim.keymap.set("n", "<leader>to", function()
	require("neotest").output.open()
end, { desc = "Debug: Open test output" })

vim.keymap.set("n", "<leader>ta", function()
	require("neotest").run.run(vim.fn.getcwd())
end, { desc = "Debug: Open test output" })


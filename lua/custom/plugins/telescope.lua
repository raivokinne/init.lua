return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
	},
	config = function()
		local telescope = require("telescope")
		telescope.setup({
			pickers = {
				find_files = {
					theme = "ivy",
				}
			},
		})
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")
		local builtin = require("telescope.builtin")
		vim.keymap.set({ "n" }, "<leader>pf", builtin.find_files, { desc = "Telescope live grep" })
		vim.keymap.set({ "n" }, "<leader>pg", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set({ "n" }, "<leader>pb", builtin.buffers, { desc = "Telescope buffers" })
		vim.keymap.set({ "n" }, "<leader>pi", builtin.grep_string, { desc = "Telescope live string" })
		vim.keymap.set({ "n" }, "<leader>po", builtin.oldfiles, { desc = "Telescope buffers" })
		vim.keymap.set({ "n" }, "<leader>ph", builtin.help_tags, { desc = "Telescope help tags" })
		vim.keymap.set({ "n" }, "<leader>pm", builtin.man_pages, { desc = "Telescope man pages" })
		vim.keymap.set({ "n" }, "<leader>pt", builtin.builtin, { desc = "Telescope tags" })
		vim.keymap.set({ "n" }, "<leader>pd", builtin.registers, { desc = "Telescope tags" })
		vim.keymap.set({ "n" }, "<leader>pc", builtin.git_bcommits, { desc = "Telescope tags" })
	end,
}

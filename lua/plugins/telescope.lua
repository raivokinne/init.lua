local data = assert(vim.fn.stdpath "data") --[[@as string]]

local telescope = require("telescope")
telescope.setup({
	defaults = {
		file_ignore_patterns = { "vendor", "node_modules" },
		sorting_strategy = "ascending",
		path_displays = { "smart" },
		layout_config = {
			prompt_position = "top",
			preview_cutoff = 40,
		}
	},
	extensions = {
		wrap_results = true,
		fzf = {},
		history = {
			path = vim.fs.joinpath(data, "telescope_history.sqlite3"),
			limit = 100,
		},
		["ui-select"] = {
			require("telescope.themes").get_dropdown {},
		},
	},
})
pcall(telescope.load_extension, "fzf")
pcall(telescope.load_extension, "ui-select")
pcall(telescope.load_extension, "smart_history")

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<space>pf", builtin.find_files)
vim.keymap.set("n", "<space>pg", function()
  return builtin.git_files { cwd = vim.fn.expand "%:h" }
end)
vim.keymap.set('n', '<leader>pws', function()
	local word = vim.fn.expand("<cword>")
	builtin.grep_string({ search = word })
end)
vim.keymap.set('n', '<leader>pWs', function()
	local word = vim.fn.expand("<cWORD>")
	builtin.grep_string({ search = word })
end)
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", "<space>ph", builtin.help_tags)

vim.keymap.set("n", "<space>pc", function()
  builtin.find_files { cwd = vim.fn.stdpath "config" }
end)

local telescope = require("telescope")
telescope.setup({
	defaults = {
		file_ignore_patterns = { "vendor", "node_modules" },
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "descending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.55,
				results_width = 0.8,
			},
			vertical = {
				mirror = false,
			},
			width = 0.87,
			height = 0.80,
			preview_cutoff = 120,
		},
	},
	extensions = {
		['ui-select'] = {
			require('telescope.themes').get_dropdown(),
		},
	},
})

pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')
pcall(require('telescope').load_extension, 'env')

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<space>pf", function()
	return builtin.find_files()
end)
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
vim.keymap.set("n", "<space>pm", builtin.man_pages)
vim.keymap.set("n", "<space>po", builtin.oldfiles)
vim.keymap.set("n", "<space>pk", builtin.keymaps)

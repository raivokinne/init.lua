local telescope = require("telescope")
telescope.setup({
	defaults = {
		file_ignore_patterns = { "vendor", "node_modules" },
	},
	extensions = {
		['ui-select'] = {
			require('telescope.themes').get_dropdown(),
		},
	},
})

pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')

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

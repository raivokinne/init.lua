local telescope = require("telescope")
telescope.setup({
	defaults = {
		file_ignore_patterns = { "vendor", "node_modules" },
	},
})

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

local telescope = require("telescope")
pcall(telescope.load_extension, "fzf")
pcall(telescope.load_extension, "ui-select")

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Telescope files" })
vim.keymap.set("n", "<leader>pg", builtin.live_grep, { desc = "Telescope grep" })
vim.keymap.set("n", "<leader>pb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>pi", builtin.grep_string, { desc = "Telescope string" })
vim.keymap.set("n", "<leader>po", builtin.oldfiles, { desc = "Telescope recent" })
vim.keymap.set("n", "<leader>ph", builtin.help_tags, { desc = "Telescope help" })
vim.keymap.set("n", "<leader>pm", builtin.man_pages, { desc = "Telescope man" })
vim.keymap.set("n", "<leader>pt", builtin.builtin, { desc = "Telescope builtins" })
vim.keymap.set("n", "<leader>pd", builtin.registers, { desc = "Telescope registers" })
vim.keymap.set("n", "<leader>pc", builtin.git_bcommits, { desc = "Telescope commits" })


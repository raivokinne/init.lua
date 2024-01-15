local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<leader>pv", vim.cmd.Ex)
keymap("n", "<leader><leader>", function()
  vim.cmd "so"
end)

keymap({ "n", "i", "v" }, "<C-z>", "u", opts)
keymap({ "n", "i", "v" }, "<C-a>", "ggVG", opts)

keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("x", "p", [["_dP]])

keymap("n", "<leader>r", ":source ~/.config/nvim/init.lua<CR>")

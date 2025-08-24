local set = vim.keymap.set
local opts = { noremap = true, silent = true }
vim.g.mapleader = " "

set("n", "x", '"_x')
set("n", "<leader>pv", vim.cmd.Ex)

set("n", "tt", ":tabnew<CR>")
set("n", "<S-l>", ":tabnext<CR>")
set("n", "<S-h>", ":tabprevious<CR>")
set("n", "tc", ":tabclose<CR>")

set("n", "<Esc>", "<cmd>nohlsearch<CR>")

set({ "n", "v" }, "<leader>y", [["+y]])
set({ "n", "v" }, "<leader>Y", [["+Y]])

set("n", "ss", ":split<Return>", opts)
set("n", "sv", ":vsplit<Return>", opts)

set("n", "<c-j>", "<c-w><c-j>")
set("n", "<c-k>", "<c-w><c-k>")
set("n", "<c-l>", "<c-w><c-l>")
set("n", "<c-h>", "<c-w><c-h>")

set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

set("n", "<C-f>", "<cmd>silent !tmux neww ~/.local/bin/tmux-sessionizer<CR>")

set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

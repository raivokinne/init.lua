local set = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

set("n", "x", '"_x')
set("n", "-", vim.cmd.Ex)

set("x", "<leader>p", [["_dP]])

set("n", "tt", ":tabnew<CR>")
set("n", "<S-l>", ":tabnext<CR>")
set("n", "<S-h>", ":tabprevious<CR>")
set("n", "tc", ":tabclose<CR>")

set({ "n", "v" }, "<leader>y", [["+y]])
set({ "n", "v" }, "<leader>Y", [["+Y]])

set({ "n", "v" }, "<leader>d", [["_d]])

set("n", "ss", ":split<Return>", opts)
set("n", "sv", ":vsplit<Return>", opts)

set("n", "<c-j>", "<c-w><c-j>")
set("n", "<c-k>", "<c-w><c-k>")
set("n", "<c-l>", "<c-w><c-l>")
set("n", "<c-h>", "<c-w><c-h>")

set("n", "<M-,>", "<c-w>5<")
set("n", "<M-.>", "<c-w>5>")
set("n", "<M-t>", "<C-W>+")
set("n", "<M-s>", "<C-W>-")

set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

set("n", "<C-f>", "<cmd>silent !tmux neww ~/.local/bin/tmux-sessionizer<CR>")

set("n", "<leader>x", "<cmd>.lua<CR>", { desc = "Execute the current line" })
set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Execute the current file" })

local set = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

set("n", "x", '"_x')
set("n", "-", vim.cmd.Ex)

set("x", "<leader>p", [["_dP]])
set("n", "<leader>ks", ":Screenkey toggle<CR>")

set("n", "tt", ":tabnew<CR>")
set("n", "<S-l>", ":tabnext<CR>")
set("n", "<S-h>", ":tabprevious<CR>")
set("n", "tc", ":tabclose<CR>")

set({ "n", "v" }, "<leader>y", [["+y]])
set({ "n", "v" }, "<leader>Y", [["+Y]])

set({ "n", "v" }, "<leader>d", [["_d]])

set("i", "<C-c>", "<Esc>")

set("n", "<Leader>w", ":update<Return>", opts)
set("n", "<Leader>q", ":quit<Return>", opts)
set("n", "<Leader>Q", ":qa<Return>", opts)

set("n", "ss", ":split<Return>", opts)
set("n", "sv", ":vsplit<Return>", opts)

set("n", "sj", "<c-w><c-j>")
set("n", "sk", "<c-w><c-k>")
set("n", "sl", "<c-w><c-l>")
set("n", "sh", "<c-w><c-h>")

set("n", "<C-k>", "<cmd>cnext<CR>zz")
set("n", "<C-j>", "<cmd>cprev<CR>zz")
set("n", "<leader>k", "<cmd>lnext<CR>zz")
set("n", "<leader>j", "<cmd>lprev<CR>zz")

set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", function()
  require("conform").format { bufnr = 0 }
end)

vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd "so"
end)

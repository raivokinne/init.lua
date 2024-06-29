local keymap = vim.keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

keymap.set("n", "x", '"_x')

keymap.set("n", "<leader>pv", vim.cmd.Ex)
keymap.set("x", "<leader>p", [["_dP]])

keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set({ "n", "v" }, "<leader>Y", [["+Y]])

keymap.set({ "n", "v" }, "<leader>d", [["_d]])

keymap.set("i", "<C-c>", "<Esc>")

-- Save file and quit
keymap.set("n", "<Leader>w", ":update<Return>", opts)
keymap.set("n", "<Leader>q", ":quit<Return>", opts)
keymap.set("n", "<Leader>Q", ":qa<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Tabs
keymap.set("n", "<leader>to", ":tabnew<Return>", opts)
keymap.set("n", "<leader>tc", ":tabclose<Return>", opts)
keymap.set("n", "<Tab>", ":tabnext<Return>", opts)
keymap.set("n", "<S-Tab>", ":tabprev<Return>", opts)

keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

keymap.set("n", "<leader>d", "<cmd>%d<CR>")

keymap.set("n", "<D-a>", "ggVG")

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- Diagnostics
keymap.set("n", "<C-j>", function()
    vim.diagnostic.goto_next()
end, opts)

keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end, opts)

keymap.set("n", "<leader><leader>", function()
    vim.cmd "so"
end)

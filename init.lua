vim.cmd.colorscheme("lunaperche")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- cursor
vim.opt.guicursor = ""

-- line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false

-- backup and undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- search
vim.opt.inccommand = "split"

-- UI
vim.opt.background = "dark"
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.winborder = "rounded"

-- window splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- misc
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

map("n", "-", vim.cmd.Ex)

map("n", "<Esc>", "<cmd>nohlsearch<CR>")

map("n", "tt", ":tabnew<CR>")
map("n", "<S-l>", ":tabnext<CR>")
map("n", "<S-h>", ":tabprevious<CR>")
map("n", "tc", ":tabclose<CR>")

map({ "n", "v" }, "<leader>y", [["+y]])

map("n", "<C-f>", "<cmd>silent !tmux neww ~/.local/bin/tmux-sessionizer<CR>")

map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

vim.pack.add({
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master" },
	{ src = "https://github.com/mbbill/undotree" },
})

map("n", "<leader>u", vim.cmd.UndotreeToggle)

require "mini.pick".setup({
	mappings = {
		choose_marked = "<C-G>"
	}
})

map('n', '<leader>pf', ":Pick files<CR>")
map('n', '<leader>h', ":Pick help<CR>")
map('i', '<c-e>', function() vim.lsp.completion.get() end)

local ok, ts_configs = pcall(require, "nvim-treesitter.configs")
if ok then
  ts_configs.setup {
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
      disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
    },
  }
end


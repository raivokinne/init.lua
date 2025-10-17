vim.opt.nu = true
vim.opt.winborder = "rounded"
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.cursorline = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.inccommand = "split"
vim.opt.scrolloff = 8
vim.o.list = true
vim.opt.listchars = {
	tab = '» ',
	trail = '·',
	nbsp = '␣',
	eol = '󰌑'
}
vim.opt.signcolumn = "yes"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.shortmess:append('c')

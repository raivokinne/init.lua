vim.opt.nu = true
vim.opt.mouse = ""
vim.opt.tabstop = 4
vim.o.cursorline = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.opt.inccommand = "split"
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.shortmess:append('c')
vim.o.list = true
vim.opt.listchars = {
	tab = '» ',
	trail = '·',
	nbsp = '␣',
	eol = '↲',
}
vim.opt.winborder = 'rounded'

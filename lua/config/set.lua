vim.opt.winborder = "rounded"
vim.opt.mouse = ""
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.laststatus = 0
vim.opt.cmdheight = 0
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.inccommand = "split"
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.shortmess:append('c')

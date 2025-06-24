<<<<<<< HEAD
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.guicursor = ""
vim.g.loaded_netrw = 1 -- disable netrw
vim.g.loaded_netrwPlugin = 1
-- vim.opt.list = true
-- vim.opt.listchars = {
--   trail = "-",
--   tab = "» ",
-- }
=======
vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true
>>>>>>> 14296ee (update)

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
<<<<<<< HEAD
vim.opt.expandtab = false
=======
vim.opt.expandtab = true
>>>>>>> 14296ee (update)

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv "HOME" .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

<<<<<<< HEAD
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

=======
>>>>>>> 14296ee (update)
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append "@-@"

vim.opt.updatetime = 50

<<<<<<< HEAD
-- vim.opt.colorcolumn = "80"

vim.opt.fillchars = { eob = " " }

vim.opt.cursorline = true
=======
vim.opt.colorcolumn = "80"
>>>>>>> 14296ee (update)

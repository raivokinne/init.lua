local opt = vim.opt
vim.g.mapleader = " "
vim.g.maplocalleader = " "

opt.winborder = "rounded"

opt.cursorline = true

opt.inccommand = "split"

opt.smartcase = true
opt.ignorecase = true

opt.number = true
opt.relativenumber = true

opt.splitbelow = true
opt.splitright = true

opt.signcolumn = "yes"
opt.shada = { "'10", "<0", "s10", "h" }

opt.formatoptions:remove "o"

opt.wrap = true
opt.linebreak = true

opt.tabstop = 4
opt.shiftwidth = 4

opt.more = false

opt.foldmethod = "manual"

opt.title = true
opt.titlestring = '%t%( %M%)%( (%{expand("%:~:h")})%)%a (nvim)'

opt.undofile = true

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv "HOME" .. "/.vim/undodir"
opt.undofile = true

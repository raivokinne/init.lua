vim.g.mapleader = " "

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

vim.cmd [[
  highlight Comment cterm=NONE gui=NONE
  highlight Function cterm=NONE gui=NONE
  highlight Identifier cterm=NONE gui=NONE
  highlight Statement cterm=NONE gui=NONE
  highlight Keyword cterm=NONE gui=NONE
  highlight Type cterm=NONE gui=NONE
  highlight Constant cterm=NONE gui=NONE
  highlight String cterm=NONE gui=NONE
]]

local TheRaivoGroup = augroup("Raivo", {})

autocmd({ "BufWritePre" }, {
  group = TheRaivoGroup,
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "raivo.plugins" },
}, {})

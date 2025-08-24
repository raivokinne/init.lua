require "raivo.keymapings"
require "raivo.options"
require "raivo.lazy"
require "raivo.terminal"

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local TheRaivoGroup = augroup("Raivo", {})

local yank_group = augroup("HighlightYank", {})

function R(name)
  require("plenary.reload").reload_module(name)
end

autocmd("TextYankPost", {
  group = yank_group,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank {
      higroup = "IncSearch",
      timeout = 40,
    }
  end,
})

autocmd({ "BufWritePre" }, {
  group = TheRaivoGroup,
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

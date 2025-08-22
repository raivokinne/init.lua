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

autocmd("LspAttach", {
  group = TheRaivoGroup,
  callback = function(args)
    local builtin = require "telescope.builtin"
    vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
    vim.keymap.set("n", "gd", builtin.lsp_definitions, { buffer = 0 })
    vim.keymap.set("n", "gr", builtin.lsp_references, { buffer = 0 })
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0 })
    vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })

    vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, { buffer = 0 })
    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, { buffer = 0 })
    vim.keymap.set("n", "<space>wd", builtin.lsp_document_symbols, { buffer = 0 })
  end,
})

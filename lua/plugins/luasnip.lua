local ls = require("luasnip")

local map = vim.keymap.set
map({ "i", "s" }, "<C-e>", function() ls.expand_or_jump(1) end, { silent = true })
map({ "i", "s" }, "<C-J>", function() ls.jump(1) end, { silent = true })
map({ "i", "s" }, "<C-K>", function() ls.jump(-1) end, { silent = true })

require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })

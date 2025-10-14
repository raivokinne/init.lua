require("custom.config.set")
require("custom.config.remap")
require("custom.config.lazy")
require("custom.config.lsp")
require("custom.config.autocmds")

vim.cmd.colorscheme("habamax")

vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })

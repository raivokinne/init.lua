vim.lsp.start {
  cmd = { "/Users/raivokinne/shit/lsp-in-go/phplsp" },
  filetypes = { "php" },
  root_dir = vim.fn.getcwd(),
  autostart = true,
  on_attach = require("raivo.plugins.lsp").on_attach,
}

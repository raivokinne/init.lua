---@type vim.lsp.Config
return {
	cmd = { "phpactor", "language-server" },
	filetypes = { 'php' },
	root_markers = { '.git', 'composer.json' },
}

require("which-key").setup({
	preset = "helix",
	debug = vim.uv.cwd():find("which%-key"),
	win = {},
	spec = {},
})

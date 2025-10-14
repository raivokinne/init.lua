vim.lsp.enable({
  "bashls",
  "gopls",
  "lua_ls",
  "vtsls",
  "rust-analyzer",
  "yamlls",
})

vim.diagnostic.config({
	-- update_in_insert = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})


vim.lsp.enable({
	"bashls",
	"gopls",
	"yamlls",
	"lua_ls",
	"cssls",
	"svelte",
	"rust_analyzer",
	"clangd",
	"ruff",
	"glsl_analyzer",
	"intelephense",
	"biome",
	"tailwindcss",
	"vtsls",
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

vim.cmd [[set completeopt+=menuone,noselect,popup]]

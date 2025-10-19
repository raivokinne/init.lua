vim.lsp.enable({
	"bashls",
	"gopls",
	"yamlls",
	"lua_ls",
	"cssls",
	"svelte",
	"rust-analyzer",
	"clangd",
	"ruff",
	"glsl_analyzer",
	"phpactor",
	"biome",
	"tailwindcss",
	"vtsls",
	"zls",
})

vim.diagnostic.config({ virtual_text = true })

vim.cmd [[set completeopt+=menuone,noselect,popup]]

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
	"intelephense",
	"biome",
	"tailwindcss",
	"vtsls",
})

vim.diagnostic.config({ virtual_text = true })

vim.cmd [[set completeopt+=menuone,noselect,popup]]

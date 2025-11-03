require('blink.cmp').setup({
	fuzzy = { implementation = 'prefer_rust_with_warning' },
	signature = { enabled = true },
	keymap = {
		preset = "default",
		['<Tab>'] = {},
		['<S-Tab>'] = {},
	},
	appearance = {
		use_nvim_cmp_as_default = true,
		nerd_font_variant = "mono",
	},
	completion = {
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 200,
		}
	},
	sources = {
		default = { "lsp", "cmdline", "path", "buffer", "snippets" },
		providers = {},
	},
	snippets = { preset = 'luasnip' },
})

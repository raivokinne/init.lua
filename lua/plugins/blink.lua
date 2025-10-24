require('blink.cmp').setup({
	fuzzy = { implementation = 'prefer_rust_with_warning' },
	signature = { enabled = true },
	keymap = {
		preset = "default",
		['<Tab>'] = false,
		['<S-Tab'] = false,
	},
	appearance = {
		use_nvim_cmp_as_default = true,
		nerd_font_variant = "mono",
	},
	completion = {
		documentation = {
			auto_show = false,
			auto_show_delay_ms = 200,
		},
	},
	sources = {
		default = { "lsp", "cmdline", "path", "buffer", "snippets" },
	},
	snippets = { preset = 'luasnip' },
})

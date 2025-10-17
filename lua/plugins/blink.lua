require('blink.cmp').setup({
	fuzzy = { implementation = 'prefer_rust_with_warning' },
	signature = { enabled = true },
	keymap = {
		preset = "default",
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
		default = { "lsp", "laravel", "lazydev", "cmdline", "path", "buffer", "snippets" },
		providers = {
			lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
			laravel = {
				name = "laravel",
				module = "blink.compat.source",
				score_offset = 95, -- show at a higher priority than lsp
			},
		},
	},
	snippets = { preset = 'luasnip' },
})

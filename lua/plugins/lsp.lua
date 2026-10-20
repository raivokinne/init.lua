local capabilities = require("blink.cmp").get_lsp_capabilities()

local servers = {
	bashls = true,
	gopls = {
		manual_install = true,
		settings = {
			gopls = {
				hints = {
					assignVariableTypes = true,
					compositeLiteralFields = true,
					compositeLiteralTypes = true,
					constantValues = true,
					functionTypeParameters = true,
					parameterNames = true,
					rangeVariableTypes = true,
				},
			},
		},
	},
	lua_ls = {
		cmd = { "lua-language-server" },
	},
	clangd = {
		cmd = { "clangd" },
		manual_install = true,
	},
	zls = true,
	rust_analyzer = true,
	templ = true,
	phpactor = true,
	cssls = true,

	pyright = true,
	vtsls = {
		server_capabilities = {
			documentFormattingProvider = false,
		},
	},
	jsonls = {
		server_capabilities = {
			documentFormattingProvider = false,
		},
		settings = {
			json = {
				validate = { enable = true },
			},
		},
	},

	yamlls = {
		settings = {
			yaml = {
				schemaStore = {
					enable = false,
					url = "",
				},
			},
		},
	},

	ols = {},
}

local servers_to_install = vim.tbl_filter(function(key)
	local t = servers[key]
	if type(t) == "table" then
		return not t.manual_install
	else
		return t
	end
end, vim.tbl_keys(servers))

require("mason").setup()

vim.lsp.config("*", {
	capabilities = capabilities,
})

for name, config in pairs(servers) do
	if config == true then
		config = {}
	end

	if next(config) ~= nil then
		local lsp_config = vim.tbl_deep_extend("force", {}, config)
		lsp_config.manual_install = nil
		vim.lsp.config(name, lsp_config)
	end

	vim.lsp.enable(name)
end

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")

		local settings = servers[client.name]
		if type(settings) ~= "table" then
			settings = {}
		end

		local builtin = require("telescope.builtin")

		vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
		vim.keymap.set("n", "gd", builtin.lsp_definitions, { buffer = 0 })
		vim.keymap.set("n", "gr", builtin.lsp_references, { buffer = 0 })
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0 })
		vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })

		vim.keymap.set("n", "<space>f", vim.lsp.buf.format, { buffer = 0 })
		vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, { buffer = 0 })
		vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, { buffer = 0 })
		vim.keymap.set("n", "<space>wd", builtin.lsp_document_symbols, { buffer = 0 })
		vim.keymap.set("n", "<leader>vd", function()
			vim.diagnostic.open_float()
		end, { buffer = 0 })
		vim.keymap.set("n", "<space>ww", function()
			builtin.diagnostics({ root_dir = true })
		end, { buffer = 0 })
		vim.keymap.set("n", "<leader>ih", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }), { bufnr = 0 })
		end, { buffer = args.buf, desc = "Toggle inlay hints" })
	end,
})

vim.diagnostic.config({
	severity_sort = true,
	underline = true,
	update_in_insert = false,

	virtual_text = {
		spacing = 2,
		source = "if_many",
	},

	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "",
		},
	},

	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = true, -- "always" is deprecated
		header = "",
		prefix = "",
		suffix = function(d)
			return d.code and (" [%s]"):format(d.code) or ""
		end,
	},
})

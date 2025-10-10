return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",

		{ "j-hui/fidget.nvim", opts = {} },
		{ "https://git.sr.ht/~whynothugo/lsp_lines.nvim" },

		"b0o/SchemaStore.nvim",
	},
	config = function()
		if vim.g.obsidian then
			return
		end

		local capabilities = nil
		if pcall(require, "cmp_nvim_lsp") then
			capabilities = require("cmp_nvim_lsp").default_capabilities()
		end

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
			glsl_analyzer = true,
			lua_ls = {
				cmd = { "lua-language-server" },
			},
			rust_analyzer = true,
			svelte = true,
			templ = true,
			taplo = true,
			intelephense = {
				settings = {
					intelephense = {
						format = {
							braces = "k&r",
						},
					},
				},
			},

			pyright = true,
			ruff = { manual_install = true },
			biome = true,
			astro = true,
			vtsls = {
				server_capabilities = {
					documentFormattingProvider = false,
				},
			},
			-- denols = true,
			jsonls = {
				server_capabilities = {
					documentFormattingProvider = false,
				},
				settings = {
					json = {
						schemas = require("schemastore").json.schemas(),
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
			racket_langserver = { manual_install = true },
			roc_ls = { manual_install = true },

			clangd = {
				init_options = { clangdFileStatus = true },

				filetypes = { "c" },
			},

			tailwindcss = {
				init_options = {
					userLanguages = {
						elixir = "phoenix-heex",
						eruby = "erb",
						heex = "phoenix-heex",
					},
				},
				filetypes = {
					"html",
					"css",
					"scss",
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
					"vue",
					"svelte",
					"ocaml.mlx",
				},
				settings = {
					tailwindCSS = {
						experimental = {
							classRegex = {
								[[class: "([^"]*)]],
								[[className="([^"]*)]],
							},
						},
						includeLanguages = {
							["ocaml.mlx"] = "html",
						},
					},
				},
			},
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
		local ensure_installed = {
			"stylua",
			"lua_ls",
			"delve",
			-- "tailwind-language-server",
		}

		vim.list_extend(ensure_installed, servers_to_install)
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

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

		local disable_semantic_tokens = {
			-- lua = true,
		}

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local bufnr = args.buf
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

				vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, { buffer = 0 })
				vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, { buffer = 0 })
				vim.keymap.set("n", "<space>wd", builtin.lsp_document_symbols, { buffer = 0 })
				vim.keymap.set("n", "<space>ww", function()
					builtin.diagnostics({ root_dir = true })
				end, { buffer = 0 })

				local filetype = vim.bo[bufnr].filetype
				if disable_semantic_tokens[filetype] then
					client.server_capabilities.semanticTokensProvider = nil
				end

				-- Override server capabilities
				if settings.server_capabilities then
					for k, v in pairs(settings.server_capabilities) do
						if v == vim.NIL then
							---@diagnostic disable-next-line: cast-local-type
							v = nil
						end

						client.server_capabilities[k] = v
					end
				end
			end,
		})

		require("lsp_lines").setup()
		vim.diagnostic.config({ virtual_text = true, virtual_lines = false })

		vim.keymap.set("", "<leader>l", function()
			local config = vim.diagnostic.config() or {}
			if config.virtual_text then
				vim.diagnostic.config({ virtual_text = false, virtual_lines = true })
			else
				vim.diagnostic.config({ virtual_text = true, virtual_lines = false })
			end
		end, { desc = "Toggle lsp_lines" })
	end,
}

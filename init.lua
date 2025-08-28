vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.guicursor = ""
vim.opt.cursorline = true
vim.opt.inccommand = 'split'
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.signcolumn = 'yes'
vim.opt.shada = { "'10", '<0', 's10', 'h' }
vim.opt.formatoptions:remove 'o'
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.more = true
vim.opt.foldmethod = 'manual'
vim.opt.title = true
vim.opt.titlestring = '%t%( %M%)%( (%{expand("%:~:h")})%)%a (nvim)'
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'

vim.keymap.set('n', '-', vim.cmd.Ex)
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', 'tt', ':tabnew<CR>')
vim.keymap.set('n', '<S-l>', ':tabnext<CR>')
vim.keymap.set('n', '<S-h>', ':tabprevious<CR>')
vim.keymap.set('n', 'tc', ':tabclose<CR>')
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set({ 'n', 'v' }, '<leader>Y', [["+Y]])
vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww ~/.local/bin/tmux-sessionizer<CR>')
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true })
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
	local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
	if vim.v.shell_error ~= 0 then
		error('Error cloning lazy.nvim:\n' .. out)
	end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require('lazy').setup({
	{
		'nvim-telescope/telescope.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim',
		},
		config = function()
			local builtin = require 'telescope.builtin'
			vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
			vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
			vim.keymap.set('n', '<leader>ps', function()
				builtin.live_grep {
					grep_open_files = true,
					prompt_title = 'Live Grep in Open Files',
				}
			end, { desc = '[S]earch [/] in Open Files' })
			vim.keymap.set('n', '<leader>pc', function()
				builtin.find_files { cwd = vim.fn.stdpath 'config' }
			end, { desc = '[S]earch [N]eovim files' })
		end,
	},
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			{ 'mason-org/mason.nvim', opts = {} },
			'mason-org/mason-lspconfig.nvim',
			'WhoIsSethDaniel/mason-tool-installer.nvim',

			{ 'j-hui/fidget.nvim', opts = {} },

			'saghen/blink.cmp',
			'b0o/SchemaStore.nvim',
		},
		config = function()
			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc, mode)
						mode = mode or 'n'
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
					end

					map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
					map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })
					map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
					map('gri', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
					map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
					map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
					map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')
					map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')
					map('grt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')

					-- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
					---@param client vim.lsp.Client
					---@param method vim.lsp.protocol.Method
					---@param bufnr? integer some lsp support methods only in specific files
					---@return boolean
					local function client_supports_method(client, method, bufnr)
						if vim.fn.has 'nvim-0.11' == 1 then
							return client:supports_method(method, bufnr)
						else
							return client.supports_method(method, { bufnr = bufnr })
						end
					end

					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
						local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
						vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})

						vim.api.nvim_create_autocmd('LspDetach', {
							group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
							end,
						})
					end

					if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
						map('<leader>th', function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
						end, '[T]oggle Inlay [H]ints')
					end
				end,
			})

			vim.diagnostic.config {
				severity_sort = true,
				float = { border = 'rounded', source = 'if_many' },
				underline = { severity = vim.diagnostic.severity.ERROR },
				signs = vim.g.have_nerd_font and {
					text = {
						[vim.diagnostic.severity.ERROR] = '󰅚 ',
						[vim.diagnostic.severity.WARN] = '󰀪 ',
						[vim.diagnostic.severity.INFO] = '󰋽 ',
						[vim.diagnostic.severity.HINT] = '󰌶 ',
					},
				} or {},
				virtual_text = {
					source = 'if_many',
					spacing = 2,
					format = function(diagnostic)
						local diagnostic_message = {
							[vim.diagnostic.severity.ERROR] = diagnostic.message,
							[vim.diagnostic.severity.WARN] = diagnostic.message,
							[vim.diagnostic.severity.INFO] = diagnostic.message,
							[vim.diagnostic.severity.HINT] = diagnostic.message,
						}
						return diagnostic_message[diagnostic.severity]
					end,
				},
			}

			local capabilities = require('blink.cmp').get_lsp_capabilities()

			local lspconfig = require 'lspconfig'

			local servers = {
				zls = {},
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
					cmd = { 'lua-language-server' },
					-- server_capabilities = {
					--   semanticTokensProvider = vim.NIL,
					-- },
				},
				rust_analyzer = true,
				svelte = true,
				templ = true,
				taplo = true,
				intelephense = {
					settings = {
						intelephense = {
							format = {
								braces = 'k&r',
							},
						},
					},
				},

				pyright = true,
				ruff = { manual_install = true },
				-- mojo = { manual_install = true },

				-- Enabled biome formatting, turn off all the other ones generally
				biome = true,
				astro = true,
				-- ts_ls = {
				--   root_dir = require("lspconfig").util.root_pattern "package.json",
				--   single_file = false,
				--   server_capabilities = {
				--     documentFormattingProvider = false,
				--   },
				-- },
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
							schemas = require('schemastore').json.schemas(),
							validate = { enable = true },
						},
					},
				},

				-- cssls = {
				--   server_capabilities = {
				--     documentFormattingProvider = false,
				--   },
				-- },

				yamlls = {
					settings = {
						yaml = {
							schemaStore = {
								enable = false,
								url = '',
							},
							-- schemas = require("schemastore").yaml.schemas(),
						},
					},
				},

				ols = {},
				racket_langserver = { manual_install = true },
				roc_ls = { manual_install = true },

				ocamllsp = {
					manual_install = true,
					-- cmd = { "dune", "tools", "exec", "ocamllsp" },
					-- cmd = { "dune", "exec", "ocamllsp" },
					cmd = { 'ocamllsp' },
					settings = {
						codelens = { enable = true },
						inlayHints = { enable = true },
						syntaxDocumentation = { enable = true },
					},

					server_capabilities = { semanticTokensProvider = false },

					-- TODO: Check if i still need the filtypes stuff i had before
				},

				gleam = {
					manual_install = true,
				},

				elixirls = {
					cmd = { '/home/tjdevries/.local/share/nvim/mason/bin/elixir-ls' },
					root_dir = require('lspconfig.util').root_pattern { 'mix.exs' },
				},

				-- lexical = {
				--   cmd = { "/home/tjdevries/.local/share/nvim/mason/bin/lexical", "server" },
				--   root_dir = require("lspconfig.util").root_pattern { "mix.exs" },
				--   server_capabilities = {
				--     completionProvider = vim.NIL,
				--     definitionProvider = true,
				--   },
				-- },

				clangd = {
					manual_install = true,
					filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
				},

				tailwindcss = {
					init_options = {
						userLanguages = {
							elixir = 'phoenix-heex',
							eruby = 'erb',
							heex = 'phoenix-heex',
						},
					},
					settings = {
						tailwindCSS = {
							experimental = {
								classRegex = {
									[[class: "([^"]*)]],
									[[className="([^"]*)]],
								},
							},
						},
					},
				},
			}

			local servers_to_install = vim.tbl_filter(function(key)
				local t = servers[key]
				if type(t) == 'table' then
					return not t.manual_install
				else
					return t
				end
			end, vim.tbl_keys(servers))

			require('mason').setup()
			local ensure_installed = {
				'stylua',
				'lua_ls',
				'delve',
				-- "tailwind-language-server",
			}

			vim.list_extend(ensure_installed, servers_to_install)
			require('mason-tool-installer').setup { ensure_installed = ensure_installed }

			for name, config in pairs(servers) do
				if config == true then
					config = {}
				end
				config = vim.tbl_deep_extend('force', {}, {
					capabilities = capabilities,
				}, config)

				lspconfig[name].setup(config)
			end
		end,
	},

	{ -- Autocompletion
		'saghen/blink.cmp',
		event = 'VimEnter',
		version = '1.*',
		dependencies = {
			{
				'L3MON4D3/LuaSnip',
				version = '2.*',
				build = (function()
					-- Build Step is needed for regex support in snippets.
					-- This step is not supported in many windows environments.
					-- Remove the below condition to re-enable on windows.
					if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
						return
					end
					return 'make install_jsregexp'
				end)(),
				dependencies = {
					{
						'rafamadriz/friendly-snippets',
						config = function()
							require('luasnip.loaders.from_vscode').lazy_load()
						end,
					},
				},
				opts = {},
			},
		},
		--- @module 'blink.cmp'
		--- @type blink.cmp.Config
		opts = {
			keymap = {
				['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
				['<C-e>'] = { 'hide' },
				['<C-y>'] = { 'select_and_accept' },

				['<Up>'] = { 'select_prev', 'fallback' },
				['<Down>'] = { 'select_next', 'fallback' },
				['<C-k>'] = { 'select_prev', 'fallback_to_mappings' },
				['<C-j>'] = { 'select_next', 'fallback_to_mappings' },

				['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
				['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

				['<Tab>'] = { 'snippet_forward', 'fallback' },
				['<S-Tab>'] = { 'snippet_backward', 'fallback' },
			},

			appearance = {
				-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = 'mono',
			},

			completion = {
				-- By default, you may press `<c-space>` to show the documentation.
				-- Optionally, set `auto_show = true` to show the documentation after a delay.
				documentation = { auto_show = true, auto_show_delay_ms = 500 },
			},

			sources = {
				default = { 'lsp', 'path', 'snippets', 'buffer' },
			},

			snippets = { preset = 'luasnip' },

			-- Blink.cmp includes an optional, recommended rust fuzzy matcher,
			-- which automatically downloads a prebuilt binary when enabled.
			--
			-- By default, we use the Lua implementation instead, but you may enable
			-- the rust implementation via `'prefer_rust_with_warning'`
			--
			-- See :h blink-cmp-config-fuzzy for more information
			fuzzy = { implementation = 'lua' },

			-- Shows a signature help window while you type arguments for a function
			signature = { enabled = true },
		},
	},

	{
		'rose-pine/neovim',
		name = 'rose-pine',
		lazy = false,
		priority = 1000,
		opts = {
			styles = {
				italic = false,
				bold = true,
				transparency = true,
			},
		},
		config = function(_, opts)
			require('rose-pine').setup(opts)
		end,
		init = function()
		  vim.cmd.colorscheme 'rose-pine'
		end,
	},
	{ -- Highlight, edit, and navigate code
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		main = 'nvim-treesitter.configs', -- Sets main module to use for opts
		-- [[ Configure Treesitter ]] See `:help nvim-treesitter`
		opts = {
			ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
			-- Autoinstall languages that are not installed
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { 'ruby' },
			},
			indent = { enable = true, disable = { 'ruby' } },
		},
	},
	{
		'folke/trouble.nvim',
		opts = {},
		cmd = 'Trouble',
		keys = {
			{
				'<leader>xx',
				'<cmd>Trouble diagnostics toggle<cr>',
				desc = 'Diagnostics (Trouble)',
			},
			{
				'[t',
				'<cmd>Trouble prev<cr>',
				desc = 'Previous (Trouble)',
			},
			{
				']t',
				'<cmd>Trouble next<cr>',
				desc = 'Next (Trouble)',
			},
		},
	},
}, {
		ui = {
			icons = vim.g.have_nerd_font and {} or {
				cmd = '⌘',
				config = '🛠',
				event = '📅',
				ft = '📂',
				init = '⚙',
				keys = '🗝',
				plugin = '🔌',
				runtime = '💻',
				require = '🌙',
				source = '📄',
				start = '🚀',
				task = '📌',
				lazy = '💤 ',
			},
		},
	})

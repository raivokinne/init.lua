local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local fmt_group = vim.api.nvim_create_augroup('autoformat_cmds', { clear = true })
local map = vim.keymap.set
local bs = { buffer = true, silent = true }
local brs = { buffer = true, remap = true, silent = true }

autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup('my.lsp', {}),
	callback = function(e)
		local client = assert(vim.lsp.get_client_by_id(e.data.client_id))
		if client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, e.buf, {
				autotrigger = true,
				convert = function(item)
					return { abbr = item.label:gsub("%b()", "") }
				end,
			})
		end
		local function client_supports_method(method, bufnr)
			if vim.fn.has 'nvim-0.11' == 1 then
				return client:supports_method(method, bufnr)
			else
				return client.supports_method(method, { bufnr = bufnr })
			end
		end
		if client and client_supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, e.buf) then
			vim.keymap.set('n', '<leader>th', function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = e.buf })
			end)
		end
		vim.api.nvim_create_autocmd('LspDetach', {
			group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
			callback = function(event2)
				vim.lsp.buf.clear_references()
				vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
			end,
		})
		vim.keymap.set("i", "<C-e>", vim.lsp.completion.get, { desc = "trigger autocompletion" })
		client.server_capabilities.semanticTokensProvider = nil
		local opts = { buffer = e.buf }
		vim.keymap.set({ 'n', 'x' }, '<leader>f', function()
			vim.lsp.buf.format({
				bufnr = e.buf,
				async = false,
				timeout_ms = 10000,
			})
		end, opts)
		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, opts)
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end, opts)
		vim.keymap.set("n", "<leader>ws", function()
			vim.lsp.buf.workspace_symbol()
		end, opts)
		vim.keymap.set("n", "<leader>vd", function()
			vim.diagnostic.open_float()
		end, opts)
		-- vim.keymap.set("n", "<leader>ca", function()
		-- 	vim.lsp.buf.code_action()
		-- end, opts)
		vim.keymap.set("n", "<leader>rr", function()
			vim.lsp.buf.references()
		end, opts)
		vim.keymap.set("n", "<leader>rn", function()
			vim.lsp.buf.rename()
		end, opts)
		vim.keymap.set("i", "<C-h>", function()
			vim.lsp.buf.signature_help()
		end, opts)
		vim.keymap.set("n", "<leader>dn", function()
			vim.diagnostic.jump({ count = 1 })
		end, opts)
		vim.keymap.set("n", "<leader>dp", function()
			vim.diagnostic.jump({ count = -1 })
		end, opts)
	end,
})

local highlight_group = augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ timeout = 170 })
	end,
	group = highlight_group,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "netrw",
	callback = function()
		map("n", "<C-c>", "<cmd>bd<CR>", bs)
		map("n", "<Tab>", "mf", brs)
		map("n", "<S-Tab>", "mF", brs)
		map("n", "%", function()
			local dir = vim.b.netrw_curdir or vim.fn.expand("%:p:h")
			vim.ui.input({ prompt = "Enter filename: " }, function(input)
				if input and input ~= "" then
					local filepath = dir .. "/" .. input
					vim.cmd("!touch " .. vim.fn.shellescape(filepath))
					vim.api.nvim_feedkeys("<C-l>", "n", false)
				end
			end)
		end, bs)
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function(ev)
		local ft = vim.bo[ev.buf].filetype
		local formatting = "lua vim.lsp.buf.format()"

		if ft == "lua" then
			formatting = "!stylua %"
		elseif ft == "tex" then
			formatting = "!latexindent -s -l -w %"
		end

		local cmd = function()
			vim.cmd("write")
			vim.cmd("silent " .. formatting)
		end

		map("n", "<leader>fo", cmd, { buffer = ev.buf })
	end,
})

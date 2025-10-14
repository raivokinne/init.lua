local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local map = vim.keymap.set
local bs = { buffer = true, silent = true }
local brs = { buffer = true, remap = true, silent = true }

autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup('my.lsp', {}),
	callback = function(e)
		local client = assert(vim.lsp.get_client_by_id(e.data.client_id))
		if client:supports_method('textDocument/completion') then
			-- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
			-- client.server_capabilities.completionProvider.triggerCharacters = chars
			vim.lsp.completion.enable(true, client.id, e.buf, { autotrigger = true })
		end
		local opts = { buffer = e.buf }
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
		vim.keymap.set("n", "<leader>ca", function()
			vim.lsp.buf.code_action()
		end, opts)
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

-- Highlight yanked text
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

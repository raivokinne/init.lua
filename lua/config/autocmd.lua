local autocmd = vim.api.nvim_create_autocmd
local userautocmd = vim.api.nvim_create_user_command
local augroup = vim.api.nvim_create_augroup

autocmd({ "BufWritePre" }, {
	group = augroup('write', {}),
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

autocmd("LspAttach", {
	group = augroup('my.lsp', {}),
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if not client then return end
		local bufnr = ev.buf
		local opts = { buffer = bufnr, silent = true }

		if client:supports_method('textDocument/inlayHint') then
			vim.keymap.set('n', '<leader>th', function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = bufnr })
			end, opts)
		end
		local function map(modes, lhs, rhs, desc)
			vim.keymap.set(modes, lhs, rhs, vim.tbl_extend('force', opts, { desc = desc }))
		end
		client.server_capabilities.semanticTokensProvider = nil
		map({ 'n', 'x' }, '<leader>f', function()
			vim.lsp.buf.format({ bufnr = bufnr, async = false, timeout_ms = 10000 })
		end, 'Format')
		map('n', 'gd', vim.lsp.buf.definition, 'Go to definition')
		map('n', 'K', vim.lsp.buf.hover, 'Hover documentation')
		map('n', '<leader>ws', vim.lsp.buf.workspace_symbol, 'Workspace symbols')
		map('n', '<leader>ca', vim.lsp.buf.code_action, 'Code Actions')
		map('n', '<leader>vd', vim.diagnostic.open_float, 'Show diagnostic')
		map('n', '<leader>rr', vim.lsp.buf.references, 'References')
		map('n', '<leader>rn', vim.lsp.buf.rename, 'Rename')
		map('n', '<leader>dn', function() vim.diagnostic.jump({ count = 1 }) end, 'Next diagnostic')
		map('n', '<leader>dp', function() vim.diagnostic.jump({ count = -1 }) end, 'Previous diagnostic')
	end,
})

autocmd("TextYankPost", {
	group = augroup("yank-highlight", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ timeout = 170 })
	end,
})

autocmd("FileType", {
	pattern = "netrw",
	callback = function()
		local opts = { buffer = true, silent = true }
		vim.keymap.set("n", "%", function()
			local dir = vim.b.netrw_curdir or vim.fn.expand("%:p:h")
			vim.ui.input({ prompt = "Enter filename: " }, function(input)
				if input and input ~= "" then
					local filepath = dir .. "/" .. input
					vim.cmd("!touch " .. vim.fn.shellescape(filepath))
					vim.cmd.edit()
				end
			end)
		end, opts)
	end,
})

local formatters = {
	lua = "!stylua %",
	tex = "!latexindent -s -l -w %",
}

autocmd("FileType", {
	callback = function(ev)
		local ft = vim.bo[ev.buf].filetype
		local format_cmd = formatters[ft] or "lua vim.lsp.buf.format()"
		vim.keymap.set("n", "<leader>fo", function()
			vim.cmd.write()
			vim.cmd("silent " .. format_cmd)
		end, { buffer = ev.buf, silent = true, desc = "Format file" })
	end,
})

userautocmd("Unique", function()
  local start_line = vim.fn.getpos("'<")[2]
  local end_line = vim.fn.getpos("'>")[2]

  local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)

  local seen = {}
  local uniq = {}
  for _, l in ipairs(lines) do
    if not seen[l] then
      seen[l] = true
      table.insert(uniq, l)
    end
  end

  vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, uniq)
end, { range = true })

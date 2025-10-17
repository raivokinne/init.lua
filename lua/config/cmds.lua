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
		vim.keymap.set({ 'n', 'x' }, '<leader>f', function()
			vim.lsp.buf.format({ bufnr = bufnr, async = false, timeout_ms = 10000 })
		end)
		local builtin = require "telescope.builtin"

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
			builtin.diagnostics { root_dir = true }
		end, { buffer = 0 })
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

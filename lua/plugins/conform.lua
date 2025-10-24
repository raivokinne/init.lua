require("conform").setup({
	notify_on_error = false,
	-- format_on_save = function(bufnr)
	-- 	local disable_filetypes = { c = true, cpp = true }
	-- 	if disable_filetypes[vim.bo[bufnr].filetype] then
	-- 		return nil
	-- 	else
	-- 		return {
	-- 			timeout_ms = 500,
	-- 			lsp_format = 'fallback',
	-- 		}
	-- 	end
	-- end,
	formatters_by_ft = {
		lua = { 'stylua' },
		python = { "ruff" },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		typescript = { "prettierd", "prettier", stop_after_first = true },
		css = { "prettierd", "prettier", stop_after_first = true },
		html = { "prettierd", "prettier", stop_after_first = true },
		json = { "prettierd", "prettier", stop_after_first = true },
		yaml = { "prettierd", "prettier", stop_after_first = true },
		cpp = { "clang_format" },
		c = { "clang_format" },
		rust = { "rustfmt" },
		go = { "gofmt" },
		php = { "php-cs-fixer", "pint" },
		blade = { "prettierd", "prettier", stop_after_first = true },
	},
})

vim.keymap.set("n", "<leader>f", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format with conform" })

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd({ "BufWritePre" }, {
	group = augroup('write', {}),
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

autocmd("LspAttach", {
	group = augroup('my.lsp', {}),
	callback = function(ev)
		local map = function(keys, func, desc, mode)
			mode = mode or 'n'
			vim.keymap.set(mode, keys, func, { buffer = ev.buf, desc = 'LSP: ' .. desc })
		end
		map('gf', vim.lsp.buf.format, '[F]ormat')
		map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
		map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
		map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })
		map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
		map('gri', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
		map('grd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
		map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
		map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')
		map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')
		map('grt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')
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

local function update_plugin(plugin_name)
	if plugin_name == "" then
		print("Updating all plugins...")
		local plugins = vim.pack.get()
		if vim.tbl_isempty(plugins) then
			print("No plugins installed to update")
			return
		end
		print("Found " .. #plugins .. " plugins to update:")
		for i, plugin in ipairs(plugins) do
			local name = plugin.spec.name or "Unknown Plugin " .. i
			print("- " .. name)
		end
		local choice = vim.fn.confirm(
			"Update all plugins?",
			"&Yes\n&No",
			2
		)
		if choice ~= 1 then
			print("Cancelled")
			return
		end
		vim.pack.update()
		print("All plugins updated successfully!")
	else
		local plugins = vim.pack.get()
		local found = false
		for _, plugin in ipairs(plugins) do
			local name = plugin.spec.name or ""
			local url = plugin.spec.src or ""
			if name == plugin_name or url:match(plugin_name) then
				found = true
				break
			end
		end
		if not found then
			print("Plugin not found: " .. plugin_name)
			print("Use :PackList to see installed plugins")
			return
		end
		local choice = vim.fn.confirm(
			"Update plugin '" .. plugin_name .. "'?",
			"&Yes\n&No",
			2
		)
		if choice ~= 1 then
			print("Cancelled")
			return
		end
		vim.pack.update({ names = { plugin_name } })
		print("Updated plugin: " .. plugin_name)
	end
end

vim.api.nvim_create_user_command("PackUpdate", function(opts)
	update_plugin(opts.args)
end, {
	nargs = "?",
	desc = "Update plugin(s). No args = update all, or specify plugin name"
})

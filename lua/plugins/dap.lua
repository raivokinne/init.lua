local dap_group = vim.api.nvim_create_augroup("DapGroup", { clear = true })

local function navigate(args)
	local buffer = args.buf
	local wid = nil

	for _, win_id in ipairs(vim.api.nvim_list_wins()) do
		if vim.api.nvim_win_get_buf(win_id) == buffer then
			wid = win_id
		end
	end

	if wid == nil then return end

	vim.schedule(function()
		if vim.api.nvim_win_is_valid(wid) then
			vim.api.nvim_set_current_win(wid)
		end
	end)
end

local function create_nav_options(name)
	return {
		group = dap_group,
		pattern = string.format("*%s*", name),
		callback = navigate,
	}
end

local dap = require("dap")
dap.set_log_level("DEBUG")

vim.keymap.set("n", "<leader>dsc", dap.continue, { desc = "Debug: Continue" })
vim.keymap.set("n", "<leader>dso", dap.step_over, { desc = "Debug: Step Over" })
vim.keymap.set("n", "<leader>dsi", dap.step_into, { desc = "Debug: Step Into" })
vim.keymap.set("n", "<leader>dso", dap.step_out, { desc = "Debug: Step Out" })
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
vim.keymap.set("n", "<leader>B", function()
	dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Debug: Conditional Breakpoint" })


local dapui = require("dapui")

local function layout(name)
	return {
		elements = { { id = name } },
		enter = true,
		size = 40,
		position = "right",
	}
end

local name_to_layout = {
	repl = { layout = layout("repl"), index = 0 },
	stacks = { layout = layout("stacks"), index = 0 },
	scopes = { layout = layout("scopes"), index = 0 },
	console = { layout = layout("console"), index = 0 },
	watches = { layout = layout("watches"), index = 0 },
	breakpoints = { layout = layout("breakpoints"), index = 0 },
}

local layouts = {}
for name, config in pairs(name_to_layout) do
	table.insert(layouts, config.layout)
	name_to_layout[name].index = #layouts
end

local function toggle_debug_ui(name)
	dapui.close()
	local layout_config = name_to_layout[name]
	if not layout_config then error(string.format("bad name: %s", name)) end

	local uis = vim.api.nvim_list_uis()[1]
	if uis then layout_config.size = uis.width end

	pcall(dapui.toggle, layout_config.index)
end

vim.keymap.set("n", "<leader>dr", function() toggle_debug_ui("repl") end, { desc = "DAP: REPL" })
vim.keymap.set("n", "<leader>ds", function() toggle_debug_ui("stacks") end, { desc = "DAP: Stacks" })
vim.keymap.set("n", "<leader>dw", function() toggle_debug_ui("watches") end, { desc = "DAP: Watches" })
vim.keymap.set("n", "<leader>db", function() toggle_debug_ui("breakpoints") end, { desc = "DAP: Breakpoints" })
vim.keymap.set("n", "<leader>dS", function() toggle_debug_ui("scopes") end, { desc = "DAP: Scopes" })
vim.keymap.set("n", "<leader>dc", function() toggle_debug_ui("console") end, { desc = "DAP: Console" })

vim.api.nvim_create_autocmd("BufEnter", {
	group = dap_group,
	pattern = "*dap-repl*",
	callback = function()
		vim.wo.wrap = true
	end,
})
vim.api.nvim_create_autocmd("BufWinEnter", create_nav_options("dap-repl"))
vim.api.nvim_create_autocmd("BufWinEnter", create_nav_options("DAP Watches"))

dapui.setup({ layouts = layouts, enter = true })

dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
dap.listeners.before.event_exited.dapui_config = function() dapui.close() end
dap.listeners.after.event_output.dapui_config = function(_, body)
	if body.category == "console" then dapui.eval(body.output) end
end

require("mason-nvim-dap").setup({
	ensure_installed = { "delve" },
	automatic_installation = true,
	handlers = {
		function(config)
			require("mason-nvim-dap").default_setup(config)
		end,
		delve = function(config)
			table.insert(config.configurations, 1, {
				args = function() return vim.split(vim.fn.input("args> "), " ") end,
				type = "delve",
				name = "file",
				request = "launch",
				program = "${file}",
				outputMode = "remote",
			})
			table.insert(config.configurations, 1, {
				args = function() return vim.split(vim.fn.input("args> "), " ") end,
				type = "delve",
				name = "file args",
				request = "launch",
				program = "${file}",
				outputMode = "remote",
			})
			require("mason-nvim-dap").default_setup(config)
		end,
	},
})

dap.adapters.codelldb = {
	type = "server",
	port = "${port}",
	executable = {
		command = "/Users/raivokinne/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb",
		args = { "--port", "${port}" },
	},
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
dap.configurations.zig = dap.configurations.cpp

vim.g.mapleader = " "
local map = vim.keymap.set
map("n", "-", vim.cmd.Ex)

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

vim.api.nvim_set_keymap("n", "<leader>tf", "<Plug>PlenaryTestFile", { noremap = false, silent = false })

map(
	"n",
	"<leader>ee",
	"oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)

map(
	"n",
	"<leader>ea",
	"oassert.NoError(err, \"\")<Esc>F\";a"
)

map(
	"n",
	"<leader>ef",
	"oif err != nil {<CR>}<Esc>Olog.Fatalf(\"error: %s\\n\", err.Error())<Esc>jj"
)

map(
	"n",
	"<leader>el",
	"oif err != nil {<CR>}<Esc>O.logger.Error(\"error\", \"error\", err)<Esc>F.;i"
)

map('n', '<Esc>', '<cmd>nohlsearch<CR>')

map("n", "j", "gj")
map("n", "k", "gk")

map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "=ap", "ma=ap'a")

map("n", "tt", ":tabnew<CR>")
map("n", "<C-h>", ":tabnext<CR>")
map("n", "<C-l>", ":tabprev<CR>")
map("n", "tc", ":tabclose<CR>")

map("x", "<leader>p", [["_dP]])

map({ "n", "v", "x" }, "<C-s>", [[:s/\V]], { desc = "Enter substitue mode in selection" })

map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

map({ "n", "v" }, "<leader>d", '"_d')

map("i", "<C-c>", "<Esc>")

map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

map("n", "<C-k>", "<cmd>cnext<CR>zz")
map("n", "<C-j>", "<cmd>cprev<CR>zz")
map("n", "<leader>k", "<cmd>lnext<CR>zz")
map("n", "<leader>j", "<cmd>lprev<CR>zz")

map("n", "<leader><leader>", function()
	vim.cmd("so")
end)

local function pack_clean()
	local active_plugins = {}
	local unused_plugins = {}

	for _, plugin in ipairs(vim.pack.get()) do
		active_plugins[plugin.spec.name] = plugin.active
	end

	for _, plugin in ipairs(vim.pack.get()) do
		if not active_plugins[plugin.spec.name] then
			table.insert(unused_plugins, plugin.spec.name)
		end
	end

	if #unused_plugins == 0 then
		print("No unused plugins.")
		return
	end

	local choice = vim.fn.confirm("Remove unused plugins?", "&Yes\n&No", 2)
	if choice == 1 then
		vim.pack.del(unused_plugins)
	end
end

map("n", "<leader>pcc", pack_clean)

local function pack_update()
	local plugins = vim.pack.get()

	if #plugins == 0 then
		print("No plugins found.")
		return
	end

	local plugins_with_updates = {}

	print("Checking for updates...")
	for _, plugin in ipairs(plugins) do
		local path = plugin.path
		if path then
			vim.fn.system("git -C " ..
				vim.fn.shellescape(path) .. " fetch --quiet 2>/dev/null")

			local behind = vim.fn.system("git -C " ..
				vim.fn.shellescape(path) ..
				" rev-list HEAD..@{u} --count 2>/dev/null")

			if tonumber(behind) and tonumber(behind) > 0 then
				table.insert(plugins_with_updates, plugin.spec.name)
			end
		end
	end

	if #plugins_with_updates == 0 then
		print("All plugins are up to date.")
		return
	end

	print("\nPlugins with updates available:")
	for _, name in ipairs(plugins_with_updates) do
		print("  - " .. name)
	end

	local choice = vim.fn.confirm(
		"Update " .. #plugins_with_updates .. " plugin(s)?",
		"&Yes\n&No",
		2
	)

	if choice == 1 then
		vim.pack.update(plugins_with_updates)
	end
end
map("n", "<leader>pcu", pack_update)

for i = 1, 8 do
	map({ "n", "t" }, "<Leader>" .. i, "<Cmd>tabnext " .. i .. "<CR>")
end

vim.pack.add({
	{ src = "https://github.com/mfussenegger/nvim-dap" },
	{ src = "https://github.com/nvim-neotest/nvim-nio" },
	{ src = "https://github.com/rcarriga/nvim-dap-ui" },
	{ src = "https://github.com/jay-babu/mason-nvim-dap.nvim" },
	{ src = "https://github.com/williamboman/mason.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/tjdevries/colorbuddy.nvim" },
	{ src = "https://github.com/saghen/blink.cmp",                           version = vim.version.range("^1") },
	{ src = "https://github.com/adalessa/laravel.nvim" },
	{ src = "https://github.com/tpope/vim-dotenv" },
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
	{ src = "https://github.com/nvim-neotest/nvim-nio" },
	{ src = "https://github.com/Saghen/blink.compat" },
	{ src = "https://github.com/brianhuster/live-preview.nvim" },
	{ src = "https://github.com/antoinemadec/FixCursorHold.nvim" },
	{ src = "https://github.com/nvim-neotest/neotest" },
	{ src = "https://github.com/fredrikaverpil/neotest-golang" },
	{ src = "https://github.com/leoluz/nvim-dap-go" },
	{ src = "https://github.com/V13Axel/neotest-pest" },
	{ src = "https://github.com/shortcuts/no-neck-pain.nvim",                version = "*" },
})

require("mason").setup()

local plugin_dir = vim.fn.stdpath("config") .. "/lua/custom/plugins"
local files = vim.fn.globpath(plugin_dir, "*.lua", false, true)

for _, file in ipairs(files) do
	local module_name = file:match("lua/(.*)%.lua$"):gsub("/", ".")
	local ok, err = pcall(require, module_name)
	if not ok then
		vim.notify("Error loading " .. module_name .. "\n\n" .. err, vim.log.levels.ERROR)
	end
end

require("plugins.treesitter")
require("plugins.dap")
require("plugins.telescope")
require("plugins.luasnip")
require("plugins.blink")
require("plugins.laravel")
require("plugins.test")
require("plugins.no-neck-pain")

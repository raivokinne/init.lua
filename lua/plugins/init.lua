vim.pack.add({
	{ src = "https://github.com/mfussenegger/nvim-dap" },
	{ src = "https://github.com/nvim-neotest/nvim-nio" },
	{ src = "https://github.com/rcarriga/nvim-dap-ui" },
	{ src = "https://github.com/jay-babu/mason-nvim-dap.nvim" },
	{ src = "https://github.com/williamboman/mason.nvim" },
	{ src = "https://github.com/folke/trouble.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-ui-select.nvim" },
	{ src = "https://github.com/kkharji/sqlite.lua"},
	{ src = "https://github.com/nvim-telescope/telescope-smart-history.nvim"},
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/tjdevries/colorbuddy.nvim" },
	{ src = "https://github.com/saghen/blink.cmp",                        version = vim.version.range("^1") },
	{ src = "https://github.com/folke/lazydev.nvim" },
	{ src = "https://github.com/j-hui/fidget.nvim" },
	{ src = "https://github.com/Bilal2453/luvit-meta" },
	{ src = "https://github.com/adalessa/laravel.nvim" },
	{ src = "https://github.com/tpope/vim-dotenv" },
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
	{ src = "https://github.com/nvim-neotest/nvim-nio" },
	{ src = "https://github.com/ravitemer/mcphub.nvim" },
	{ src = "https://github.com/Saghen/blink.compat" },
	{ src = "https://github.com/mbbill/undotree" },
	{ src = "https://github.com/tpope/vim-fugitive" },
	{ src = "https://github.com/brianhuster/live-preview.nvim" },
	{ src = "https://github.com/ThePrimeagen/harpoon",                    version = "harpoon2" },
	{ src = "https://github.com/laytan/cloak.nvim"},
	{ src = "https://github.com/rcarriga/nvim-notify"},
})

require("mason").setup()
require("fidget").setup({})
require("lazydev").setup({
	library = {
		{ path = "luvit-meta/library",      words = { "vim%.uv" } },
		{ path = "/usr/share/awesome/lib/", words = { "awesome" } },
	},
})

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
require("plugins.trouble")
require("plugins.telescope")
require("plugins.luasnip")
require("plugins.blink")
require("plugins.laravel")
require("plugins.undotree")
require("plugins.fugitive")
require("plugins.harpoon")
require("plugins.cloak")
require("plugins.notify")

return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
		transparent = true, -- Enable this to disable setting the background color
		terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
		styles = {
			-- Style to be applied to different syntax groups
			-- Value is any valid attr-list value for `:help nvim_set_hl`
			comments = { italic = false },
			keywords = { italic = false },
			-- Background styles. Can be "dark", "transparent" or "normal"
			sidebars = "transparent", -- style for sidebars, see below
			floats = "transparent", -- style for floating windows
		},
	},
	config = function(_, opts)
		require("tokyonight").setup(opts)
	end,
	init = function()
		vim.cmd([[colorscheme tokyonight]])
	end,
}

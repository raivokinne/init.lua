return {
	{
		"vague2k/huez.nvim", -- if you want registry related features, uncomment this
		-- import = "huez-manager.import"
		branch = "stable",
		event = "UIEnter",
		config = function()
			require("huez").setup {}
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		end,
	},
	{
		"folke/tokyonight.nvim",
		config = function()
			require("tokyonight").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
				transparent = true, -- Enable this to disable setting the background color
				terminal_colors = false, -- Configure the colors used when opening a `:terminal` in Neovim
				styles = {
					-- Style to be applied to different syntax groups
					-- Value is any valid attr-list value for `:help nvim_set_hl`
					comments = { italic = false },
					keywords = { italic = false },
					-- Background styles. Can be "dark", "transparent" or "normal"
					-- sidebars = "normal", -- style for sidebars, see below
					sidebars = "transparent", -- style for sidebars, see below
					-- floats = "normal", -- style for floating windows
					floats = "transparent", -- style for floating windows
				},
			}
		end,
	},
	{
		"tjdevries/colorbuddy.nvim",
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup {
				styles = {
					italic = false,
					bold = false,
					transparency = true,
				},
			}
		end,
	},
}

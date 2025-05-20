return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			{
				'Fildo7525/reloader.nvim'
			},
		},
		config = function()
			local builtin = require "telescope.builtin"
			local actions = require "telescope.actions"
			local telescope = require "telescope"
			telescope.setup {
				defaults = {
					prompt_prefix = " ",
					selection_caret = " ",
					file_ignore_patterns = { ".venv", "target", "node_modules", ".git", ".cache", "__pycache__", "vendor" },
					mappings = {
						i = {
							["C-j"] = actions.move_selection_next,
							["C-k"] = actions.move_selection_previous,
						},
					},
				},
				extensions = {
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
						-- the default case_mode is "smart_case"
					},
				},
			}
			vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
			vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
			vim.keymap.set("n", "<leader>ps", function()
				builtin.grep_string { search = vim.fn.input "  > Find Word:  " }
			end)
			vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup {
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown {},
					},
				},
			}
			require("telescope").load_extension "ui-select"
		end,
	},
}

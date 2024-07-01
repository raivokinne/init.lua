return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"windwp/nvim-ts-autotag",
	},
	config = function()
		require("nvim-treesitter.configs").setup {
			ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
			auto_install = true,
			indent = {
				enable = true,
			},
			highlight = {
				enable = true, -- false will disable the whole extension
			},
		}
		--- @class parser_config
		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
		parser_config.blade = {
			install_info = {
				url = "https://github.com/EmranMR/tree-sitter-blade",
				files = { "src/parser.c" },
				branch = "main",
			},
			filetype = "blade",
		}

		vim.filetype.add {
			pattern = {
				[".*%.blade%.php"] = "blade",
			},
		}

		vim.filetype.add {
			pattern = {
				[".*%.templ"] = "templ",
			},
		}

		vim.filetype.add {
			pattern = {
				[".*%.slint"] = "slint"
			}
		}
	end,
}

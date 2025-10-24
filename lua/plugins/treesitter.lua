local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then
	vim.notify("nvim-treesitter.configs not found", vim.log.levels.ERROR)
	return
end

configs.setup({
	ensure_installed = {
		"bash",
		"c",
		"diff",
		"html",
		"lua",
		"luadoc",
		"markdown",
		"markdown_inline",
		"query",
		"vim",
		"vimdoc",
	},
	auto_install = true,
	sync_install = false,
	indent = {
		enable = true,
	},
	highlight = {
		enable = true,
		disable = function(lang, buf)
			if lang == "html" then
				return true
			end
			local max_filesize = 100 * 1024 -- 100kb
			local okey, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if okey and stats and stats.size > max_filesize then
				vim.notify("Treesitter disabled for large file", vim.log.levels.WARN)
				return true
			end
		end,
		additional_vim_regex_highlighting = { "markdown" },
	},
})

require 'treesitter-context'.setup {
	enable = true,         -- Enable this plugin (Can be enabled/disabled later via commands)
	multiwindow = false,   -- Enable multiwindow support.
	max_lines = 0,         -- How many lines the window should span. Values <= 0 mean no limit.
	min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
	line_numbers = true,
	multiline_threshold = 20, -- Maximum number of lines to show for a single context
	trim_scope = 'outer',  -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
	mode = 'cursor',       -- Line used to calculate context. Choices: 'cursor', 'topline'
	separator = nil,
	zindex = 20,  -- The Z-index of the context window
	on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
}

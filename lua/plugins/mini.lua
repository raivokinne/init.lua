require('mini.ai').setup { n_lines = 500 }
require('mini.surround').setup()
local statusline = require 'mini.statusline'
statusline.setup { use_icons = vim.g.have_nerd_font }

---@diagnostic disable-next-line: duplicate-set-field
statusline.section_filename = function()
	return ''
end

---@diagnostic disable-next-line: duplicate-set-field
statusline.section_location = function()
	return '%2l:%-2v'
end

---@diagnostic disable-next-line: duplicate-set-field
statusline.section_fileinfo = function()
	return ''
end

---@diagnostic disable-next-line: duplicate-set-field
statusline.active = function()
	local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
	local location = MiniStatusline.section_location({ trunc_width = 75 })

	return MiniStatusline.combine_groups({
		{ hl = mode_hl, strings = { mode } },
		'%2=',
		{ hl = 'MiniStatuslineFilename', strings = { '%f' } },
		'%=',
		{ hl = 'MiniStatuslineFileinfo', strings = { location } },
	})
end

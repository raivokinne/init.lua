require('base16-colorscheme').with_config({
    telescope = false,
    indentblankline = false,
    notify = false,
    ts_rainbow = false,
    cmp = false,
    illuminate = false,
    dapui = false,
})

local function random_theme()
	local colors = vim.fn.getcompletion("", "color")

	local exclude = {
		"blue", "darkblue", "default", "delek", "desert", "elflord",
		"evening", "habamax", "industry", "koehler", "lunaperche",
		"morning", "murphy", "pablo", "peachpuff", "quiet", "ron",
		"shine", "slate", "torte", "zellner"
	}

	local filtered_colors = {}
	for _, color in ipairs(colors) do
		local is_default = false
		for _, default in ipairs(exclude) do
			if color == default then
				is_default = true
				break
			end
		end
		if not is_default then
			table.insert(filtered_colors, color)
		end
	end

	if #filtered_colors > 0 then
		math.randomseed(os.time())
		local random_index = math.random(1, #filtered_colors)
		local color = filtered_colors[random_index]
		vim.t.color = color
		vim.cmd("colorscheme " .. color)

		vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
		vim.cmd("highlight NonText guibg=NONE ctermbg=NONE")
		vim.cmd("highlight SignColumn guibg=NONE ctermbg=NONE")
		vim.cmd("highlight LineNr guibg=NONE ctermbg=NONE")
		vim.cmd("highlight NormalNC guibg=NONE ctermbg=NONE")
	end
end

random_theme()

return {
	'Exafunction/codeium.vim',
	event = 'BufEnter',
	config = function()
		vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end)
		vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end)
		vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end)
		vim.keymap.set('i', '<Tab>', function() return vim.fn['codeium#Accept']() end)
	end,
}

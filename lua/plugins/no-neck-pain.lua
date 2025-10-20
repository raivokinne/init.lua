require("no-neck-pain").setup({
	width = 90,
})
vim.keymap.set("n", "<leader>z", ":NoNeckPain<CR>", {
	silent = true,
	desc = "Center [buffer] screen [No neck pain]",
})

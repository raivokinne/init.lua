vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>gc", ":Git commit<CR>")

local group = vim.api.nvim_create_augroup("TheRaivo_Fugitive", {})

vim.api.nvim_create_autocmd("BufWinEnter", {
	group = group,
	pattern = "*",
	callback = function()
		if vim.bo.ft ~= "fugitive" then
			return
		end

		local bufnr = vim.api.nvim_get_current_buf()
		local opts = { buffer = bufnr, remap = false }
		vim.keymap.set("n", "<leader>p", ":Git push<CR>", opts)
		vim.keymap.set("n", "<leader>P", function()
			vim.cmd.Git({ "pull", "--rebase" })
		end, opts)
		vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts)
	end,
})

vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>")
vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>")


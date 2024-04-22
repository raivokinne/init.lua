return {
  "akinsho/toggleterm.nvim",
  version = "*",
  cmd = "ToggleTerm",
  opts = {},
  config = function()
    require("toggleterm").setup()
    vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>")
    vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm size=20 direction=horizontal<CR>")
    vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<CR>")
    vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>")
    vim.keymap.set("t", "<Esc>", "<C-\\><C-n>:ToggleTerm<CR>")
  end,
}

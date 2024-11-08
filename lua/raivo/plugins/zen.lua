return {
  "folke/zen-mode.nvim",
  config = function()
    vim.keymap.set("n", "<leader>z", function()
      require("zen-mode").setup {
        window = {
          width = 80,
          options = {},
        },
      }
      require("zen-mode").toggle()
      vim.wo.wrap = true
      vim.wo.number = true
      vim.wo.rnu = true
    end)
  end,
}

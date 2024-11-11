return {
  {
    "codersauce/runst.nvim",
    lazy = false,
    opts = {},
    config = function()
      require("runst").setup()
      vim.api.nvim_set_keymap(
        "n",
        "<leader>tt",
        "<cmd>lua require'runst'.run_test()<cr>",
        { noremap = true, silent = true }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>tl",
        "<cmd>lua require'runst'.run_last_test()<cr>",
        { noremap = true, silent = true }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>tc",
        "<cmd>lua require'runst'.close()<cr>",
        { noremap = true, silent = true }
      )
    end,
  },
  {
    "saecki/crates.nvim",
    ft = { "toml" },
    config = function()
      require("crates").setup {
        completion = {
          cmp = {
            enabled = true,
          },
        },
      }
      require("cmp").setup.buffer {
        sources = { { name = "crates" } },
      }
    end,
  },
}

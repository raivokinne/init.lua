return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup {
        columns = { "" },
        keymaps = {
          ["<C-h>"] = false,
          ["<M-h>"] = "actions.select_split",
        },
        view_options = {
          show_hidden = true,
        },
        float = {
          padding = 2,
          max_width = 80,
          max_height = 20,
          border = "rounded",
          win_options = {
            winblend = 0,
          },
          get_win_title = nil,
          preview_split = "auto",
        },
      }

      vim.keymap.set("n", "e", require("oil").toggle_float)
    end,
  },
}

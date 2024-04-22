return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  deactivate = function()
    vim.cmd [[Neotree close]]
  end,
  init = function()
    if vim.fn.argc(-1) == 1 then
      local stat = vim.uv.fs_stat(vim.fn.argv(0))
      if stat and stat.type == "directory" then
        require "neo-tree"
      end
    end
  end,
  config = function()
    require("neo-tree").setup {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            ".DS_Store",
          },
        },
      },
    }

    vim.keymap.set("n", "<leader>ee", "<cmd>Neotree toggle<cr>")
    vim.keymap.set("n", "<leader>ef", "<cmd>Neotree focus<cr>")
    vim.keymap.set("n", "<leader>eg", "<cmd>Neotree git_status<cr>")
    vim.keymap.set("n", "<leader>ec", "<cmd>Neotree close<cr>")
  end,
}

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  cmd = "Neotree",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  init = function()
    require("neo-tree").setup {}
  end,
  opts = {
    sources = { "filesystem", "buffers", "git_status", "document_symbols" },
    open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
    filesystem = {
      bind_to_cwd = false,
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
      hidedotfiles = false,
      hidegitignored = true,
    },
    window = {
      mappings = {
        ["<space>"] = "none",
      },
    },
    default_component_configs = {
      indent = {
        with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
      },
    },
  },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>")
    vim.keymap.set("n", "<leader>ef", "<cmd>Neotree focus<cr>")
    vim.keymap.set("n", "<leader>ec", "<cmd>Neotree close<cr>")
    vim.keymap.set("n", "<leader>er", "<cmd>Neotree refresh<cr>")
  end,
}

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require "telescope.builtin"
      vim.keymap.set("n", "<leader>ps", builtin.find_files, {})
      vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
      vim.keymap.set("n", "<leader>/", function()
        builtin.grep_string { search = vim.fn.input "  > Find Word:  " }
      end)
      vim.keymap.set("n", "<leader>h", builtin.help_tags, {})
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {},
          },
        },
      }
      require("telescope").load_extension "ui-select"
    end,
  },
}

return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "windwp/nvim-ts-autotag",
  },
  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
      highlight = {
        enable = true, -- false will disable the whole extension
      },
      playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
      },
      autotag = {
        enable = true,
        enable_rename = true,
        enable_close = true,
        enable_close_on_slash = true,
      },
      context_commentstring = {
        enable = true,
        config = {
          javascriptreact = {
            style_element = "{/*%s*/}",
          },
        },
      },
      refactor = {
        highlight_definitions = { enable = true },
      },
    }
    vim.filetype.add {
      pattern = {
        [".*%.blade%.php"] = "blade",
      },
    }

    vim.filetype.add {
      pattern = {
        [".*%.slint"] = "slint",
      },
    }
  end,
}

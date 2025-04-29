return {
  "mfussenegger/nvim-lint",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local lint = require "lint"

    lint.linters_by_ft = {
      python = { "pylint" },
      lua = { "luacheck" },
      go = { "golangcilint" },
      rust = { "clippy" },
      markdown = { "markdownlint" },
      yaml = { "yamllint" },
      json = { "jsonlint" },
      sh = { "shellcheck" },
      cpp = { "cpplint", "clang_tidy" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })

    local tools = {}

    local linter_mapping = {
      biome = "biome",
      pylint = "pylint",
      luacheck = "luacheck",
      golangcilint = "golangci-lint",
      clippy = "rust-analyzer", -- clippy comes with rust-analyzer
      markdownlint = "markdownlint",
      yamllint = "yamllint",
      jsonlint = "jsonlint",
      shellcheck = "shellcheck",
      cpplint = "cpplint",
    }

    local all_linters = {}
    for _, linters in pairs(lint.linters_by_ft) do
      for _, linter in ipairs(linters) do
        all_linters[linter] = true
      end
    end

    for linter, _ in pairs(all_linters) do
      if linter_mapping[linter] then
        table.insert(tools, linter_mapping[linter])
      end
    end

    require("mason-tool-installer").setup {
      ensure_installed = tools,
      auto_update = true,
      run_on_start = true,
    }
  end,
}

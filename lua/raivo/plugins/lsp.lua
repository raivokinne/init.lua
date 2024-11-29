return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "williamboman/mason.nvim", config = true },
    "williamboman/mason-lspconfig.nvim",
    "j-hui/fidget.nvim",
  },
  config = function()
    local cmp_nvim_lsp = require "cmp_nvim_lsp"

    require("fidget").setup {}
    local capabilities = cmp_nvim_lsp.default_capabilities()

    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    require("mason").setup()
    require("mason-lspconfig").setup()

    local servers = {
      clangd = {},
      gopls = {},
      pyright = {},
      ts_ls = {},
      zls = {},
      html = { filetypes = { "htmldjango", "htmljinja", "html", "templ", "astro", "blade", "php" } },
      ols = {},
      rust_analyzer = {},
      phpactor = {},
      svelte = {},
      htmx = {
        filetypes = { "htmldjango", "htmljinja", "html", "templ", "astro", "blade", "php" },
      },
      custom_elements_ls = {
        filetypes = { "htmldjango", "htmljinja", "html", "templ", "astro", "blade", "php" },
      },
      emmet_language_server = {
        filetypes = {
          "htmldjango",
          "htmljinja",
          "html",
          "css",
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "blade",
          "php",
          "templ",
          "svelte",
          "astro",
        },
      },
      jsonls = {},
      cssls = {},
      tailwindcss = {},
      templ = {
        filetypes = { "html", "templ" },
      },
      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    }

    local mason_lspconfig = require "mason-lspconfig"

    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(servers),
    }

    mason_lspconfig.setup_handlers {
      function(server_name)
        require("lspconfig")[server_name].setup {
          capabilities = capabilities,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
        }
      end,
    }
  end,
}

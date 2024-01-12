return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "j-hui/fidget.nvim", opts = {} },
    { "williamboman/mason.nvim", config = true },
    "williamboman/mason-lspconfig.nvim",

    -- Useful status updates for LSP
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { "j-hui/fidget.nvim", opts = {} },

    -- Additional lua configuration, makes nvim stuff amazing!
    "folke/neodev.nvim",
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require "lspconfig"

    local util = lspconfig.util
    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require "cmp_nvim_lsp"

    require("neodev").setup()

    local on_attach = function(client, bufnr)
      local opts = { buffer = bufnr, remap = false }

      client.server_capabilities.semanticTokensProvider = nil

      vim.keymap.set("n", "gd", function()
        vim.lsp.buf.definition()
      end, opts)
      vim.keymap.set("n", "K", function()
        vim.lsp.buf.hover()
      end, opts)
      vim.keymap.set("n", "<leader>vws", function()
        vim.lsp.buf.workspace_symbol()
      end, opts)
      vim.keymap.set("n", "<leader>vd", function()
        vim.diagnostic.open_float()
      end, opts)
      vim.keymap.set("n", "[d", function()
        vim.diagnostic.goto_next()
      end, opts)
      vim.keymap.set("n", "]d", function()
        vim.diagnostic.goto_prev()
      end, opts)
      vim.keymap.set("n", "<leader>ca", function()
        vim.lsp.buf.code_action()
      end, opts)
      vim.keymap.set("n", "<leader>rr", function()
        vim.lsp.buf.references()
      end, opts)
      vim.keymap.set("n", "<leader>rn", function()
        vim.lsp.buf.rename()
      end, opts)
      vim.keymap.set("i", "<C-h>", function()
        vim.lsp.buf.signature_help()
      end, opts)
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
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
      rust_analyzer = {
        filetype = {
          "rust",
          "slint",
        },
      },
      tsserver = {},
      html = { filetypes = { "html", "twig", "hbs" } },
      intelephense = {},
      htmx = {
        filetypes = {
          "html",
          "blade",
          "php",
          "rust",
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "vue",
          "svelte",
          "astro",
          "go",
          "template",
        },
      },
      emmet_ls = {
        filetypes = {
          "html",
          "css",
          "scss",
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "blade",
          "php",
        },
      },
      cssls = {},
      jsonls = {},
      tailwindcss = {},
      yamlls = {},
      dockerls = {},
      asm_lsp = {},
      cssmodules_ls = {},
      slint_lsp = {
        filetypes = {
          "slint",
        },
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
          on_attach = on_attach,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
        }
      end,
    }
  end,
}

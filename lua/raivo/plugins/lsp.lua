return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
      -- used for completion, annotations and signatures of Neovim apis
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          -- Load luvit types when the `vim.uv` word is found
          { path = "luvit-meta/library", words = { "vim%.uv" } },
          { path = "/usr/share/awesome/lib/", words = { "awesome" } },
        },
      },
    },
    { "Bilal2453/luvit-meta", lazy = true },
    { "williamboman/mason.nvim" },
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    { "j-hui/fidget.nvim", opts = {} },
    "stevearc/conform.nvim",
  },
  config = function()
    local lspconfig = require "lspconfig"
    local capabilities = nil
    if pcall(require, "cmp_nvim_lsp") then
      capabilities = require("cmp_nvim_lsp").default_capabilities()
    end

    local servers = {
      bashls = true,
      clangd = {
        manual_install = true,
        cmd = { "/usr/bin/clangd" },
        init_options = { clangdFileStatus = true },
        filetypes = { "c", "cpp" },
      },
      ocamllsp = {
        manual_install = true,
        cmd = { "ocamllsp" },
        settings = {
          codelens = { enable = true },
          inlayHints = { enable = true },
          syntaxDocumentation = { enable = true },
        },

        server_capabilities = { semanticTokensProvider = false },
      },
      gopls = {
        manual_install = true,
        settings = {
          gopls = {
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
          },
        },
      },
      pyright = {},
      vtsls = {
        server_capabilities = {
          documentFormattingProvider = false,
        },
      },
      zls = {},
      ols = {},
      rust_analyzer = {},
      phpactor = {},
      svelte = {},
      jsonls = {},
      taplo = true,
      tailwindcss = {},
      biome = true,
      templ = {
        filetypes = { "html", "templ" },
      },
      elixirls = {
        cmd = { "/home/raivo/.local/share/nvim/mason/bin/elixir-ls" },
        root_dir = require("lspconfig.util").root_pattern { "mix.exs" },
      },
      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    }

    local servers_to_install = vim.tbl_filter(function(key)
      local t = servers[key]
      if type(t) == "table" then
        return not t.manual_install
      else
        return t
      end
    end, vim.tbl_keys(servers))

    require("mason").setup()
    local ensure_installed = {
      "stylua",
      "lua_ls",
      "delve",
    }

    vim.list_extend(ensure_installed, servers_to_install)
    require("mason-tool-installer").setup { ensure_installed = ensure_installed }

    for name, config in pairs(servers) do
      if config == true then
        config = {}
      end
      config = vim.tbl_deep_extend("force", {}, {
        capabilities = capabilities,
      }, config)

      lspconfig[name].setup(config)
    end

    require("raivo.autoformat").setup()
  end,
}

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim" },
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    { "j-hui/fidget.nvim", opts = {} },
  },
  config = function()
    local lspconfig = require "lspconfig"
    local capabilities = nil
    if pcall(require, "cmp_nvim_lsp") then
      capabilities = require("cmp_nvim_lsp").default_capabilities()
    end

    local servers = {
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
  end,
}

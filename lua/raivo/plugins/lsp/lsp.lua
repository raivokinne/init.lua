return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
        { "williamboman/mason.nvim",             config = true },
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

        local lsp_flags = {
            debounce_text_changes = 150,
        }

        -- enable mason
        require("lspconfig").kotlin_language_server.setup {
            on_attach = on_attach,
            flags = lsp_flags,
            root_dir = util.root_pattern("build.gradle", "gradlew", "pom.xml", ".git"),
            settings = {
                kotlin = {
                    compiler = {
                        jvmTarget = "17",
                    },
                },
            },
            capabilities = capabilities,
        }

        local servers = {
            clangd = {},
            gopls = {},
            tsserver = {},
            html = { filetypes = { "html", "templ", "astro", "blade", "php" } },
            intelephense = {},
            elixirls = {},
            cmake = {},
            htmx = {},
            jsonls = {},
            jdtls = {
                filetypes = { "java" },
            },
            zls = {
                filetypes = { "zig" },
            },
            astro = {
                filetypes = { "astro", "svelte", "php" },
            },
            emmet_ls = {
                filetypes = {
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
                    on_attach = on_attach,
                    settings = servers[server_name],
                    filetypes = (servers[server_name] or {}).filetypes,
                }
            end,
        }

        vim.diagnostic.config {
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        }
    end,
}

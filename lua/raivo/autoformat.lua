local setup = function()
  -- Autoformatting Setup
  local conform = require "conform"
  conform.setup {
    formatters = {
      php = {
        command = "php-cs-fixer",
        args = {
          "fix",
          "$FILENAME",
          "--config=/your/path/to/config/file/[filename].php",
          "--allow-risky=yes", -- if you have risky stuff in config, if not you dont need it.
        },
        stdin = false,
      },
    },
    formatters_by_ft = {
      lua = { "stylua" },
      blade = { "blade-formatter" },
      ocaml = { "ml-format" },
      ocaml_mlx = { "ocamlformat_mlx" },
      php = { "pint", "php_cs_fixer" },
    },
  }

  conform.formatters.injected = {
    options = {
      ignore_errors = false,
      lang_to_formatters = {
        sql = { "sleek" },
      },
    },
  }

  vim.api.nvim_create_autocmd("BufWritePre", {
    group = vim.api.nvim_create_augroup("custom-conform", { clear = true }),
    callback = function(args)
      local ft = vim.bo.filetype
      if ft == "blade" then
        require("conform").format {
          bufnr = args.buf,
          lsp_fallback = false,
          quiet = true,
          async = true,
        }

        return
      end

      if ft == "ocaml.mlx" then
        require("conform").format {
          bufnr = args.buf,
          formatters = { "ocamlformat_mlx" },
          lsp_fallback = false,
        }

        return
      end

      require("conform").format {
        bufnr = args.buf,
        lsp_fallback = true,
        quiet = true,
      }
    end,
  })
end

setup()

return { setup = setup }

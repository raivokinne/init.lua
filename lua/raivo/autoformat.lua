local setup = function()
  -- Autoformatting Setup
  local conform = require "conform"
  conform.setup {
    formatters = {
<<<<<<< HEAD
      ["ml-format"] = {
        command = "./_build/_private/default/.dev-tool/ocamlformat/ocamlformat/target/bin/ocamlformat",
        args = {
          "--enable-outside-detected-project",
          "--name",
          "$FILENAME",
          "-",
        },
=======
      php = {
        command = "php-cs-fixer",
        args = {
          "fix",
          "$FILENAME",
          "--config=/your/path/to/config/file/[filename].php",
          "--allow-risky=yes", -- if you have risky stuff in config, if not you dont need it.
        },
        stdin = false,
>>>>>>> 14296ee (update)
      },
    },
    formatters_by_ft = {
      lua = { "stylua" },
      blade = { "blade-formatter" },
<<<<<<< HEAD
      ocaml = { "ml-format" },
      ocaml_mlx = { "ocamlformat_mlx" },
=======
      php = { "pint", "php_cs_fixer" },
>>>>>>> 14296ee (update)
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
<<<<<<< HEAD
        -- Hmmm... this is a little weird,
        -- it seems like it should be automatic, but that's OK
=======
>>>>>>> 14296ee (update)
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

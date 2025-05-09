return {
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      picker = {
        debug = { scores = false, leaks = false, explorer = true, files = true },
        sources = {
          files_with_symbols = {
            multi = { "files", "lsp_symbols" },
            filter = {
              ---@param p snacks.Picker
              ---@param filter snacks.picker.Filter
              transform = function(p, filter)
                local symbol_pattern = filter.pattern:match "^.-@(.*)$"
                -- store the current file buffer
                if filter.source_id ~= 2 then
                  local item = p:current()
                  if item and item.file then
                    filter.meta.buf = vim.fn.bufadd(item.file)
                  end
                end

                if symbol_pattern and filter.meta.buf then
                  filter.pattern = symbol_pattern
                  filter.current_buf = filter.meta.buf
                  filter.source_id = 2
                else
                  filter.source_id = 1
                end
              end,
            },
          },
        },
        win = {
          input = {
            keys = {
              ["<C-l>"] = { "toggle_lua", mode = { "n", "i" } },
              ["<C-t>"] = { "edit_tab", mode = { "n", "i" } },
              ["<Esc>"] = { "close", mode = { "n", "i" } },
            },
          },
          list = {
            keys = {},
          },
        },
        actions = {
          toggle_lua = function(p)
            local opts = p.opts --[[@as snacks.picker.grep.Config]]
            opts.ft = not opts.ft and "lua" or nil
            p:find()
          end,
        },
      },
      profiler = {
        runtime = "~/projects/",
        presets = {
          on_stop = function()
            Snacks.profiler.scratch()
          end,
        },
      },
      -- indent = {
      --   chunk = { enabled = true },
      -- },
      dashboard = { example = "github" },
    },
		-- stylua: ignore
		keys = {
			{ "<leader>pf", function() Snacks.picker.smart() end, desc = "Smart Open" },
			{
				"<leader>dpd",
				desc = "Debug profiler",
				function()
					do return {
						a = {
							b = {
								c =  123,
							},
						},
					} end
					if not Snacks.profiler.running() then
						Snacks.notify("Profiler debug started")
						Snacks.profiler.start()
					else
						Snacks.profiler.debug()
						Snacks.notify("Profiler debug stopped")
					end
				end,
			},
		},
  },
}

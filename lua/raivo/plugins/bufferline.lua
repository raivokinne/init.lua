return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      -- stylua: ignore
		mode = "tabs",
      diagnostics = "nvim_lsp",
    },
  },
  config = function(_, opts)
    require("bufferline").setup(opts)
  end,
}

return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  keys = {
    { "<S-p>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
    { "<S-n>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
  },
  config = function()
    require("bufferline").setup {
      options = {
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    }
  end,
}

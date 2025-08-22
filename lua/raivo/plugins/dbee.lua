return {
  "kndndrj/nvim-dbee",
  dependencies = { "MunifTanjim/nui.nvim" },
  build = function()
    require("dbee").install()
  end,
  config = function()
    require("dbee").setup {}
    vim.keymap.set("n", "<space>od", function()
      require("dbee").open()
    end)
  end,
}

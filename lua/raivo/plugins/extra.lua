return {
  "jwalton512/vim-blade",
  "rktjmp/lush.nvim",
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },
}

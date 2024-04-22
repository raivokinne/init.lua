return {
  "Exafunction/codeium.vim",
  event = "InsertEnter",
  dependencies = {
    "onsails/lspkind-nvim",
  },
  config = function()
    vim.keymap.set("i", "<Tab>", function()
      return vim.fn["codeium#Accept"]()
    end, { expr = true })
    vim.keymap.set("i", "<C-Up>", function()
      return vim.fn["codeium#CycleCompletions"](1)
    end, { expr = true })
    vim.keymap.set("i", "<C-Down>", function()
      return vim.fn["codeium#CycleCompletions"](-1)
    end, { expr = true })
    vim.keymap.set("i", "<C-r>", function()
      return vim.fn["codeium#Clear"]()
    end, { expr = true })
  end,
}

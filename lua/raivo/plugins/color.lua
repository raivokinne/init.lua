function SetColor(color)
  color = color or "theme"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
  "rockerBOO/boo-colorscheme-nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("boo-colorscheme").use {
      italic = false, -- toggle italics
      theme = "boo",
    }
    SetColor "radioactive_waste"
  end,
}

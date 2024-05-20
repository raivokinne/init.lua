function SetColor(color)
  color = color or "tokyonight"
  vim.cmd.colorscheme(color)
end

return {
  "tiagovla/tokyodark.nvim",
  opts = {},
  config = function(_, opts)
    require("tokyodark").setup(opts)
    vim.cmd [[colorscheme tokyodark]]
  end,
}

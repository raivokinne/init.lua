return {
  "slugbyte/lackluster.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local lackluster = require "lackluster"
    lackluster.setup {
      tweak_background = {
        normal = "none", -- main background
        telescope = "none", -- telescope
        menu = "none", -- nvim_cmp, wildmenu ... (bad idea to transparent)
        popup = "none", -- lazy, mason, whichkey ... (bad idea to transparent)
      },
    }
    vim.cmd.colorscheme "lackluster-mint"
  end,
}

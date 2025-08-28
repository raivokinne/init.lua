-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'folke/trouble.nvim',
    opts = {},
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '[t',
        '<cmd>Trouble prev<cr>',
        desc = 'Previous (Trouble)',
      },
      {
        ']t',
        '<cmd>Trouble next<cr>',
        desc = 'Next (Trouble)',
      },
    },
  },
  {
    'mbbill/undotree',

    config = function()
      vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
    end,
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup()

      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():add()
      end)
      vim.keymap.set('n', '<C-e>', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)

      for _, idx in ipairs { 1, 2, 3, 4, 5 } do
        vim.keymap.set('n', string.format('<space>%d', idx), function()
          harpoon:list():select(idx)
        end)
      end
    end,
  },
}

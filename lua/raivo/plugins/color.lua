return {
    {
        "vague2k/huez.nvim",
        branch = "stable",
        event = "UIEnter",
        config = function()
            require("huez").setup({})
            vim.keymap.set("n", "<leader>h", vim.cmd.Huez)
        end,
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,
        priority = 1000,
        opts = {
            disable_background = true,
            disable_float_background = true,
            disable_italics = true
        },
        config = function(_, opts)
            require('rose-pine').setup(opts)
        end
    },
    {
        'comfysage/evergarden',
        priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
        lazy = false,
        opts = {
            transparent_background = true,
            contrast_dark = 'hard', -- 'hard'|'medium'|'soft'
            overrides = {},         -- add custom overrides
            style = {
                tabline = { reverse = true, color = 'green' },
                search = { reverse = false, inc_reverse = true },
                types = { italic = false },
                keyword = { italic = false },
                comment = { italic = false },
            },
        },
        config = function(_, opts)
            require("evergarden").setup(opts)
        end
    }
}

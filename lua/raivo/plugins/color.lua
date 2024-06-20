return {
    {
        "vague2k/huez.nvim",
        branch = "stable",
        event = "UIEnter",
        config = function()
            require("huez").setup()
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
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
        "rockerBOO/boo-colorscheme-nvim",
        lazy = false,
        priority = 1000,
        opts = {
            italic = false,
        },
        config = function(_, opts)
            require("boo-colorscheme").setup(opts)
        end
    },
}

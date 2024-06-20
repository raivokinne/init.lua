return {
    "andweeb/presence.nvim",
    event = "VeryLazy",
    opts = {
        -- General options
        auto_update = true, -- Update activity based on autocmds
        neovim_image_text = "The One True Text Editor",
        main_image = "neovim",
        enable_line_number = true,
        blacklist = {},
        buttons = false,
    },
    config = function(_, opts)
        require("presence").setup(opts)
    end
}

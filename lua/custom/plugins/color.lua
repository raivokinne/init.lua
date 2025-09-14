return {
    "vague2k/vague.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other plugins
    opts = {
        transparent = true, -- don't set background
        bold = true,
        italic = false,
    },
    config = function(_, opts)
        require("vague").setup(opts)
    end,
    init = function()
        vim.cmd("colorscheme vague")
    end
}

return {
    "xiyaowong/transparent.nvim",
    config = function()
        -- Optional, you don't have to run setup.
        require("transparent").setup({
            -- table: default groups
            groups = {
                'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
                'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
                'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
                'SignColumn',
                'EndOfBuffer',
            },
            extra_groups = {},
            exclude_groups = {},
        })
    end
}

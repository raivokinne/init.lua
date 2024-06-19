return {
    "Exafunction/codeium.nvim",
    event = "InsertEnter",
    cmd = "Codeium",
    build = ":Codeium Auth",
    opts = {},
    dependencies = {
        "onsails/lspkind-nvim",
    },
    config = function(_, opts)
        vim.keymap.set("i", "<C-y>", function()
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
        require("codeium").setup(opts)
    end
}

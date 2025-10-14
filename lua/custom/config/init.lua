require("custom.config.set")
require("custom.config.remap")

require("custom.plugins")

local plugin_dir = vim.fn.stdpath("config") .. "/lua/custom/plugins"
local files = vim.fn.globpath(plugin_dir, "*.lua", false, true)

for _, file in ipairs(files) do
    local module_name = file:match("lua/(.*)%.lua$"):gsub("/", ".")
    local ok, err = pcall(require, module_name)
    if not ok then
        vim.notify("Error loading " .. module_name .. "\n\n" .. err, vim.log.levels.ERROR)
    end
end

require("custom.config.lsp")
require("custom.config.autocmds")

vim.cmd.colorscheme("retrobox")

vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })

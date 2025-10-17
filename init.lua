vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

require("config")
require("plugins")

local plugin_dir = vim.fn.stdpath("config") .. "/lua/custom/plugins"
local files = vim.fn.globpath(plugin_dir, "*.lua", false, true)

for _, file in ipairs(files) do
    local module_name = file:match("lua/(.*)%.lua$"):gsub("/", ".")
    local ok, err = pcall(require, module_name)
    if not ok then
        vim.notify("Error loading " .. module_name .. "\n\n" .. err, vim.log.levels.ERROR)
    end
end

vim.cmd.colorschem("custom")

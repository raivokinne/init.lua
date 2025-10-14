local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then
  vim.notify("nvim-treesitter.configs not found", vim.log.levels.ERROR)
  return
end

configs.setup({
  ensure_installed = {
    "bash",
    "c",
    "diff",
    "html",
    "lua",
    "luadoc",
    "markdown",
    "markdown_inline",
    "query",
    "vim",
    "vimdoc",
  },
  auto_install = true,
  sync_install = false,
  indent = {
    enable = true,
  },
  highlight = {
    enable = true,
    disable = function(lang, buf)
      if lang == "html" then
        return true
      end
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        vim.notify("Treesitter disabled for large file", vim.log.levels.WARN)
        return true
      end
    end,
    additional_vim_regex_highlighting = { "markdown" },
  },
})

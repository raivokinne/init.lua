local ok, laravel = pcall(require, "laravel")
if not ok then
  return
end

laravel.setup({})

_G.Laravel = {
  app = function(abstract)
    return laravel.app:make(abstract)
  end,

  pickers = {
    laravel = function()
      local cmd = laravel.app:make("laravel.commands.command_center")
      cmd:handle()
    end,

    artisan = function()
      local cmd = laravel.app:make("laravel/commands/artisan")
      cmd:handle()
    end,

    routes = function()
      local cmd = laravel.app:make("laravel/commands/routes")
      cmd:handle()
    end,

    make = function()
      local cmd = laravel.app:make("laravel/commands/make")
      cmd:handle()
    end,

    commands = function()
      local cmd = laravel.app:make("laravel.commands.command_center")
      cmd:handle()
    end,

    resources = function()
      local cmd = laravel.app:make("laravel/commands/resources")
      cmd:handle()
    end,
  },

  commands = {
    run = function(name)
      local cmd_map = {
        ["view:finder"] = "laravel/commands/view_finder",
        ["view_finder"] = "laravel/commands/view_finder",
        ["actions"] = "laravel.actions",
        ["command_center"] = "laravel.commands.command_center",
        ["gf"] = "laravel/commands/gf",
      }

      local cmd_name = cmd_map[name] or name
      local cmd = laravel.app:make(cmd_name)

      if cmd and type(cmd.handle) == "function" then
        cmd:handle()
      elseif cmd and type(cmd) == "function" then
        cmd()
      else
        vim.notify("Laravel command '" .. name .. "' not found or has no handle method", vim.log.levels.WARN)
      end
    end,
  },

  run = function(args)
    local cmd = laravel.app:make("laravel/commands/artisan")
    cmd:handle()
  end,

  tinker = {
    open = function()
      local cmd = laravel.app:make("laravel.extensions.tinker.tinker:open")
      if cmd then cmd:handle() end
    end,

    create = function()
      local cmd = laravel.app:make("laravel.extensions.tinker.tinker:create")
      if cmd then cmd:handle() end
    end,

    -- Select from existing tinker buffers
    select = function()
      local cmd = laravel.app:make("laravel.extensions.tinker.tinker:select")
      if cmd then cmd:handle() end
    end,

    -- Execute raw tinker code and get response
    ---@param code string
    ---@return table, any error
    raw = function(code)
      local tinker_service = laravel.app:make("tinker")
      if not tinker_service then
        return {}, "Tinker service not available"
      end
      return tinker_service:raw(code)
    end,

    -- Execute tinker code and get text response
    ---@param code string
    ---@return string, any error
    text = function(code)
      local tinker_service = laravel.app:make("tinker")
      if not tinker_service then
        return "", "Tinker service not available"
      end
      return tinker_service:text(code)
    end,

    -- Execute tinker code and get JSON response
    ---@param code string
    ---@return table, any error
    json = function(code)
      local tinker_service = laravel.app:make("tinker")
      if not tinker_service then
        return {}, "Tinker service not available"
      end
      return tinker_service:json(code)
    end,
  },
}

vim.api.nvim_create_user_command("Laravel", function()
  Laravel.pickers.laravel()
end, { desc = "Open Laravel command center" })

-- Setup keymaps
local map = vim.keymap.set

map("n", "<leader>ll", function() Laravel.pickers.laravel() end, { desc = "Laravel: Open Laravel Picker" })
map("n", "<c-g>", function() Laravel.commands.run("view_finder") end, { desc = "Laravel: Open View Finder" })
map("n", "<leader>la", function() Laravel.pickers.artisan() end, { desc = "Laravel: Open Artisan Picker" })
map("n", "<leader>lt", function()
  local actions = Laravel.app("laravel.actions")
  if actions then
    actions:handle()
  end
end, { desc = "Laravel: Open Actions Picker" })
map("n", "<leader>lr", function() Laravel.pickers.routes() end, { desc = "Laravel: Open Routes Picker" })
map("n", "<leader>lh", function() Laravel.pickers.artisan() end, { desc = "Laravel: Open Artisan" })
map("n", "<leader>lm", function() Laravel.pickers.make() end, { desc = "Laravel: Open Make Picker" })
map("n", "<leader>lc", function() Laravel.pickers.laravel() end, { desc = "Laravel: Open Command Center" })
map("n", "<leader>lo", function() Laravel.pickers.resources() end, { desc = "Laravel: Open Resources Picker" })
map("n", "<leader>lp", function() Laravel.commands.run("command_center") end, { desc = "Laravel: Open Command Center" })

map("n", "<leader>lto", function() Laravel.tinker.open() end, { desc = "Laravel: Open Tinker" })
map("n", "<leader>ltc", function() Laravel.tinker.create() end, { desc = "Laravel: Create Tinker Buffer" })
map("n", "<leader>lts", function() Laravel.tinker.select() end, { desc = "Laravel: Select Tinker Buffer" })

map("n", "gf", function()
  local gf_service = Laravel.app("gf")
  if gf_service and gf_service.cursorOnResource and gf_service:cursorOnResource() then
    Laravel.commands.run("gf")
    return ""
  end
  return "gf"
end, { expr = true, noremap = true, desc = "Go to file or Laravel resource" })

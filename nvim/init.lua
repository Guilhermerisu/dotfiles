require("config.options")

local plugin_dir = vim.fn.stdpath("config") .. "/lua/plugins"

local files = vim.fn.readdir(plugin_dir)

for _, file in ipairs(files) do
  if file ~= "init.lua" and file:sub(-4) == ".lua" then
    local module = "plugins." .. file:gsub("%.lua$", "")
    require(module)
  end
end

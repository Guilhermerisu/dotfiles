vim.pack.add({
  { src = "https://github.com/folke/which-key.nvim" },
})

local wk = require("which-key")

 wk.setup({
  preset = "helix",
  delay = 500,
})

wk.add({
  { "<leader>f", group = "find", icon = "📁"},
  { "<leader>g", group = "git", icon = {icon = "", color = "red"}},
  { "<leader>u", group = "Undo", icon = "🌱" },
  { "<leader>x", group = "Problems", icon = "⚒️" },
})

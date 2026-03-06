vim.pack.add({
  { src = "https://github.com/folke/which-key.nvim" },
})

local wk = require("which-key")

 wk.setup({
  preset = "helix",
 })

wk.add({
  { "<leader>g", group = "git", icon = {icon = "", color = "red"}},
})

vim.pack.add({
  { src = "https://github.com/folke/snacks.nvim" },
})

require("snacks").setup({
  picker = { enabled = true },
  bigfile = { enabled = true },
  dashboard = { enabled = true },
  explorer = { enabled = true },
  quickfile = { enabled = true },
  animate = { enabled = true },
  input = { enabled = true },
  notifier = { enabled = true },
  scroll = { enabled = true },
  statuscolumn = { enabled = true },
  words = { enabled = true },
  indent = { enabled = true },
})

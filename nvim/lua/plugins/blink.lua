vim.pack.add({
  {
    src = "https://github.com/Saghen/blink.cmp",
  },
})

require("blink.cmp").setup({
  keymap = {
    preset = "default",
  },

  completion = {
    documentation = {
      auto_show = true,
    },
  },

  sources = {
    default = { "lsp", "path", "buffer" },
  },
})

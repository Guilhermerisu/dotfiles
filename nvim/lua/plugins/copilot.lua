vim.pack.add({
  { src = "https://github.com/zbirenbaum/copilot.lua" },
})

require("copilot").setup({
  suggestion = {
    enabled = true,
    auto_trigger = true,
    keymap = {
      accept = "<Tab>",
    },
  },
  panel = { enabled = false },
})


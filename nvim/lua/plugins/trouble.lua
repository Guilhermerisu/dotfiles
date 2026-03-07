vim.pack.add({
  { src = "https://github.com/folke/trouble.nvim" },
})

require("trouble").setup()

vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Diagnostics (buffer)" })
vim.keymap.set("n", "<leader>xq", "<cmd>Trouble quickfix toggle<cr>", { desc = "Quickfix" })
vim.keymap.set("n", "<leader>xr", "<cmd>Trouble lsp_references toggle<cr>", { desc = "References" })

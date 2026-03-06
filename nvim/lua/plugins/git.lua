vim.pack.add({
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
  { src = "https://github.com/esmuellert/codediff.nvim" },
})


local gitsigns = require("gitsigns")

gitsigns.setup({
  current_line_blame = true,

  current_line_blame_opts = {
    delay = 100,
    virt_text_pos = "eol",
  },
})

vim.keymap.set("n", "<leader>gn", function()
  gitsigns.nav_hunk("next")
end, { desc = "Next hunk" })

vim.keymap.set("n", "<leader>gp", function()
  gitsigns.nav_hunk("prev")
end, { desc = "Previous hunk" })

vim.keymap.set("n", "<leader>gr", function()
  gitsigns.reset_hunk()
end, { desc = "Reset hunk" })


require("codediff").setup()

vim.keymap.set("n", "<leader>gh", "<cmd>CodeDiff<CR>", { desc = "Open diffs" })

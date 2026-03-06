vim.pack.add({
  { src = "https://github.com/echasnovski/mini.diff" },
  { src = "https://github.com/esmuellert/codediff.nvim" },
})

local diff = require("mini.diff")

diff.setup()

vim.keymap.set("n", "<leader>gn", function()
  diff.goto_hunk("next")
end, { desc = "Next hunk" })

vim.keymap.set("n", "<leader>gp", function()
  diff.goto_hunk("prev")
end, { desc = "Previous hunk" })

vim.keymap.set("n", "<leader>gr", function()
  diff.reset_hunk()
end, { desc = "Reset hunk" })

require("codediff").setup()

vim.keymap.set("n", "<leader>gh", "<cmd>CodeDiff<CR>", { desc = "Open diffs" })

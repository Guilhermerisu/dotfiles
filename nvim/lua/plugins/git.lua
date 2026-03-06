vim.pack.add({
  { src = "https://github.com/echasnovski/mini.diff" },
  { src = "https://github.com/sindrets/diffview.nvim" },
  { src = "https://github.com/nvim-lua/plenary.nvim" },
})

-- mini.diff

local diff = require("mini.diff")

diff.setup()

vim.keymap.set("n", "gn", function()
  diff.goto_hunk("next")
end)

vim.keymap.set("n", "gp", function()
  diff.goto_hunk("prev")
end)

vim.keymap.set("n", "<leader>gr", function()
  diff.reset_hunk()
end, { desc = "Reset hunk" })

-- diffview

local diffview_open = false

vim.keymap.set("n", "gh", function()
  if diffview_open then
    vim.cmd("DiffviewClose")
    diffview_open = false
  else
    vim.cmd("DiffviewOpen")
    diffview_open = true
  end
end, { desc = "Toggle diffview" })

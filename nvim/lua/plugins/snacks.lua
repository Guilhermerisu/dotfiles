return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    picker = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  keys = {
    -- find
    { "<leader>fg", false },
    -- git
    { "<leader>gL", false },
    { "<leader>gd", false },
    { "<leader>gi", false },
    { "<leader>gI", false },
    { "<leader>gp", false },
    { "<leader>gP", false },
    { "<leader>gd", false },
    { "<leader>gD", false },
    -- Grep
    { "<leader>z",  false },
    { "<leader>Z",  false },
    { "<leader>.",  false },
    { "<leader>S",  false },
    { "<leader>n",  false },
    { "<leader>bd", false },
    { "<leader>cR", false },
    { "<leader>un", false },
    { "<c-/>",      false },
    { "<c-_>",      false },
  },
}

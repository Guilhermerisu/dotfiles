vim.pack.add({
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
})
require("nvim-treesitter.config").setup({
  ensure_installed = {
    "lua",
    "typescript",
    "tsx",
    "javascript",
    "c_sharp",
    "json",
    "html",
    "css",
    "bash",
    "markdown",
  },

  highlight = { enable = true },
  indent = { enable = true },
})

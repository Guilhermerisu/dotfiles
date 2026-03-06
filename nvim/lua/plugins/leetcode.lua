vim.pack.add({
  { src = "https://github.com/wakatime/vim-wakatime" },

  { src = "https://github.com/kawre/leetcode.nvim" },
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/MunifTanjim/nui.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

-- LeetCode configuration
require("leetcode").setup({
  lang = "typescript",
})

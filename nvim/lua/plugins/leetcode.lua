return {
  "kawre/leetcode.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    -- Treesitter is already included by LazyVim, no need to force-build here
  },
  opts = {
    lang = "typescript",
  },
}

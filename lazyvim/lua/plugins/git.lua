return {
  -- 1. Gitsigns (The green/red lines and blame)
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true, -- PERMANENT BLAME ACTIVE
      current_line_blame_opts = {
        delay = 100,
        virt_text_pos = "eol",
      },
    },
    keys = {
      {
        "<leader>hn",
        function()
          require("gitsigns").nav_hunk("next")
        end,
        desc = "Next Git Hunk",
      },
      {
        "<leader>hp",
        function()
          require("gitsigns").nav_hunk("prev")
        end,
        desc = "Prev Git Hunk",
      },
    },
  },
  {
    "esmuellert/codediff.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    -- This plugin is primarily for side-by-side diffing
    opts = {
      -- It automatically matches your Catppuccin theme's background
      -- No extra config needed, but you can add options here
    },
    keys = {
      -- Compare the current file with its git version (the VS Code feel)
      { "<leader>v", "<cmd>CodeDiff<cr>", desc = "Open VS Code-style Diff" },
    },
  },
  {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    config = true,
    keys = { -- Load the plugin only when you press Space + u
      { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>", desc = "Toggle Undotree" },
    },
  },
}

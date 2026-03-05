return {
  -- 1. Extend Mason to include the Roslyn registry
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      -- Add the Crashdummyy registry for C# tools
      opts.registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
      }
    end,
  },

  -- 2. Setup the Roslyn Plugin
  {
    "seblyng/roslyn.nvim",
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
    opts = {
      -- your configuration comes here; leave empty for default settings
    }
  },
  {
  "neovim/nvim-lspconfig",
  opts = {
    -- This is the specific flag for the LSP provider
    autoformat = false,
  },
}
}

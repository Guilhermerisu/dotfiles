return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",    -- This is the darker version! "moon" is also very nice.
      transparent = true, -- Set to true if you want to see your wallpaper!
      terminal_colors = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night", -- Make sure to set the specific variant here
    },
  },
}

vim.pack.add({
  { src = "https://github.com/folke/tokyonight.nvim" },
  { src = "https://github.com/echasnovski/mini.icons" },
})

require("tokyonight").setup({
  style = "night",
  transparent = true,
  terminal_colors = true,
  styles = {
    sidebars = "transparent",
    floats = "transparent",
  },
})

require("mini.icons").setup()
vim.cmd.colorscheme("tokyonight-night")

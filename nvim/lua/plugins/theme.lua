vim.pack.add({
	{ src = "https://github.com/echasnovski/mini.icons" },
	{ src = "https://github.com/folke/tokyonight.nvim" },
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
MiniIcons.mock_nvim_web_devicons()

vim.cmd.colorscheme("tokyonight-night")

vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })

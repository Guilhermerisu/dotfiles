vim.pack.add({
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
})

require("lualine").setup({
	options = {
		theme = "auto",
		globalstatus = true,
	},

	sections = {
		lualine_a = { "mode" },

		lualine_b = {
			"branch",
			"diff",
			"diagnostics",
		},

		lualine_c = {
			{ "filename", path = 1 },
		},

		lualine_x = {
			{
				"lsp_status",
				icon = "",
				symbols = {
					spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
					done = "✓",
					separator = " ",
				},
				show_name = true,
			},
		},

		lualine_y = { "progress" },

		lualine_z = { "location" },
	},
})
vim.api.nvim_set_hl(0, "lualine_c_normal", { bg = "none" })
vim.api.nvim_set_hl(0, "lualine_c_insert", { bg = "none" })
vim.api.nvim_set_hl(0, "lualine_c_visual", { bg = "none" })
vim.api.nvim_set_hl(0, "lualine_c_replace", { bg = "none" })
vim.api.nvim_set_hl(0, "lualine_c_command", { bg = "none" })
vim.api.nvim_set_hl(0, "lualine_c_inactive", { bg = "none" })
vim.api.nvim_set_hl(0, "lualine_x_normal", { bg = "none" })
vim.api.nvim_set_hl(0, "lualine_x_insert", { bg = "none" })
vim.api.nvim_set_hl(0, "lualine_x_visual", { bg = "none" })
vim.api.nvim_set_hl(0, "lualine_x_replace", { bg = "none" })
vim.api.nvim_set_hl(0, "lualine_x_command", { bg = "none" })
vim.api.nvim_set_hl(0, "lualine_x_inactive", { bg = "none" })

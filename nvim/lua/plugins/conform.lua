vim.pack.add({
	{ src = "https://github.com/stevearc/conform.nvim" },
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		json = { "prettier" },
	},

	format_on_save = {
		timeout_ms = 500,
	},
})

local opt = vim.opt

vim.g.mapleader = " "
vim.g.maplocalleader = " "

opt.number = true
opt.relativenumber = true
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true

opt.termguicolors = true
opt.signcolumn = "yes"

opt.clipboard = "unnamedplus"

opt.undofile = true
opt.undodir = vim.fn.stdpath("state") .. "/undo"

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "🛑",
			[vim.diagnostic.severity.WARN] = "⚠️",
			[vim.diagnostic.severity.INFO] = "ℹ️",
			[vim.diagnostic.severity.HINT] = "💡",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
			[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
			[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
			[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
		},
	},

	virtual_text = {
		spacing = 2,
		source = "if_many",
		prefix = function(diagnostic)
			local icons = {
				[vim.diagnostic.severity.ERROR] = "🛑",
				[vim.diagnostic.severity.WARN] = "⚠️",
				[vim.diagnostic.severity.INFO] = "ℹ️",
				[vim.diagnostic.severity.HINT] = "💡",
			}
			return icons[diagnostic.severity] .. " "
		end,
	},

	underline = true,
	severity_sort = true,
	update_in_insert = false,
})

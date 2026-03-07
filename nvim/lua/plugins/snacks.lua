vim.pack.add({
	{ src = "https://github.com/folke/snacks.nvim" },
})

require("snacks").setup({
	picker = { enabled = true },
	bigfile = { enabled = true },
	explorer = { enabled = true },
	quickfile = { enabled = true },
	animate = { enabled = true },
	input = { enabled = true },
	notifier = { enabled = true },
	scroll = { enabled = true },
	statuscolumn = { enabled = true },
	words = { enabled = true },
	indent = { enabled = true },
	lazygit = { enabled = true },
	dashboard = {
		enabled = true,
		sections = {
			{ section = "header" },
			{ section = "keys", gap = 1 },
		},
		preset = {
			header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
      ]],
			keys = {
				{
					icon = " ",
					key = "f",
					desc = "Find File",
					action = function()
						Snacks.dashboard.pick("files")
					end,
				},

				{
					icon = " ",
					key = "p",
					desc = "Projects",
					action = function()
						Snacks.picker.projects()
					end,
				},

				{ icon = " ", key = "s", desc = "Restore Session", section = "session" },

				{ icon = "󰒲 ", key = "l", desc = "Leetcode", action = ":Leet" },

				{
					icon = " ",
					key = "c",
					desc = "Config",
					action = function()
						Snacks.dashboard.pick("files", { cwd = vim.fn.stdpath("config") })
					end,
				},

				{ icon = " ", key = "q", desc = "Quit", action = ":qa" },

				{ section = "recent_files", gap = 2 },
			},
		},
	},
})

local function project_root()
	local file = vim.api.nvim_buf_get_name(0)
	local dir = vim.fn.fnamemodify(file, ":h")

	local git = vim.fn.systemlist("git -C " .. dir .. " rev-parse --show-toplevel")[1]

	if git and git ~= "" then
		return git
	end

	return dir
end

vim.keymap.set("n", "<leader>fe", function()
	Snacks.explorer({ cwd = project_root() })
end, { desc = "File Explorer" })

vim.keymap.set("n", "<leader>ff", function()
	Snacks.picker.smart({ cwd = project_root() })
end, { desc = "Find Files" })

vim.keymap.set("n", "<leader>fg", function()
	Snacks.picker.grep({ cwd = project_root() })
end, { desc = "Grep" })

vim.keymap.set("n", "<leader>fp", function()
	Snacks.picker.files({ cwd = "~/projects" })
end, { desc = "Find Files Projects" })

vim.keymap.set("n", "<leader>fP", function()
	Snacks.picker.grep({ cwd = "~/projects" })
end, { desc = "Grep Projects" })

vim.keymap.set("n", "<leader>fr", function()
	Snacks.picker.recent()
end, { desc = "Recent Files" })

vim.keymap.set("n", "<leader>fc", function()
	Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Find Config File" })

vim.keymap.set({ "n", "x" }, "<leader>fw", function()
	Snacks.picker.grep_word()
end, { desc = "Grep Word / Selection" })

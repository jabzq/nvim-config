return {
	"mikavilpas/yazi.nvim",
	event = "VeryLazy",
	keys = {
		{
			"<leader>e",
			"<cmd>Yazi<cr>",
			desc = "Open yazi at the current file",
		},
		{
			-- Open in the current working directory
			"<leader>ew",
			"<cmd>Yazi cwd<cr>",
			desc = "Open the file manager in nvim's working directory",
		},
		{
			-- NOTE: this requires a version of yazi that includes
			-- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
			"<leader>er",
			"<cmd>Yazi toggle<cr>",
			desc = "Resume the last yazi session",
		},
	},
	opts = {
		-- if you want to open yazi instead of netrw, see below for more info
		open_for_directories = true,
		keymaps = {
			show_help = "<f1>",
		},
		floating_window_prefs = {
			border = "rounded",
			width = 0.8,
			height = 0.8,
		},
	},
}

local utils = require("utils")

require("options")
require("keymaps")
require("lazyconf")
vim.cmd.colorscheme("vague")

utils.color_overrides.setup_colorscheme_overrides()

utils.fix_telescope_parens_win()
utils.dashboard.setup_dashboard_image_colors()

if vim.fn.has("wsl") == 1 then
	vim.g.clipboard = {
		name = "WslClipboard",
		copy = { ["+"] = "win32yank.exe -i --crlf", ["*"] = "win32yank.exe -i --crlf" },
		paste = { ["+"] = "win32yank.exe -o --lf", ["*"] = "win32yank.exe -o --lf" },
		cache_enabled = 0,
	}
end

return {
	"goolord/alpha-nvim",
	dependencies = {
		"echasnovski/mini.icons",
	},

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			[[                              ]],
			[[      ⢀⣠⣤⣶⣶⡞⡀⣤⣬⣴⠀⠀⢳⣶⣶⣤⣄⡀⠀⠀⠀⠀⠀⠀]],
			[[⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⡇⠀⢸⣿⠿⣿⡇⠀⠀⠸⣿⣿⣿⣿⣷⣦⡀⠀⠀⠀]],
			[[⠀⠀⢠⡾⣫⣿⣻⣿⣽⣿⡇⠀⠈⢿⣧⡝⠟⠀⠀⢸⣿⣿⣿⣿⣿⣟⢷⣄⠀⠀]],
			[[⠀⢠⣯⡾⢿⣿⣿⡿⣿⣿⣿⣆⣠⣶⣿⣿⣷⣄⣰⣿⣿⣿⣿⣿⣿⣿⢷⣽⣄⠀]],
			[[⢠⣿⢋⠴⠋⣽⠋⡸⢱⣯⡿⣿⠏⣡⣿⣽⡏⠹⣿⣿⣿⡎⢣⠙⢿⡙⠳⡙⢿⠄]],
			[[⣰⢣⣃⠀⠊⠀⠀⠁⠘⠏⠁⠁⠸⣶⣿⡿⢿⡄⠈⠀⠁⠃⠈⠂⠀⠑⠠⣈⡈⣧]],
			[[⡏⡘⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡥⢄⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢳⢸]],
			[[⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣄⣸⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢨]],
			[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡴⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈]],
			[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡳⣶⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
		}

		dashboard.section.buttons.val = {
			-- dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("b", "λ  > Browse files", ":Yazi<CR>"),
			dashboard.button("z", "λ  > Browse Directories", ":Telescope zoxide list<CR>"),
			dashboard.button("f", "λ  > Find file", ":Telescope find_files<CR>"),
			dashboard.button("r", "λ  > Recent", ":Telescope oldfiles<CR>"),
			dashboard.button("q", "λ  > Exit", ":qa<CR>"),
		}

		dashboard.config.layout = {
			{ type = "padding", val = 2 },
			dashboard.section.header,
			{ type = "padding", val = 2 },
			dashboard.section.buttons,
			{ type = "padding", val = 1 },
			dashboard.section.footer,
		}

		vim.api.nvim_create_autocmd("User", {
			pattern = "AlphaReady",
			callback = function()
				vim.opt_local.fillchars = { eob = " " } -- Substitui o ~ por espaço vazio
				vim.opt_local.laststatus = 0
			end,
		})

		-- Garante que as linhas voltem ao normal ao sair do dashboard
		vim.api.nvim_create_autocmd("BufUnload", {
			buffer = 0,
			callback = function()
				vim.opt.fillchars = { eob = "~" }
				vim.opt.laststatus = 3
			end,
		})

		local function footer()
			local version = vim.version()
			return string.format("Neovim v%d.%d.%d", version.major, version.minor, version.patch)
		end

		dashboard.section.footer.val = footer()

		alpha.setup(dashboard.opts)
	end,
}

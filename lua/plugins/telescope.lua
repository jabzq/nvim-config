return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"jvgrootveld/telescope-zoxide",
			"nvim-telescope/telescope-ui-select.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
		config = function()
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")

			telescope.setup({
				path_display = { "smart" },
				defaults = {
					preview = {
						treesitter = false,
					},
					border = {
						prompt = { 1, 1, 1, 1 },
						results = { 1, 1, 1, 1 },
						preview = { 1, 1, 1, 1 },
					},
					borderchars = {
						prompt = { " ", " ", "─", "│", "│", " ", "─", "└" },
						results = { "─", " ", " ", "│", "┌", "─", " ", "│" },
						preview = { "─", "│", "─", "│", "┬", "┐", "┘", "┴" },
					},
				},
				pickers = {
					colorscheme = {
						enable_preview = true,
					},
					find_files = {
						hidden = true,
						-- Comando otimizado com ripgrep (rg)
						find_command = {
							"rg",
							"--files",
							"--hidden",
							"--glob",
							"!{.git/*,.next/*,.svelte-kit/*,target/*,node_modules/*}",
						},
					},
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})

			telescope.load_extension("fzf")
			telescope.load_extension("zoxide")
			telescope.load_extension("ui-select")

			--- Mapeamentos de Teclas ---
			-- Find Files (substituí <leader>jk por <leader>ff por padrão, mas deixei sua escolha)
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope Find Files" })
			vim.keymap.set("n", "<leader>jk", builtin.find_files, { desc = "Telescope Find Files (Alt)" })

			-- Busca de texto
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope Live Grep" })

			-- Navegação e LSP
			vim.keymap.set("n", "<leader>fz", ":Telescope zoxide list<CR>", { desc = "Zoxide List" })
			vim.keymap.set("n", "<leader>fr", require("telescope.builtin").oldfiles, { desc = "Arquivos Recentes" })
			vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "LSP Diagnostics" })
			vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols, { desc = "LSP Document Symbols" })
			vim.keymap.set("n", "<leader>ws", builtin.lsp_workspace_symbols, { desc = "LSP Workspace Symbols" })

			-- Utilidades
			vim.keymap.set("n", "<leader>fv", builtin.help_tags, { desc = "Help Tags" })
			vim.keymap.set("n", "<leader>fp", builtin.builtin, { desc = "Telescope Builtin Pickers" })

			-- Alpha e Tema
			vim.keymap.set("n", "<leader>fa", ":Alpha<cr>", { desc = "Alpha dashboard" })
			vim.keymap.set("n", "<leader>th", builtin.colorscheme, { desc = "Trocar Tema (Preview)" })
		end,
	},
}

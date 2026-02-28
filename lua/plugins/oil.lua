return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			-- Configurações visuais
			default_file_explorer = true, -- substitui o netrw (explorador padrão do vim)
			columns = {
				"icon",
				-- "permissions",
				-- "size",
				-- "mtime",
			},
			-- Configurações da janela
			view_options = {
				show_hidden = true, -- mostra arquivos ocultos (dotfiles)
				is_hidden_file = function(name, bufnr)
					return vim.startswith(name, "..")
				end,
			},
			float = {
				padding = 8,
				max_width = 50,
				max_height = 25,
				border = "rounded",
			},
		})

		vim.keymap.set("n", "-", function()
			require("oil").open_float()
		end, { desc = "Oil Flutuante" })
	end,
}

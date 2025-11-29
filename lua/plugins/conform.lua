return {
	"stevearc/conform.nvim",
	lazy = true,
	cmd = { "ConformInfo" },
	event = { "BufWritePre" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				json = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				go = { "gofmt" },
				-- Exemplo: python = { "isort", "black" },
			},
			format_on_save = {
				lsp_format = "if_no_formatters", -- Use o LSP para formatar se conform não tiver um formatter
				async = false, -- Torna o processo síncrono para evitar salvar o arquivo antes da formatação
				timeout_ms = 500,
				-- Se você tem um projeto com prettier configurado, você pode fazer:
				-- ft_whitelist = { "javascript", "typescript", "json", "css" },
			},
		})
	end,
}

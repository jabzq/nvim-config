return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	config = function()
		vim.g.disable_autoformat = false

		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				javascriptreact = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", "prettier", stop_after_first = true },
				astro = { "prettier" },
				go = { "goimports-reviser", "gofumpt", "golines" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				yaml = { "yamlfmt" },
				html = { "prettier" },
				json = { "prettier" },
				markdown = { "prettier" },
				css = { "prettier" },
			},
			format_on_save = function(bufnr)
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				return {
					timeout_ms = 500,
					lsp_format = "fallback",
				}
			end,
		})

		-- Atalho para ligar/desligar a formatação (Toggle)
		vim.keymap.set("n", "<leader>uf", function()
			vim.g.disable_autoformat = not vim.g.disable_autoformat
			print("Autoformat: " .. (vim.g.disable_autoformat and "OFF" or "ON"))
		end, { desc = "Toggle Format on Save" })
	end,
}

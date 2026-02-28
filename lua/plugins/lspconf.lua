return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				PATH = "prepend",
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				automatic_enable = false,
				ensure_installed = {
					"lua_ls",
					"gopls",
					"clangd",
					"pyright",
				},
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"goimports-reviser",
					"gofumpt",
					"golines",
					"stylua",
					"prettier",
					"clang-format",
					"black",
					"isort",
					"yamlfmt",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				-- cmd = { "lua_ls" },
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" }, -- Recognize 'vim' as a global variable
						},
						workspace = {
							library = {
								vim.api.nvim_get_runtime_file("", true),
								"${3rd}/love2d/library",
							}, -- Include Neovim runtime files
						},
						telemetry = {
							enable = false,
						},
					},
				},
			})

			vim.lsp.config("gopls", {
				capabilities = capabilities,
				settings = {
					gopls = {
						analyses = { unusedparams = true },
						staticcheck = true,
						gofumpt = true,
					},
				},
			})

			vim.lsp.config("clangd", {
				capabilities = capabilities,
				cmd = {
					"clangd",
					"--background-index",
					"--clang-tidy",
					"--header-insertion=iwyu",
					"--completion-style=detailed",
					"--function-arg-placeholders",
					"--fallback-style=llvm",
				},
			})

			vim.lsp.config("pyright", {
				capabilities = capabilities,
				settings = {
					python = {
						analysis = {
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
							diagnosticMode = "workspace",
						},
					},
				},
			})

			vim.lsp.enable({ "gopls" })
			vim.lsp.enable({ "lua_ls" })
			vim.lsp.enable({ "clangd" })
			vim.lsp.enable({ "pyright" })
		end,
	},
}

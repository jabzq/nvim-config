return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rcarriga/cmp-dap",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			-- Opcional: Configuração para lspkind (ícones)
			-- local lspkind = require("lspkind")

			cmp.setup({
				-- Configuração de Snippets
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				-- Fontes de Completion
				sources = cmp.config.sources({
					{ name = "nvim_lsp" }, -- Sugestões do LSP
					{ name = "luasnip" }, -- Sugestões de Snippets
					{ name = "buffer" }, -- Sugestões do Buffer
					{ name = "path" }, -- Sugestões de Caminhos
				}),
				-- Mapeamentos de Teclas
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<C-e>"] = cmp.mapping.abort(),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),

				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				-- Opcional: Formatação de itens (se usar lspkind.nvim)
				-- formatting = {
				--     format = lspkind.cmp_format({ with_text = true, menu = {} }),
				-- },

				preselect = cmp.PreselectMode.None,
			})
			cmp.setup.cmdline("/", {
				sources = cmp.config.sources({ { name = "buffer" } }),
			})

			cmp.setup.cmdline(":", {
				sources = cmp.config.sources({
					{ name = "path" },
					{ name = "cmdline" },
				}),
			})
		end,
	},
}

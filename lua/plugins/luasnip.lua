return {
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		config = function()
			local ls = require("luasnip")

			-- Configurações básicas
			ls.setup({
				history = true,
				update_events = "TextChanged,TextChangedI",
			})

			-- Carregar seus snippets customizados da pasta lua/snippets
			-- O Neovim procura dentro do rtp (runtime path), então 'lua/snippets' funciona
			require("luasnip.loaders.from_lua").lazy_load({
				paths = { vim.fn.stdpath("config") .. "/lua/snippets" },
			})

			-- Opcional: carregar também o friendly-snippets se você o tiver
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
}

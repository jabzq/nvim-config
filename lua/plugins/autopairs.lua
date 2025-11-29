return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",

	config = function()
		local npairs = require("nvim-autopairs")

		-- Configuração Principal que funciona
		npairs.setup({
			check_ts = true,
			ts_config = {
				lua = { "string", "source" },
				javascript = { "string", "template_string" },
			},
			disable_filetype = { "TelescopePrompt", "spectre_panel" },
			map_bs = true, -- <--- Adicione estas duas linhas para melhorar a experiência
			map_cr = true, -- <---
		})

		-- Remova COMPLETAMENTE qualquer bloco de código que tente usar:
		-- 1. require("nvim-autopairs.completion")
		-- 2. require("nvim-autopairs.cmp")
		-- 3. npairs.setup_on_insert()
	end,
}

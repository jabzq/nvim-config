return {
  {
    'saghen/blink.cmp',
    -- Importante: O Blink precisa de uma "release" ou ser compilado
    version = '*',
    dependencies = {
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
    },

    opts = {
      snippets = {
        preset = 'luasnip'
      },

      keymap = { preset = 'super-tab' },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },

      -- Fontes de sugestão
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      -- Mostrar documentação ao selecionar
      completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 500 },
        ghost_text = { enabled = true },
      },
    },
    opts_extend = { "sources.default" }
  },
}

return {
  {
    'saghen/blink.cmp',
    dependencies = { 
      'rafamadriz/friendly-snippets', 
    },
    version = '1.*', 
    
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = 'default' },

      appearance = {
        nerd_font_variant = 'mono',
        use_nvim_cmp_as_default = true,
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      completion = {
        documentation = { 
            auto_show = true, 
            window = { border = "rounded" } 
        },
        ghost_text = {
          enabled = true,
          show_with_menu = true,
        },
        list = {
          selection = {
            preselect = true,
            auto_insert = true,
          },
        },
      },
      signature = { enabled = true },

      fuzzy = { implementation = 'prefer_rust_with_warning' },
    },
    
    opts_extend = { 'sources.default' },
  }
}

return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = '1.*',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = 'default' },
    appearance = {
      nerd_font_variant = 'normal',
    },
    completion = {
      documentation = { auto_show = true },
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
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    fuzzy = { implementation = 'prefer_rust_with_warning' },
  },
  opts_extend = { 'sources.default' },
}

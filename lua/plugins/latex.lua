return {
  {
    'lervag/vimtex',
    lazy = false, -- VimTeX gestiona su propia carga perezosa, es mejor dejarlo así
    init = function()
      vim.g.vimtex_view_method = 'okular'
      vim.g.vimtex_quickfix_mode = 0
    end,
  },
}

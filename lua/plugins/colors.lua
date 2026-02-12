return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
  },
  {
    'arturgoms/moonbow.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'moonbow'
    end,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {
      indent = {
        char = '│',
        tab_char = '│',
      },
      -- Esto resalta la línea del bloque donde tienes el cursor
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
      },
      exclude = {
        filetypes = {
          'help',
          'dashboard',
          'lazy',
          'mason',
        },
      },
    },
  },
}

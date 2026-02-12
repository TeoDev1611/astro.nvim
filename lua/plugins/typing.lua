return {
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {
      disable_filetype = { 'TelescopePrompt', 'vim' },
    },
  },
  {
    'echasnovski/mini.comment',
    event = 'VeryLazy',
    dependencies = {
      {
        'JoosepAlviste/nvim-ts-context-commentstring',
        opts = { enable_autocmd = false }, -- Dejamos que mini.comment controle esto
      },
    },
    config = function()
      require('mini.comment').setup {
        options = {
          custom_commentstring = function()
            return require('ts_context_commentstring.internal').calculate_commentstring() or vim.bo.commentstring
          end,
        },
      }
    end,
  },

  {
    'max397574/better-escape.nvim',
    event = 'InsertEnter',
    config = function()
      require('better_escape').setup {
        timeout = vim.o.timeoutlen,
        default_mappings = true,
        mappings = {
          i = {
            j = {
              k = '<Esc>',
              j = '<Esc>',
            },
          },
        },
      }
    end,
  },

  {
    'rainbowhxch/accelerated-jk.nvim',
    event = 'VeryLazy',
    config = function()
      vim.api.nvim_set_keymap('n', 'j', '<Plug>(accelerated_jk_gj)', {})
      vim.api.nvim_set_keymap('n', 'k', '<Plug>(accelerated_jk_gk)', {})
    end,
  },

  {
    'kylechui/nvim-surround',
    version = '*',
    event = 'VeryLazy',
    config = true, -- Configuración por defecto
  },
  {
    'windwp/nvim-ts-autotag',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {},
  },
}

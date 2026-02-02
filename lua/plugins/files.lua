return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- Iconos de carpetas/archivos
      'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    keys = {
      { '<leader>n', ':Neotree toggle<CR>', desc = 'Toggle Explorer' },
      { '<leader>e', ':Neotree reveal<CR>', desc = 'Reveal File' },
    },
    opts = {
      close_if_last_window = true,
      window = {
        width = 30,
        mappings = {
          ['l'] = 'open', -- Abrir carpeta/archivo con 'l' (tipo ranger)
          ['h'] = 'close_node', -- Cerrar carpeta con 'h'
        },
      },
      filesystem = {
        follow_current_file = { enabled = true }, -- Sigue al archivo que estás editando
        filtered_items = {
          hide_dotfiles = false, -- Mostrar .config, .env, etc.
          hide_gitignored = false, -- Mostrar archivos ignorados por git
        },
        hijack_netrw_behavior = 'open_default', -- Reemplaza al explorador viejo de vim
      },
      default_component_configs = {
        indent = {
          with_expanders = true,
        },
      },
    },
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
      },
    },
    cmd = 'Telescope',
    keys = {
      { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find Files' },
      { '<leader>fw', '<cmd>Telescope live_grep<cr>', desc = 'Find Word (Grep)' },
      { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Find Buffers' },
      { '<leader>fd', '<cmd>Telescope diagnostics<cr>', desc = 'Find Diagnostics' },
    },
    config = function()
      local telescope = require 'telescope'

      telescope.setup {
        defaults = {
          prompt_prefix = ' ',
          selection_caret = ' ',
          path_display = { 'truncate' },
          file_ignore_patterns = { 'node_modules', '.git/' },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
          },
        },
      }

      telescope.load_extension 'fzf'
    end,
  },
}

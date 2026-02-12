return {
  -----------------------------------------------------------------------------
  -- 1. ICONOS (El motor gráfico)
  -----------------------------------------------------------------------------
  {
    'echasnovski/mini.icons',
    lazy = true,
    specs = {
      { 'nvim-tree/nvim-web-devicons', enabled = false, optional = true },
    },
    opts = {
      file = {
        ['.keep'] = { glyph = '󰊢', hl = 'MiniIconsGrey' },
        ['devcontainer.json'] = { glyph = '', hl = 'MiniIconsAzure' },
      },
      filetype = {
        dotenv = { glyph = '', hl = 'MiniIconsYellow' },
      },
    },
    init = function()
      package.preload['nvim-web-devicons'] = function()
        require('mini.icons').mock_nvim_web_devicons()
        return package.loaded['nvim-web-devicons']
      end
    end,
  },

  -----------------------------------------------------------------------------
  -- 2. STATUSLINE (Barra inferior)
  -----------------------------------------------------------------------------
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    dependencies = { 'echasnovski/mini.icons' },
    opts = function()
      -- Función para contar líneas
      local function total_num_lines()
        return vim.api.nvim_buf_line_count(0)
      end

      return {
        options = {
          theme = 'auto',
          globalstatus = true, -- Barra global (una sola para todos los splits)
          component_separators = '|',
          section_separators = { left = '', right = '' },
        },
        sections = {
          lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
          lualine_b = { 'branch', 'diff' },
          lualine_c = { { 'filename', path = 1 } }, -- Path relativo
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { total_num_lines },
          lualine_z = { { 'location', separator = { right = '' }, left_padding = 2 } },
        },
      }
    end,
  },

  -----------------------------------------------------------------------------
  -- 3. BUFFERLINE (Pestañas superiores)
  -----------------------------------------------------------------------------
  {
    'akinsho/bufferline.nvim',
    event = 'VeryLazy',
    dependencies = { 'echasnovski/mini.icons' },
    version = '*',
    opts = {
      options = {
        mode = 'buffers',
        separator_style = 'slant', -- Opciones: "slant" | "slope" | "thick" | "thin"
        diagnostics = 'nvim_lsp',
        always_show_bufferline = false,
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'Explorador de Archivos',
            highlight = 'Directory',
            text_align = 'left',
          },
        },
      },
    },
  },

  -----------------------------------------------------------------------------
  -- 4. DASHBOARD (Pantalla de inicio)
  -----------------------------------------------------------------------------
  {
    'goolord/alpha-nvim',
    enabled = true,
    event = 'VimEnter',
    lazy = true,
    opts = function()
      local dashboard = require 'alpha.themes.dashboard'
      local logo = [[
    ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
    ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
    ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
    ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
    ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
    ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

    ]]

      dashboard.section.header.val = vim.split(logo, '\n')
      dashboard.section.buttons.val = {
        dashboard.button('f', ' ' .. ' Buscar Archivo', ':Telescope find_files <CR>'),
        dashboard.button('n', ' ' .. ' Nuevo Archivo', ':ene <BAR> startinsert <CR>'),
        dashboard.button('r', ' ' .. ' Archivos Recientes', ':Telescope oldfiles <CR>'),
        dashboard.button('g', ' ' .. ' Buscar', ':Telescope live_grep <CR>'),
        dashboard.button('c', ' ' .. ' Configurar', ':e ~/.config/nvim/ <CR>'),
        dashboard.button('l', '󰒲 ' .. ' Lazy', ':Lazy<CR>'),
        dashboard.button('q', ' ' .. ' Salir', ':qa<CR>'),
      }
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = 'AlphaButtons'
        button.opts.hl_shortcut = 'AlphaShortcut'
      end
      dashboard.section.header.opts.hl = 'AlphaHeader'
      dashboard.section.buttons.opts.hl = 'AlphaButtons'
      dashboard.section.footer.opts.hl = 'AlphaFooter'
      dashboard.opts.layout[1].val = 8
      return dashboard
    end,
    config = function(_, dashboard)
      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == 'lazy' then
        vim.cmd.close()
        vim.api.nvim_create_autocmd('User', {
          pattern = 'AlphaReady',
          callback = function()
            require('lazy').show()
          end,
        })
      end

      require('alpha').setup(dashboard.opts)

      vim.api.nvim_create_autocmd('User', {
        pattern = 'LazyVimStarted',
        callback = function()
          local stats = require('lazy').stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          dashboard.section.footer.val = '⚡ Neovim cargando ' .. stats.count .. ' plugins en ' .. ms .. 'ms'
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end,
  },
  -----------------------------------------------------------------------------
  -- 5. NOTIFICACIONES (Reemplazo moderno de vigoux/notifier)
  -----------------------------------------------------------------------------
  {
    'rcarriga/nvim-notify',
    opts = {
      timeout = 3000,
      render = 'wrapped-compact',
    },
    config = function(_, opts)
      require('notify').setup(opts)
      vim.notify = require 'notify' -- Reemplaza el notify por defecto de vim
    end,
  },

  -----------------------------------------------------------------------------
  -- 6. DRESSING (Mejora los inputs y selects)
  -----------------------------------------------------------------------------
  {
    'stevearc/dressing.nvim',
    event = 'VeryLazy',
    opts = {
      input = {
        -- Quitamos el 'DiagnosticError' porque hacía que el input se viera rojo (error)
        win_options = { winhighlight = 'NormalFloat:Normal,FloatBorder:FloatBorder' },
      },
    },
  },

  -----------------------------------------------------------------------------
  -- 7. TROUBLE & TODO (Gestión de errores y tareas)
  -----------------------------------------------------------------------------
  {
    'folke/trouble.nvim',
    cmd = { 'Trouble' },
    opts = {
      modes = {
        lsp = { win = { position = 'right' } },
      },
    },
    keys = {
      { '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Diagnostics (Trouble)' },
    },
  },
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = 'BufReadPost',
    opts = {},
    keys = {
      { '<leader>xt', '<cmd>TodoTrouble<cr>', desc = 'Todo (Trouble)' },
    },
  },
}

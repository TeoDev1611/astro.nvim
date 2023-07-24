return {
  -- ColorSchemes
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
  },
  -- Load the other color schemes
  'rafalbromirski/vim-aurora',
  {
    'bluz71/vim-moonfly-colors',
    config = function()
      vim.cmd 'colo moonfly'
    end,
  },
  'cocopon/iceberg.vim',

  -- Faster Loading
  {
    'nathom/filetype.nvim',
    lazy = false,
    priority = 100,
    config = function()
      vim.g.did_load_filetypes = 1
    end,
  },
  {
    'lewis6991/impatient.nvim',
    lazy = false,
    priority = 110,
    config = function()
      require 'impatient'
      require('impatient').enable_profile()
    end,
  },
  -- Syntax
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = 'BufReadPost',
    dependencies = {
      'p00f/nvim-ts-rainbow',
    },

    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = {
          'lua',
          'vim',
          'markdown',
          'toml',
        },
        indent = {
          enable = true,
        },
        highlight = {
          enable = true,
        },
        rainbow = {
          enable = true,
        },
      }
    end,
  },
  -- Icons
  'kyazdani42/nvim-web-devicons',
  -- Utils
  'nvim-lua/plenary.nvim',
  -- Markdown Preview
  {
    'toppair/peek.nvim',
    build = 'deno task --quiet build:fast',
    keys = {
      {
        '<leader>op',
        function()
          local peek = require 'peek'
          if peek.is_open() then
            peek.close()
          else
            peek.open()
          end
        end,
        desc = 'Peek (Markdown Preview)',
      },
    },
    config = { theme = 'dark' },
  },
  -- UI Tools
  {
    'folke/todo-comments.nvim',
    cmd = { 'TodoTrouble', 'TodoTelescope' },
    event = 'BufReadPost',
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufReadPre',
    config = true,
  },
  {
    'akinsho/bufferline.nvim',
    event = 'BufAdd',
    config = true,
  },
  {
    'vigoux/notifier.nvim',
    config = true,
  },
  -- Snippets
  {
    'L3MON4D3/LuaSnip',
    dependencies = {
      'rafamadriz/friendly-snippets',
      config = function()
        require('luasnip.loaders.from_vscode').lazy_load()
      end,
    },
    config = {
      history = true,
      delete_check_events = 'TextChanged',
    },
    init = function()
      local function jump(key, dir)
        vim.keymap.set({ 'i', 's' }, key, function()
          return require('luasnip').jump(dir) or key
        end, { expr = true })
      end

      jump('<tab>', 1)
      jump('<s-tab>', -1)
    end,
  },
  -- Server Installer and Fmt Manager
  {
    'williamboman/mason.nvim',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      require('mason').setup {
        ensure_installed = {
          'lua-language-server',
          'stylua',
          'denols',
          'rust_analyzer',
          'jsonls',
          'yamlls',
          'pyright',
          'gopls',
          'jq',
          'black',
          'goimports',
          'gofumpt',
          'rustfmt',
        },
        ui = {
          icons = {
            package_pending = ' ',
            package_installed = ' ',
            package_uninstalled = ' ﮊ',
          },

          keymaps = {
            toggle_server_expand = '<CR>',
            install_server = 'i',
            update_server = 'u',
            check_server_version = 'c',
            update_all_servers = 'U',
            check_outdated_servers = 'C',
            uninstall_server = 'X',
            cancel_installation = '<C-c>',
          },
        },

        max_concurrent_installers = 10,
      }
      require('mason-lspconfig').setup()
    end,
  },
  -- Lsp Config
  {
    'neovim/nvim-lspconfig',
    event = 'BufReadPre',
    dependencies = {
      { 'folke/neoconf.nvim', cmd = 'Neoconf', config = true },
      { 'glepnir/lspsaga.nvim', cmd = 'Lspsaga' },
      {
        'lewis6991/hover.nvim',
        config = function()
          require('hover').setup {
            init = function()
              require 'hover.providers.lsp'
            end,
          }
        end,
      },
    },
    config = function()
      local lspconfig = require 'lspconfig'
      local servers = {
        'denols',
        'jsonls',
        'yamlls',
        'pyright',
        'gopls',
        'nimls',
      }

      -- Capabilities
      local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      -- Attach
      local function on_attach()
        vim.keymap.set('n', 'R', '<cmd>Lspsaga rename<CR>', { silent = true, desc = 'Rename Lspsaga' })
        vim.keymap.set('n', 'gd', '<cmd>Lspsaga preview_definition<cr>', { silent = true, desc = 'Preview Lsp' })
        vim.keymap.set('n', 'K', require('hover').hover, { desc = 'hover.nvim', silent = true })
        vim.keymap.set('n', 'gD', '<cmd>Lspsaga lsp_finder<cr>', { silent = true, desc = 'Find Lsp' })
        vim.keymap.set('n', 'gK', require('hover').hover_select, { desc = 'hover.nvim (select)', silent = true })
      end

      lspconfig.lua_ls.setup {
        settings = {
          Lua = {
            diagnostics = { globals = { 'vim' } },
            telemetry = {
              enable = false,
            },
          },
        },
        on_attach = on_attach,
        capabilities = capabilities,
      }

      local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
      for type, icon in pairs(signs) do
        local hl = 'DiagnosticSign' .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      vim.diagnostic.config {
        virtual_text = {
          prefix = '●',
        },
      }

      for _, server in ipairs(servers) do
        lspconfig[server].setup { on_attach = on_attach, capabilities = capabilities }
      end
    end,
  },
  -- Formatter
  {
    'jose-elias-alvarez/null-ls.nvim',
    event = 'BufReadPre',
    config = function()
      local null_ls = require 'null-ls'
      local b = null_ls.builtins
      null_ls.setup {
        sources = {
          b.formatting.stylua,
          b.formatting.black,
          b.formatting.rustfmt,
          b.formatting.gofumpt,
          b.formatting.goimports,
          b.formatting.jq,
          b.formatting.deno_fmt,
        },
        debug = true,
        debounce = 150,
        save_after_format = false,
        root_dir = require('null-ls.utils').root_pattern('.null-ls-root', '.neoconf.json', '.git'),
      }
      require('core.util').command('LspFormat', vim.lsp.buf.format)
      vim.lsp.buf.format { timeout_ms = 2000 }
    end,
  },
  -- LSP Engine
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      local cmp = require 'cmp'
      cmp.setup {
        preselect = cmp.PreselectMode.Item,
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        formatting = {
          fields = { 'kind', 'abbr', 'menu' },
          format = function(entry, vim_item)
            local lspkind_icons = {
              Text = '',
              Method = '',
              Function = '',
              Constructor = ' ',
              Field = '',
              Variable = '',
              Class = '',
              Interface = '',
              Module = '硫',
              Property = '',
              Unit = ' ',
              Value = '',
              Enum = ' ',
              Keyword = 'ﱃ',
              Snippet = ' ',
              Color = ' ',
              File = ' ',
              Reference = 'Ꮢ',
              Folder = ' ',
              EnumMember = ' ',
              Constant = ' ',
              Struct = ' ',
              Event = '',
              Operator = '',
              TypeParameter = ' ',
            }
            local meta_type = vim_item.kind
            -- load lspkind icons
            vim_item.kind = lspkind_icons[vim_item.kind] .. ''

            vim_item.menu = ({
              buffer = ' Buffer',
              nvim_lsp = meta_type,
              path = ' Path',
              luasnip = ' LuaSnip',
            })[entry.source.name]

            return vim_item
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ['<CR>'] = cmp.mapping.confirm { select = true },
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-e>'] = cmp.mapping.close(),
        },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        sources = cmp.config.sources {
          { name = 'nvim_lsp' },
          { name = 'luasnip', max_item_count = 20 },
          { name = 'nvim_lua', max_item_count = 18 },
          { name = 'path', max_item_count = 15 },
          { name = 'buffer', keyword_length = 2, max_item_count = 15 },
        },
        experimental = {
          ghost_text = {
            hl_group = 'LspCodeLens',
          },
        },
      }
    end,
  },
  {
    'echasnovski/mini.pairs',
    config = function()
      require('mini.pairs').setup {}
    end,
  },

  -- Comments
  { 'JoosepAlviste/nvim-ts-context-commentstring' },
  {
    'echasnovski/mini.comment',
    config = function()
      require('mini.comment').setup {
        hooks = {
          pre = function()
            require('ts_context_commentstring.internal').update_commentstring {}
          end,
        },
      }
    end,
  },
  -- Accelerated JK
  {
    'rhysd/accelerated-jk',
    config = function()
      vim.cmd [[
  nmap j <Plug>(accelerated_jk_gj)
  nmap k <Plug>(accelerated_jk_gk)
  ]]
    end,
  },
  {

    'max397574/better-escape.nvim',
    config = function()
      require('better_escape').setup {
        mapping = { 'jj', 'jk' },
        keys = '<Esc>',
        timeout = 200,
      }
    end,
  },
  -- Git Tools
  {
    'lewis6991/gitsigns.nvim',
    event = 'BufReadPre',
    config = true,
  },
  {
    'lambdalisue/gina.vim',
    cmd = 'Gina',
  },
  -- Languages Tools
  {
    'TeoDev1611/venom.nvim',
    ft = 'python',
  },
  {
    'baabelfish/nvim-nim',
    ft = 'nim',
  },
  -- Fuzzy Find
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = 'Telescope',
    keys = {
      { '<leader>ff', ':Telescope git_files<CR>' },
    },
  },
  -- File Tree
  {
    'nvim-tree/nvim-tree.lua',
    config = true,
    keys = {
      { '<leader>n', ':NvimTreeToggle<CR>' },
    },
  },
}

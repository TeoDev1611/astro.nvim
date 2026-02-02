return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'saghen/blink.cmp',
    },

    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      require('mason').setup { ui = { border = 'rounded' } }

      require('mason-lspconfig').setup {
        ensure_installed = { 'lua_ls', 'pyright', 'gopls', 'texlab' },
        automatic_installation = true,

        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup {
              capabilities = capabilities,
            }
          end,

          -- Configuración ESPECÍFICA de LUA (Movida aquí)
          ['lua_ls'] = function()
            require('lspconfig').lua_ls.setup {
              capabilities = capabilities,
              settings = {
                Lua = {
                  hint = { enable = true },
                  diagnostics = { globals = { 'vim' } },
                },
              },
            }
          end,

          -- Configuración ESPECÍFICA de GOPLS (Movida aquí)
          ['gopls'] = function()
            require('lspconfig').gopls.setup {
              capabilities = capabilities,
              settings = {
                gopls = {
                  hints = {
                    assignVariableTypes = true,
                    compositeLiteralFields = true,
                    compositeLiteralTypes = true,
                    constantValues = true,
                    functionTypeParameters = true,
                    parameterNames = true,
                    rangeVariableTypes = true,
                  },
                },
              },
            }
          end,

          -- Configuración ESPECÍFICA de PYRIGHT (Movida aquí)
          ['pyright'] = function()
            require('lspconfig').pyright.setup {
              capabilities = capabilities,
            }
          end,

          -- Latex
          ['texlab'] = function()
            require('lspconfig').texlab.setup {
              capabilities = capabilities,
              settings = {
                texlab = {
                  build = {
                    -- Usar latexmk para compilar al guardar
                    executable = 'latexmk',
                    args = { '-pdf', '-interaction=nonstopmode', '-synctex=1', '%f' },
                    onSave = true, -- Compilar al guardar
                  },
                },
              },
            }
          end,
        },
      }

      -- 4. Configuración Visual (Esto se mantiene igual)
      vim.diagnostic.config {
        float = { border = 'rounded' },
        signs = true,
      }

      vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
      vim.lsp.handlers['textDocument/signatureHelp'] =
        vim.lsp.with(vim.lsp.handlers.signatureHelp, { border = 'rounded' })

      -- 5. LspAttach (Atajos y eventos - Se mantiene IGUAL)
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = args.buf, desc = 'LSP: ' .. desc })
          end

          map('gd', vim.lsp.buf.definition, 'Ir a Definición')
          map('gr', vim.lsp.buf.references, 'Ver Referencias')
          map('K', vim.lsp.buf.hover, 'Ver Documentación')
          map('<leader>R', vim.lsp.buf.rename, 'Renombrar')

          if client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = args.buf }, { bufnr = args.buf })
            end, '[T]oggle Inlay [H]ints')
          end

          if client.server_capabilities.documentHighlightProvider then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })

            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = args.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = args.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })
    end,
  },
}

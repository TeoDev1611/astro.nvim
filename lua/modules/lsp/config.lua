local M = {}

M.cmp = function()
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
    -- You can set mappings if you want
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
    sources = {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'path' },
      { name = 'buffer' },
      { name = 'nvim_lua' },
    },
  }

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  -- Load the cmp data
  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
  capabilities.textDocument.completion.completionItem.snippetSupport = true
end

M.luasnip = function()
  local ls = require 'luasnip'
  ls.config.set_config {
    history = true,
    updateevents = 'TextChanged,TextChangedI',
  }
  require('luasnip.loaders.from_vscode').lazy_load()
end

M.installer = function()
  -- TODO: Add the installer config with the lsp and lspconfig
end

M.nlspsettings = function()
  require('nlspsettings').setup {}
end

M.lspconfig = function()
  local global_capabilities = vim.lsp.protocol.make_client_capabilities()
  global_capabilities.textDocument.completion.completionItem.snippetSupport = true
  global_capabilities.textDocument.completion.completionItem.documentationFormat = { 'markdown', 'plaintext' }
  global_capabilities.textDocument.completion.completionItem.snippetSupport = true
  global_capabilities.textDocument.completion.completionItem.preselectSupport = true
  global_capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
  global_capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
  global_capabilities.textDocument.completion.completionItem.deprecatedSupport = true
  global_capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
  global_capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
  global_capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      'documentation',
      'detail',
      'additionalTextEdits',
    },
  }

  require('lspconfig').util.default_config = vim.tbl_extend('force', require('lspconfig').util.default_config, {
    capabilities = global_capabilities,
  })

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
end

M.lspsignature = function()
  require('lsp_signature').setup {
    bind = true,
    fix_pos = true,
    auto_close_after = 10,
    hint_enable = true,
  }
end

return M

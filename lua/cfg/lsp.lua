-- Logger
local logs = require 'me.logs'
local util = require 'me.util'
-- Modules
local p, cmp = pcall(require, 'cmp')
local p2, null_ls = pcall(require, 'null-ls')
local b = null_ls.builtins
local p3, luasnip = pcall(require, 'luasnip')
-- Valid
if not p then
  logs:log('warn', 'Not found the CMP module!')
  return
end

if not p2 then
  logs:log('warn', 'Not found the Null-LS module!')
  return
end

if not p3 then
  logs:log('warn', 'Not found the Luasnip module!')
  return
end

require('luasnip.loaders.from_vscode').lazy_load()

vim.cmd [[set completeopt=menu,menuone,noselect]]

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
end

local icons = {
  Text = '',
  Method = '',
  Function = '',
  Constructor = '',
  Field = 'ﰠ',
  Variable = '',
  Class = 'ﴯ',
  Interface = '',
  Module = '',
  Property = 'ﰠ',
  Unit = '塞',
  Value = '',
  Enum = '',
  Keyword = '',
  Snippet = '',
  Color = '',
  File = '',
  Reference = '',
  Folder = '',
  EnumMember = '',
  Constant = '',
  Struct = 'פּ',
  Event = '',
  Operator = '',
  TypeParameter = '',
}

cmp.setup {
  preselect = cmp.PreselectMode.Item,
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = string.format('%s %s', icons[vim_item.kind], vim_item.kind)
      vim_item.menu = ({
        nvim_lsp = '[LSP]',
        nvim_lua = '[Lua]',
        buffer = '[BUF]',
        dictionary = '[DIC]',
      })[entry.source.name]

      return vim_item
    end,
  },
  completion = {
    keyword_length = 1,
  },
  experimental = {
    ghost_text = true,
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  view = {
    entries = 'custom',
  },
  mapping = {
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, {
      'i',
      's',
    }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      'i',
      's',
    }),
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm { select = true },
  },
  sources = cmp.config.sources {
    { name = 'nvim_lsp' },
    { name = 'luasnip', max_item_count = 20 },
    { name = 'nvim_lua', max_item_count = 25 },
    { name = 'path', max_item_count = 20 },
    { name = 'buffer', keyword_length = 2 },
    { name = 'dictionary', keyword_length = 3, max_item_count = 25 },
  },
}

local dicwords = util.path_join(vim.fn.stdpath 'data', 'dictionary.txt')
local url = 'https://raw.githubusercontent.com/eneko/data-repository/master/data/words.txt'
local exists = util.file_exists(dicwords)

if exists == false then
  vim.fn.system {
    'curl',
    url,
    '-o',
    dicwords,
    '-s',
  }
  logs:log('info', 'Downloaded the dictionary file!')
end

require('cmp_dictionary').setup {
  dic = {
    ['*'] = dicwords,
  },
}

logs:log('info', 'Loaded CMP')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

logs:log('info', 'Loaded CMP NVIM LSP')

local server_opts = {}
server_opts.sumneko_lua = {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

logs:log('info', 'Loaded configs')

require('nvim-lsp-installer').on_server_ready(function(server)
  local opts = {
    capabilities = capabilities,
  }
  if server_opts[server.name] then
    opts = vim.tbl_deep_extend('force', opts, server_opts[server.name])
  end
  server:setup(opts)
  vim.cmd [[ do User LspAttachBuffers ]]
end)

logs:log('info', 'Loaded nvim-lsp-installer')

require('nlspsettings').setup {}

logs:log('info', 'Loaded nlspsettings!')

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

logs:log('info', 'Loaded the capabilities!')

local sources = {
  b.formatting.stylua,
  b.formatting.black,
  b.formatting.rustfmt,
  b.formatting.gofumpt,
  b.formatting.goimports,
}
null_ls.setup {
  sources = sources,
  debug = true,
}

util.command('LspFormat', vim.lsp.buf.formatting_sync)

logs:log('info', 'Load the Null-LS!')

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

logs:log('info', 'Load the icons on vimlsp')

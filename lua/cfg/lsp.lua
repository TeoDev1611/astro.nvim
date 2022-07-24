-- Logger
local logs = require 'core.logs'
local util = require 'core.util'
-- Modules
local p, cmp = pcall(require, 'cmp')
local p2, null_ls = pcall(require, 'null-ls')
local b = null_ls.builtins
local p3, installer = pcall(require, 'nvim-lsp-installer')
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
  logs:log('warn', 'Not found the Lsp Installer module!')
  return
end

require('luasnip.loaders.from_vscode').lazy_load()

vim.cmd [[set completeopt=menu,menuone,noselect]]

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
end

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
  sources = cmp.config.sources {
    { name = 'nvim_lsp' },
    { name = 'luasnip', max_item_count = 20 },
    { name = 'nvim_lua', max_item_count = 25 },
    { name = 'path', max_item_count = 20 },
    { name = 'buffer', keyword_length = 2 },
    { name = 'dictionary', keyword_length = 3, max_item_count = 25 },
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
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

installer.on_server_ready(function(server)
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

-- You can set your format sources here
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

util.command('LspFormat', vim.lsp.buf.format)

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

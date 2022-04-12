-- Logger
local logs = require 'me.logs'
-- Modules
local p, cmp = pcall(require, 'cmp')
local p2, null_ls = pcall(require, 'null-ls')
local b = null_ls.builtins
local p3, snippy = pcall(require, 'snippy')
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
  logs:log('warn', 'Not found the Snippy module!')
  return
end

vim.cmd [[set completeopt=menu,menuone,noselect]]

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
end

cmp.setup {
  preselect = cmp.PreselectMode.Item,
  formatting = {
    format = function(entry, vim_item)
      vim_item.menu = ({
        nvim_lsp = '[LSP]',
        nvim_lua = '[API]',
        buffer = '[BUF]',
        snippy = '[SNIP]',
        path = '[PATH]',
      })[entry.source.name]

      return vim_item
    end,
  },
  completion = {
    keyword_length = 1,
  },
  experimental = {
    ghost_text = true,
    view = {
      entries = 'native',
    },
  },
  snippet = {
    expand = function(args)
      require('snippy').expand_snippet(args.body)
    end,
  },
  documentation = {
    border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
  },
  mapping = {
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif snippy.can_expand_or_advance() then
        snippy.expand_or_advance()
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
      elseif snippy.can_jump(-1) then
        snippy.previous()
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
    { name = 'snippy', max_item_count = 20 },
    { name = 'nvim_lua', max_item_count = 25 },
    { name = 'path', max_item_count = 20 },
    { name = 'buffer', keyword_length = 2 },
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

logs:log('info', 'Load the Null-LS!')

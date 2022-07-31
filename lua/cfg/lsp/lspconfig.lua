local lspconfig = require 'lspconfig'

local servers = {
  'denols',
  'rust_analyzer',
  'jsonls',
}

local function on_attach()
  require('lsp_signature').on_attach()
end

lspconfig.sumneko_lua.setup {
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim' } },
      telemetry = {
        enable = false,
      },
    },
  },
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


require('rust-tools').setup({})

for _, server in ipairs(servers) do
  lspconfig[server].setup { on_attach = on_attach }
end

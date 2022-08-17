local lspconfig = require 'lspconfig'

local servers = {
  'denols',
  'rust_analyzer',
  'jsonls',
  'yamlls',
  'pyright',
  'gopls',
}

-- Capabilities
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Attach
local function on_attach()
  vim.keymap.set('n', 'R', '<cmd>Lspsaga rename<CR>', { silent = true })
  vim.keymap.set('n', 'gd', '<cmd>lspsaga preview_definition<cr>', { silent = true })
  vim.keymap.set('n', 'K', require('hover').hover, { desc = 'hover.nvim' })
  vim.keymap.set('n', 'gK', require('hover').hover_select, { desc = 'hover.nvim (select)' })
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

require('rust-tools').setup {
  server = {
    capabilities = capabilities,
    on_attach = on_attach,
  },
}

for _, server in ipairs(servers) do
  lspconfig[server].setup { on_attach = on_attach, capabilities = capabilities }
end

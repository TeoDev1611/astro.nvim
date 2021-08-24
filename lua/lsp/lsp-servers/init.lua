-- TODO: Add the new instructions for install the language servers

local lspconfig = require 'lspconfig'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  },
}

lspconfig.gopls.setup { capabilities = capabilities }

lspconfig.tsserver.setup { capabilities = capabilities }

lspconfig.denols.setup {
  capabilities = capabilities,
  init_options = {
    enable = true,
    lint = true,
    unstable = true,
  },
}

lspconfig.bashls.setup { capabilities = capabilities }

lspconfig.rls.setup { capabilities = capabilities }

lspconfig.pyright.setup { capabilities = capabilities }

lspconfig.solargraph.setup { capabilities = capabilities }

lspconfig.jsonls.setup {
  capabilities = capabilities,
}

local system_name = 'Windows'
local nvim_config_path = vim.fn.stdpath 'config'

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_binary
local sumneko_root_path
if system_name == 'macOS' then
  sumneko_binary = nvim_config_path .. '/servers/extension/server/bin/macOS/lua-language-server'
  sumneko_root_path = nvim_config_path .. '/servers/extension/server/main.lua'
elseif system_name == 'Linux' then
  sumneko_binary = nvim_config_path .. '/servers/extension/server/bin/Linux/lua-language-server'
  sumneko_root_path = nvim_config_path .. '/servers/extension/server/main.lua'
elseif system_name == 'Windows' then
  sumneko_binary = vim.fn.expand '~/AppData/Local/nvim/extension/server/bin/Windows/lua-language-server.exe'
  sumneko_root_path = vim.fn.expand '~/AppData/Local/nvim/extension/server/main.lua'
else
  print 'Unsupported binary for sumneko'
end

lspconfig.sumneko_lua.setup {
  cmd = { sumneko_binary, '-E', sumneko_root_path },
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

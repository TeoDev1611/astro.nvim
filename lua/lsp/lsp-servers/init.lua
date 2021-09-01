-- TODO: Add the new instructions for install the language servers

local lspconfig = require 'lspconfig'

local M = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

M.sumneko_lua = function()
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
end

return M

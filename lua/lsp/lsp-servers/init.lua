-- TODO: Add the new instructions for install the language servers

local lspconfig = require('lspconfig')

lspconfig.vimls.setup({})

lspconfig.gopls.setup({})

lspconfig.tsserver.setup({})

lspconfig.denols.setup({})

lspconfig.bashls.setup({})

lspconfig.rls.setup({})
lspconfig.pyright.setup({})

lspconfig.jsonls.setup({
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line('$'), 0 })
      end,
    },
  },
})

system_name = 'Windows'
local nvim_config_path = vim.fn.stdpath('config')

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
  sumneko_binary = vim.fn.expand('~/AppData/Local/nvim/extension/server/bin/Windows/lua-language-server.exe')
  sumneko_root_path = vim.fn.expand('~/AppData/Local/nvim/extension/server/main.lua')
else
  print('Unsupported binary for sumneko')
end

lspconfig.sumneko_lua.setup({
  cmd = { sumneko_binary, '-E', sumneko_root_path },
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
})

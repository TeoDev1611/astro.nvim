local M = {}
local formatter = require 'formatter'

local function dprint()
  return {
    exe = 'dprint fmt',
    args = {
      vim.api.nvim_buf_get_name(0),
    },
    stdin = true,
  }
end

local function stylua()
  return {
    exe = 'stylua',
    args = { '--stdin-filepath', vim.fn.expand '%:t', '-' },
    stdin = true,
  }
end

M.prettierd = function()
  return {
    exe = 'prettierd',
    args = { vim.api.nvim_buf_get_name(0) },
    stdin = true,
  }
end

M.setup = function()
  formatter.setup {
    filetype = {
      lua = stylua,
      json = M.dprint,
      toml = M.dprint,
      markdown = M.dprint,
      javascript = M.prettierd,
      typescript = M.prettierd,
      css = M.prettierd,
      scss = M.prettierd,
      graphql = M.prettierd,
    },
  }

  --  vim.api.nvim_exec(
  --    [[
  --augroup FormatAutogroup
  --  autocmd!
  --  autocmd BufWritePost *.js,*.rs,*.lua FormatWrite
  --augroup END
  --]],
  --    true
  --  )
end

return M

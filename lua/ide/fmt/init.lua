local M = {}

M.format_sty = function()
  vim.cmd '!stylua %'
  print 'Format Done!'
end

return M

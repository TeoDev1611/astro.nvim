local p, github = pcall(require, 'github-theme')
local logs = require 'me.logs'

if not p then
  logs:log('warn', 'Not found the github theme!')
  return
end

-- Space Gray
vim.g.spacegray_use_italics = 1
vim.g.spacegray_underline_search = 1

-- Vscode.nvim
vim.g.vscode_style = 'dark'
vim.g.vscode_italic_comment = 1

github.setup {
  theme_style = 'dark',
  function_style = 'italic',
  sidebars = { 'qf', 'vista_kind', 'terminal', 'packer' },
}

vim.cmd [[colo github_dark_default]]

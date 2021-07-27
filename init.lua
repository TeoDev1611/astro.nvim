-- ============================================================================== --
-- ----------------------     RocketVim Loading plugins     --------------------- --
-- ============================================================================== --

if vim.fn.has('win32') or vim.fn.has('win64') then
  vim.cmd('source ~/appdata/local/nvim/manager.vim')
elseif vim.fn.has('unix') or vim.fn.has('linux') then
  vim.cmd('source ~/.config/nvim/manager.vim')
else
  print "Unsupported platform"
end

-- Leader key
vim.g.mapleader = ' '

-- ============================================================================== --
-- ----------------------      Completion plugin config     --------------------- --
-- ============================================================================== --
require('ide/tree-sitter')


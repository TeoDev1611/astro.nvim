-- ============================================================================== --
-- ----------------------     RocketVim Loading plugins     --------------------- --
-- ============================================================================== --

if vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1 then
   vim.cmd('source ~/appdata/local/nvim/manager.vim')
elseif vim.fn.has('unix') == 1 or vim.fn.has('linux') == 1 then
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
-- require('ide/telescope')

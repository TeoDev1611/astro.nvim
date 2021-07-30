-- ============================================================================== --
-- ----------------------     RocketVim Loading plugins     --------------------- --
-- ============================================================================== --

vim.g.mapleader = " "

require("plugins")
require("ide/tree-sitter")
require("ide/autopairs")
require("lsp/compe")
require("lsp/icons")
require("lsp/lsp-servers")
require("lsp/saga")
require("ui/statusline")

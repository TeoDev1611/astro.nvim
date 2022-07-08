-- Utils for the keymaps
local ps, util = pcall(require, 'core.utils')
local logger = require 'core.logs'
local keymap = util.keymap
local p, builtin = pcall(require, 'telescope.builtin')

-- Map Leader
vim.g.mapleader = ' '

keymap {
  -- CtrlP
  ['<leader>ff'] = function()
    vim.cmd [[CtrlP]]
  end,
  ['<leader>fb'] = function()
    vim.cmd [[CtrlPBuffer]]
  end,
  ['<leader>fg'] = function()
    vim.cmd [[CtrlPLine]]
  end,
  -- Tree
  ['<leader>n'] = function()
    vim.cmd [[NvimTreeToggle]]
  end,
  ['<leader>nr'] = function()
    vim.cmd [[NvimTreeRefresh]]
  end,
  -- Movements
  ['<C-left>'] = function()
    vim.cmd [[wincmd h]]
  end,
  ['<C-right>'] = function()
    vim.cmd [[wincmd l]]
  end,
  ['<C-up>'] = function()
    vim.cmd [[wincmd k]]
  end,
  ['<C-down>'] = function()
    vim.cmd [[wincmd j]]
  end,
  -- Buffers
  ['<TAB>'] = function()
    vim.cmd [[bnext]]
  end,
  ['<S-TAB>'] = function()
    vim.cmd [[bprevious]]
  end,
  ['<leader>bd'] = function()
    vim.cmd [[bdelete]]
  end,
  -- Close
  ['<C-w>'] = function()
    vim.cmd [[q]]
  end,
  ['<leader>f'] = function()
    vim.cmd [[LspFormat]]
  end,
}

keymap({
  ['K'] = function()
    vim.cmd [[move '<-2<CR>gv-gv]]
  end,
  ['J'] = function()
    vim.cmd [[move '>+1<CR>gv-gv]]
  end,
}, {
  mode = 'x',
})

keymap({
  ['<'] = function()
    vim.cmd [[<gv]]
  end,
  ['>'] = function()
    vim.cmd [[>gv]]
  end,
}, {
  mode = 'v',
})

vim.loader.enable()

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local opt = vim.opt -- Alias para escribir menos

opt.termguicolors = true -- Colores reales de 24-bits
opt.background = 'dark'
opt.cursorline = true -- Resaltar la línea actual
opt.laststatus = 3 -- BARRA GLOBAL (Una sola barra de estado para split windows)
opt.showmode = false -- No mostrar "-- INSERT --" (tus plugins de barra lo harán)
opt.showcmd = true -- Mostrar commandos incompletos
opt.ruler = true -- Mostrar posición del cursor
opt.number = true -- Números de línea
opt.relativenumber = true -- Números relativos

opt.clipboard = 'unnamedplus' -- Usar portapapeles del sistema (Ctrl+C / Ctrl+V)
opt.mouse = 'a' -- Mouse habilitado
opt.wrap = true -- Ajuste de línea visual
opt.linebreak = true -- No cortar palabras a la mitad al ajustar
opt.scrolloff = 8 -- Mantener margen al hacer scroll (muy recomendado)
opt.ignorecase = true -- Ignorar mayúsculas al buscar...
opt.smartcase = true -- ...a menos que escribas una mayúscula

opt.expandtab = true -- Tabs son espacios
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2

opt.swapfile = false -- (Opcional) Mucha gente odia los archivos .swp
opt.writebackup = false -- No crear backups al guardar

-- Fix colors (Tu fix para el separador de ventanas)
vim.api.nvim_set_hl(0, 'WinSeparator', { bg = 'None' })

--- AUTOCMDS
local vim_group = vim.api.nvim_create_augroup('vimrc_help', { clear = true })

vim.api.nvim_create_autocmd('BufEnter', {
  group = vim_group,
  pattern = '*.txt',
  callback = function()
    if vim.bo.buftype == 'help' then
      vim.cmd 'wincmd L'
    end
  end,
})

-- maps
local map = vim.keymap.set

-----------------------------------------------------------------------------
-- GENERAL
-----------------------------------------------------------------------------
-- Guardar con Ctrl + S (Modo Normal e Insertar)
map({ 'n', 'i' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Guardar archivo' })

-- Salir con Leader + q
map('n', '<leader>q', '<cmd>q<cr>', { desc = 'Salir' })

-- Limpiar el resaltado de búsqueda con ESC (¡Súper útil!)
map('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Limpiar búsqueda' })

-----------------------------------------------------------------------------
-- VENTANAS (Splits)
-----------------------------------------------------------------------------
-- Dividir pantalla
map('n', '<leader>sv', '<C-w>v', { desc = 'Split Vertical' })
map('n', '<leader>sh', '<C-w>s', { desc = 'Split Horizontal' })

map('n', '<C-h>', '<C-w>h', { desc = 'Ir a la izquierda' })
map('n', '<C-j>', '<C-w>j', { desc = 'Ir abajo' })
map('n', '<C-k>', '<C-w>k', { desc = 'Ir arriba' })
map('n', '<C-l>', '<C-w>l', { desc = 'Ir a la derecha' })

-- Redimensionar ventanas con flechas (Opcional, pero cómodo)
map('n', '<C-Up>', ':resize +2<CR>', { silent = true })
map('n', '<C-Down>', ':resize -2<CR>', { silent = true })
map('n', '<C-Left>', ':vertical resize -2<CR>', { silent = true })
map('n', '<C-Right>', ':vertical resize +2<CR>', { silent = true })

-----------------------------------------------------------------------------
-- BUFFERS (Pestañas) - Mantenemos los tuyos que están bien
-----------------------------------------------------------------------------
map('n', '<TAB>', ':bnext<CR>', { silent = true, desc = 'Siguiente Buffer' })
map('n', '<S-TAB>', ':bprevious<CR>', { silent = true, desc = 'Buffer Anterior' })
map('n', '<leader>x', ':bdelete<CR', { silent = true, desc = 'Cerrar Buffer' })

-----------------------------------------------------------------------------
-- EDICIÓN / VISUAL MODE
-----------------------------------------------------------------------------
-- Mover líneas arriba/abajo (Tus mappings, un poco pulidos)
map('v', 'J', ':m \'>+1<CR>gv=gv', { desc = 'Mover línea abajo' })
map('v', 'K', ':m \'<-2<CR>gv=gv', { desc = 'Mover línea arriba' })

-- Indentación que no se sale del modo visual (Tus mappings)
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Por defecto en Vim, si seleccionas una palabra y pegas otra encima,
-- Vim copia la palabra borrada. Esto lo evita.
map('x', 'p', [["_dP]])

-----------------------------------------------------------------------------
-- PORTAPAPELES DEL SISTEMA
-----------------------------------------------------------------------------
map({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Copiar al sistema' })
map('n', '<leader>Y', [["+Y]], { desc = 'Copiar línea al sistema' })

-- lazy

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup 'plugins'

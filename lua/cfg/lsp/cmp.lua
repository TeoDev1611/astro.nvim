-- Core
local logs = require 'core.logs'

-- Cmp
local p, cmp = pcall(require, 'cmp')

if not p then
  logs:log('warn', 'Not found the CMP module!')
  return
end

vim.cmd [[set completeopt=menu,menuone,noselect]]

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup {
  preselect = cmp.PreselectMode.Item,
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  formatting = {
    fields = { 'kind', 'abbr', 'menu' },
    format = function(entry, vim_item)
      local lspkind_icons = {
        Text = '',
        Method = '',
        Function = '',
        Constructor = ' ',
        Field = '',
        Variable = '',
        Class = '',
        Interface = '',
        Module = '硫',
        Property = '',
        Unit = ' ',
        Value = '',
        Enum = ' ',
        Keyword = 'ﱃ',
        Snippet = ' ',
        Color = ' ',
        File = ' ',
        Reference = 'Ꮢ',
        Folder = ' ',
        EnumMember = ' ',
        Constant = ' ',
        Struct = ' ',
        Event = '',
        Operator = '',
        TypeParameter = ' ',
      }
      local meta_type = vim_item.kind
      -- load lspkind icons
      vim_item.kind = lspkind_icons[vim_item.kind] .. ''

      vim_item.menu = ({
        buffer = ' Buffer',
        nvim_lsp = meta_type,
        path = ' Path',
        luasnip = ' LuaSnip',
      })[entry.source.name]

      return vim_item
    end,
  },
  -- You can set mappings if you want
  mapping = cmp.mapping.preset.insert {
    ['<CR>'] = cmp.mapping.confirm { select = true },
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.close(),
  },
  sources = cmp.config.sources {
    { name = 'nvim_lsp' },
    { name = 'luasnip', max_item_count = 20 },
    { name = 'nvim_lua', max_item_count = 18 },
    { name = 'path', max_item_count = 15 },
    { name = 'buffer', keyword_length = 2, max_item_count = 15 },
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  experimental = {
    ghost_text = true,
  },
}

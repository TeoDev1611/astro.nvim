require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'lua',
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  rainbow = {
    enable = true,
  },
}

local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
parser_config.jsonc.used_by = 'json'
parser_config.markdown = {
  install_info = {
    url = 'https://github.com/ikatyang/tree-sitter-markdown',
    files = { 'src/parser.c', 'src/scanner.cc' },
  },
}

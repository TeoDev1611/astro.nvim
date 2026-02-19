require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'json',
    'javascript',
    'typescript',
    'tsx',
    'yaml',
    'html',
    'css',
    'markdown',
    'markdown_inline',
    'svelte',
    'vue',
    'go',
    'bash',
    'lua',
    'vim',
    'dockerfile',
    'gitignore',
    'vimdoc',
    'python',
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
  },
}

require('nvim-ts-autotag').setup()

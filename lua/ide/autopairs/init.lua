require('nvim-autopairs').setup {
  disable_filetype = { 'TelescopePrompt' },
}

if packer_plugins['nvim-cmp'] and packer_plugins['nvim-cmp'].loaded then
  require('nvim-autopairs.completion.cmp').setup {
    map_cr = true, --  map <CR> on insert mode
    map_complete = true, -- it will auto insert `(` after select function or method item
  }
end

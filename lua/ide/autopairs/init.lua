require('nvim-autopairs').setup {
  disable_filetype = { 'TelescopePrompt' },
}

if packer_plugins['nvim-compe'] and packer_plugins['nvim-compe'].loaded then
  require('nvim-autopairs.completion.compe').setup {
    map_cr = true, --  map <CR> on insert mode
    map_complete = true, -- it will auto insert `( after select function or method item
    auto_select = false, -- auto select first item
  }
end

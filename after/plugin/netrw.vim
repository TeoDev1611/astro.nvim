let g:netrw_keepdir = 0
let g:netrw_winsize = 25
let g:netrw_banner = 0
let g:netrw_localcopydircmd = 'cp -r'
hi! link netrwMarkFile Search

lua require('lsp.installer').setup()

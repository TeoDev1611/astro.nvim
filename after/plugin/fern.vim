
" augroup my-fern-hijack
"   autocmd!
"   autocmd BufEnter * ++nested call s:hijack_directory()
" augroup END

" function!s:hijack_directory() abort
"   let path = expand('%:p')
"   if !isdirectory(path)
"     return
"   endif
"   bwipeout %
"   execute printf('Fern %s', fnameescape(path))
" endfunction

" " Custom settings and mappings.
" let g:fern#disable_default_mappings = 1

" " not-hidden
" let g:fern#default_hidden= 1

" " exclude
" let g:fern#default_exclude='node_modules'

" function! FernInit() abort
"   nmap <buffer><expr>
"         \ <Plug>(fern-my-open-expand-collapse)
"         \ fern#smart#leaf(
"         \   "\<Plug>(fern-action-open:select)",
"         \   "\<Plug>(fern-action-expand)",
"         \   "\<Plug>(fern-action-collapse)",
"         \ )
"   nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
"   nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-expand-collapse)
"   nmap <buffer> n <Plug>(fern-action-new-path)
"   nmap <buffer> d <Plug>(fern-action-remove)
"   nmap <buffer> t <Plug>(fern-action-trash)
"   nmap <buffer> m <Plug>(fern-action-move)
"   nmap <buffer> s <Plug>(fern-action-mark:set)
"   nmap <buffer> r <Plug>(fern-action-rename)
"   nmap <buffer> h <Plug>(fern-action-hidden-toggle)
"   nmap <buffer> R <Plug>(fern-action-reload)
"   nmap <buffer> y <Plug>(fern-action-yank)
"   nmap <buffer> b <Plug>(fern-action-open:split)
"   nmap <buffer> v <Plug>(fern-action-open:vsplit)
"   nmap <buffer><nowait> u <Plug>(fern-action-leave)
"   nmap <buffer><nowait> c <Plug>(fern-action-enter)
" endfunction

" augroup FernGroup
"   autocmd!
"   autocmd FileType fern call FernInit()
" augroup END

" " Fixer
" let g:cursorhold_updatetime = 100

" " Devicoins
" let g:fern#renderer = "nerdfont"

" " Palette
" augroup my-glyph-palette
"   autocmd! *
"   autocmd FileType fern call glyph_palette#apply()
"   autocmd FileType nerdtree,startify call glyph_palette#apply()
" augroup END


let g:coc_start_at_startup = 0

function! g:astro#cocstart()
  if has("nvim-0.5.0") || has("patch-8.1.1564")
    set signcolumn=number
  else
    set signcolumn=yes
  endif

  autocmd FileType typescript lua require'cmp'.setup.buffer {
  \   completion = { autocomplete = false }
  \ }

  autocmd FileType json lua require'cmp'.setup.buffer {
  \   completion = { autocomplete = false }
  \ }

  autocmd FileType javascript lua require'cmp'.setup.buffer {
  \   completion = { autocomplete = false }
  \ }

  CocStart

  set nobackup
  set nowritebackup
  set hidden
  set shortmess+=c
  set updatetime=300

  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)
  xmap <leader>f  <Plug>(coc-format-selected)
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
      call CocActionAsync('doHover')
    else
      execute '!' . &keywordprg . " " . expand('<cword>')
    endif
  endfunction

  nmap <leader>f  <Plug>(coc-format-selected)
endfunction


"------------------------------------------------------------------------------"
"                               CoC IntellijSense                              "
"------------------------------------------------------------------------------"

nmap<silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
xmap <leader> fs <Plug>(coc-format-selected)
nnoremap <silent>sd :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nmap <leader>F  <Plug>(coc-format-selected)
autocmd CursorHold * silent call CocActionAsync('highlight')

imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
imap <C-j> <Plug>(coc-snippets-expand-jump)

let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <silent><expr> <c-space> coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-m>" : "\<S-Tab>"

let g:coc_global_extensions = [
\"coc-lua",
\"coc-vimlsp",
\"coc-go",
\"coc-git",
\"coc-tsserver",
\"coc-marketplace"
\]

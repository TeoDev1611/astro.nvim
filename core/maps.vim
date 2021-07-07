" Custom scape chars
imap jk <Esc>
imap <C-c> <Esc>l

" Move the line selected up or down
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv 
" Indent the line to right or left
vnoremap < <gv
vnoremap > >gv

" Navigate into the buffers with the arrow keys
nnoremap <silent> <C-left> :wincmd h<CR>
nnoremap <silent> <C-right> :wincmd l<CR>
nnoremap <silent> <C-up> :wincmd k<CR> 
nnoremap <silent> <C-down> :wincmd j<CR>
" Utils of maps for faster usage
nnoremap <leader>w :w <CR>
nnoremap <C-w> :q <CR>
nnoremap <leader>q :q <CR>
nnoremap <leader>so :so%<CR>
"Move into the tabs with TAB and Shift TAB
nnoremap <silent> <TAB> :bnext<CR>
nnoremap <silent> <S-TAB> :bprevious<CR>
"Close a buffer
nnoremap <leader>bd :bdelete<CR>
nnoremap <leader>n :Lexplore<CR>
nnoremap <silent> <C-n> :Explore<CR>

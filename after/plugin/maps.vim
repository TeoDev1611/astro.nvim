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
map <Leader>n :Fern . -reveal=%<CR>
noremap <silent> <C-m> :Fern . -drawer -reveal=% -toggle -width=30<CR><C-w>
nnoremap <leader>b <Cmd>Telescope find_files<CR>
nnoremap <leader>bg <Cmd>Telescope git_commits<CR>

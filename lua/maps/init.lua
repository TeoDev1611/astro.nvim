vim.g.mapleader = ' '

vim.cmd [[
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
nnoremap <C-w> :q <CR>
nnoremap <leader>q :q <CR>
nnoremap <leader>so :so%<CR>
"Move into the tabs with TAB and Shift TAB
nnoremap <silent> <TAB> :bnext<CR>
nnoremap <silent> <S-TAB> :bprevious<CR>
"Close a buffer
nnoremap <leader>bd :bdelete<CR>
"Tree maps
nnoremap <silent><leader>n <cmd>NvimTreeToggle<CR>
nnoremap <silent><leader>nr <cmd>NvimTreeRefresh<CR>
" Fuzzy find
nnoremap <silent><leader>ff <cmd>Telescope find_files<cr>
nnoremap <silent><leader>fg <cmd>Telescope live_grep<cr>
nnoremap <silent><leader>fb <cmd>Telescope buffers<cr>
nnoremap <silent><leader>fh <cmd>Telescope help_tags<cr>
nnoremap <silent><leader>fc <cmd>Telescope colorschemes<cr>
 "LSPSaga
nnoremap <silent><leader>sd :Lspsaga hover_doc<CR>
nnoremap <silent><leader>sh :Lspsaga signature_help<CR>
nnoremap <silent><leader>sr :Lspsaga rename<CR>
nnoremap <silent><leader>st :Lspsaga open_floaterm<CR>
tnoremap <silent> <A-d> <C-a><C-n>:Lspsaga close_floaterm<CR>
" Fast Movements
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)
]]

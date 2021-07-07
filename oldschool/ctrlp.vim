"CtrlP Remap
nnoremap <leader>b :CtrlP<CR>
"Ignore .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']


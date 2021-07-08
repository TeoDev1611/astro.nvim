if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

autocmd ColorScheme * highlight CocErrorFloat guifg=#ffffff
autocmd ColorScheme * highlight CocInfoFloat guifg=#ffffff
autocmd ColorScheme * highlight CocWarningFloat guifg=#ffffff
autocmd ColorScheme * highlight SignColumn guibg=#adadad

let g:gruvbox_contrast_dark = 'hard'

"Gruvbox Material
let g:gruvbox_material_palette = 'mix'
let g:gruvbox_material_cursor = 'orange'
let g:gruvbox_material_background = 'hard'
let g:gruvbox_contrast_dark = 'hard'
"Material
let g:material_style = "deep ocean"
let g:material_italic_comments = v:true
let g:material_italic_keywords = v:true
let g:material_italic_functions = v:true
colorscheme gruvbox 

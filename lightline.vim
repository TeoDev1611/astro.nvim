let g:lightline = {
      \ 'colorscheme': 'ayu',
      \'active': {
      \   'left': [ [ 'mode','gitbranch', 'paste' ], [ 'gitbranch', 'filename' ] ],
      \   'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'binary', 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ [ 'filename' ] ],
      \   'right': [ [ 'lineinfo' ], [ 'percent' ] ]
      \ },
      \ 'tabline': {
      \   'left': [ [ 'tabs' ] ],
      \   'right': []
      \ }
      \ }

let g:gruvbox_material_statusline_style = 'mix'

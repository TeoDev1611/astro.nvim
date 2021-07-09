let g:dashboard_default_executive ='fzf'
let g:dashboard_custom_header =<< trim END


███╗   ██╗███████╗ ██████╗ ████████╗███████╗ ██████╗ 
████╗  ██║██╔════╝██╔═══██╗╚══██╔══╝██╔════╝██╔═══██╗
██╔██╗ ██║█████╗  ██║   ██║   ██║   █████╗  ██║   ██║
██║╚██╗██║██╔══╝  ██║   ██║   ██║   ██╔══╝  ██║   ██║
██║ ╚████║███████╗╚██████╔╝   ██║   ███████╗╚██████╔╝
╚═╝  ╚═══╝╚══════╝ ╚═════╝    ╚═╝   ╚══════╝ ╚═════╝ 


END
autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2


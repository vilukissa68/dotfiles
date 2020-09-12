"  _____   __     __  _______   _    _    ____    _   _
" |  __ \  \ \   / / |__   __| | |  | |  / __ \  | \ | |
" | |__) |  \ \_/ /     | |    | |__| | | |  | | |  \| |
" |  ___/    \   /      | |    |  __  | | |  | | | . ` |
" | |         | |       | |    | |  | | | |__| | | |\  |
" |_|         |_|       |_|    |_|  |_|  \____/  |_| \_|

"Python filesetup
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix


" Syntax
let python_highlight_all=1
syntax on

" Lintin
let b:ale_linters = ['flake8']
let b:ale_warn_about_trailing_whitespace = 1

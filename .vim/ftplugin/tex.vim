" LATEX
let g:livepreview_previwer = "zathura"

nnoremap <F5> :!pdflatex % <CR>
nnoremap <F6> :!pdflatex % <CR> && zathrura %.pdf <CR>

" Clean aux files when exiting vim
:autocmd BufWinLeave * :!latexmk -c
:autocmd BufWritePost * :!pdflatex %

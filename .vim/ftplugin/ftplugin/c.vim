" Makefile syntax"
au BufRead,BufNewFile Makefile* set noexpandtab

" Doxygen highlighting
augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END

" C syntax
au BufNewFile,BufRead *.h,*.hh,*.c
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set noexpandtab |
    \ set colorcolumn=110 |
    \ highlight ColorColumn ctermbg=darkgray

" Compile and run"
nnoremap <F5> :!gcc % -Wall -g -o %.out && ./%.out<CR>
nnoremap <F6> :!gcc *.c -o project.out && ./project.out<CR>




"   _____       __   _____
"  / ____|     / /  / ____|    _       _
" | |         / /  | |       _| |_   _| |_
" | |        / /   | |      |_   _| |_   _|
" | |____   / /    | |____    |_|     |_|
"  \_____| /_/      \_____|

" Makefile syntax"
au BufRead,BufNewFile Makefile* set noexpandtab

" Doxygen highlighting
augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END

" C syntax
au BufNewFile,BufRead *.h,*.c,*.cpp
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set noexpandtab |
    \ set colorcolumn=110 |
    \ highlight ColorColumn ctermbg=darkgray

" Compile and run"
nnoremap <F5> :!g++ -std=c++11 % -Wall -g -o %.out && ./%.out<CR>
nnoremap <F6> :!g++ *.cpp -o project.out && ./project.out<CR>



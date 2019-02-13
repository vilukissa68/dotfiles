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

" FSWITCH CONFIGURATION
au! BufEnter *.cpp let b:fswitchdst = 'hh,hpp,h' | let b:fswitchlocs = '../inc'

" ENHANCED CPP HIGHLIGHTING"
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 0
let g:cpp_no_function_highlight = 1
let g:cpp_concepts_highlight = 1

"Switch to the file and load it into the current window
nmap <silent> <F4> <Leader>of :FSHere<cr>

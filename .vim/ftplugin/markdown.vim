" PDF compile
nnoremap <F5> :!pandoc % -V geometry:margin=3cm -s -o %:r.pdf <CR>
:autocmd BufWritePost * !pandoc % -V geometry:margin=3cm -s -o %:r.pdf

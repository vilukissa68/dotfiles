" PDF compile
nnoremap <F5> :!pandoc % -s -o %:r.pdf <CR>
:autocmd BufWritePost * !pandoc % -s -o %:r.pdf

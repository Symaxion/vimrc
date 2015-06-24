setl shiftwidth=2
setl tabstop=2
setl softtabstop=2
setl iskeyword+=:
setl foldmethod=expr
setl formatoptions+=t "a
setl formatoptions-=l

fun! LaTeXFill(number)
  let n = a:number-col('.') - 1
  let myline = repeat('%', n)
  exe "normal A ".myline."\<Esc>"
endfun

nnoremap <Leader>ls :call LaTeXFill(80)<CR>
nnoremap <Leader>ld :call LaTeXFill(60)<CR>
nnoremap <Leader>lf :call LaTeXFill(40)<CR>

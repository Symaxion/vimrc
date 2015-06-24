" =========================================================================
" File: getter-setter.vim
" Author: Frank "SeySayux" Erens
" Description: Getters and Setters for C++
" Last Modified: 2014-02-13
" License: Public Domain
"
" =========================================================================

function! s:CreateGetter(bang)
  " Get current line
  let l:line = getline('.')

  " Perform substitutions
  if a:bang
    let l:line = substitute(l:line, '\s*\(.*\) m\(.*\);', 
        \ '\1 \l\2() const { return m\2; }\n', '')
  else
    let l:line = substitute(l:line, '\s*\(.*\) m\(.*\);', 
        \ 'const \1\& \l\2() const { return m\2; }\n', '')
  endif
  return l:line
endfunction

function! s:CreateSetter(bang)
  " Get current line
  let l:line = getline('.')

  " Perform substitutions
  if a:bang
    let l:line = substitute(l:line, '\s*\(.*\) m\(.*\);', 
        \ 'void set\2(\1 x) { m\2 = x; }\n', '')
  else
    let l:line = substitute(l:line, '\s*\(.*\) m\(.*\);', 
        \ 'void set\2(const \1\& x) { m\2 = x; }\n', '')
  endif
  return l:line
endfunction

function! s:Getter(bang)
  let @+ = s:CreateGetter(a:bang)
endfunction

function! s:Setter(bang)
  let @+ = s:CreateSetter(a:bang)
endfunction

function! s:GetterSetter(bang)
  let @+ = s:CreateGetter(a:bang) . s:CreateSetter(a:bang)
endfunction

command! -bang Getter call s:Getter(<bang>0)
command! -bang Setter call s:Setter(<bang>0)
command! -bang GetterSetter call s:GetterSetter(<bang>0)

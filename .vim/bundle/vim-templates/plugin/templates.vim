" File: templates.vim
" Author: Frank Erens <frank@synthi.net>
" Last Modified: 2015-09-12

" Options and default values
if !exists('g:templates')
  let g:templates = {}
endif

if !exists('g:templates.name')
  let g:templates.name = 'Your Name'
endif

if !exists('g:templates.email')
  let g:templates.email = 'youremail@example.com'
endif

function s:templateForPath(path, ext)
  let l:parent = fnamemodify(a:path, ':h')

  let l:template = l:parent . '/.template.' . a:ext

  if filereadable(l:template)
    return l:template
  endif

  if l:parent == '/'
    return ""
  else
    return s:templateForPath(l:parent, a:ext)
  endif
endfunction

function s:replace(from, to)
  let l:from = substitute(a:from, '[\\/]', '\\&', 'g')
  let l:to   = substitute(a:to  , '[\\/]', '\\&', 'g')
  execute 'silent! %s/\V%'.l:from.'%/'.l:to.'/gie'
endfunction

function s:applyTemplate()
  " Find correct template for given file type in this or any parent directory
  let l:template = s:templateForPath(expand('%:p'), expand('%:e'))

  " No template found
  if l:template == ""
    return
  endif

  let l:templatepath = fnamemodify(l:template, ':h')
  let l:relpath = substitute(expand('%:p'), '^'.l:templatepath.'/', '', '')
  let l:relpathnoext = fnamemodify(l:relpath, ':r')
  let l:basedir = fnamemodify(l:relpath, ':h')
  let l:headerguard = toupper(substitute(l:relpathnoext, '/', '_', 'g'))

  " Read template into current buffer
  execute '0read '.l:template
  normal GG"_dd

  " Apply substitutions
  call s:replace('name'         , g:templates.name)
  call s:replace('email'        , g:templates.email)

  call s:replace('year'         , strftime('%Y'))
  call s:replace('fname'        , expand('%:t'))
  call s:replace('froot'        , expand('%:t:r'))
  call s:replace('fext'         , expand('%:e'))
  call s:replace('relpath'      , l:relpath)
  call s:replace('relpathnoext' , l:relpathnoext)
  call s:replace('basedir'      , l:basedir)
  call s:replace('headerguard'  , l:headerguard)

  " Find Code here marker
  execute 'silent! ?\ccode here'
  nohl
endfunction

function s:loadTemplate()
  if &modifiable != 1
    return 
  endif

  if getfsize(expand('%:p')) < 2
    call s:applyTemplate()
  endif
endfunction

augroup templates
  autocmd BufRead,BufNewFile * call s:loadTemplate()
augroup END

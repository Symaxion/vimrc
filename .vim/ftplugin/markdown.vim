" Vim filetype plugin
" Language: Markdown
" Maintainer: Frank Erens <frank@synthi.net>

if exists("b:did_ftplugin")
  finish
endif

" Automatically open Marked {{{1
function! s:OpenMarked()
  execute "w"
  execute ":silent !open -a Marked '%:p'"
  set ut=250
  setl sts=4
  au CursorHold,CursorHoldI *.md update
  au BufDelete,VimLeave *.md :call s:CloseMarked() 
endfunction

function! s:CloseMarked()
  execute "silent !osascript -e 'tell application \"Marked\"' -e 'if (count of windows) / 2 <= 1 then' -e 'quit application' -e 'else' -e 'close window \"" . expand("%:p:t") . "\"' -e 'end if' -e 'end tell'"
endfunction 

if has("macunix")
  if expand("%") == ""
    au BufWrite * call s:OpenMarked()
  else
    call s:OpenMarked()
  endif
endif

" Format Options {{{1
setl formatoptions+=tn
setl formatoptions-=l

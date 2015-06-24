" Refactoring
if executable("astyle")
  setl equalprg=astyle\ --options=$HOME/.vim/astyle
endif

" color
if has("gui")
  setl colorcolumn=+1,+40
endif


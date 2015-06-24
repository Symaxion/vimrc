if executable("astyle")
  setl equalprg=astyle\ --options=$HOME/.vim/astyle
endif

setl commentstring=//%s
setl ut=1000

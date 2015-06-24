" Color Scheme {{{1
set bg=light
colo force

" Basic GUI settings {{{1
set number
set cursorline
set showtabline=0
set laststatus=2
set spell spelllang=en_us
set guioptions-=L
set colorcolumn=+1
set fillchars=vert:\│

" Set font on Windows {{{1
if has("win32") || has("win32unix")
  set guifont=Bitstream_Vera_Sans_Mono:h10:cANSI,Lucida_Console:h10:cANSI
endif

" Set correct EDITOR environmental variable {{{1
if has("macunix")
  let $EDITOR='mvim'
endif

" Plugin settings {{{1

" NerdTree {{{2
if has("macunix")
  let NERDTreeWinSize=34
endif

" Fugitive {{{2
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" }}}

" vim: fdm=marker

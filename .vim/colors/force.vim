" Vim color file
" Maintainer: Randy Thiemann

hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name="force"

" Spelling
hi SpellBad         guisp=#E61222 gui=undercurl
hi SpellCap         guisp=#0000FF gui=undercurl
hi SpellLocal       guisp=#0F7775 gui=undercurl
hi SpellRare        guisp=#FF00FF gui=undercurl
hi DiffText         guisp=#880000 gui=underline

" Common
hi Directory        guifg=#1600FF               ctermfg=12                gui=NONE      cterm=NONE
hi FoldColumn       guifg=#000078 guibg=#BEBEBE ctermfg=18   ctermbg=145  gui=NONE      cterm=NONE
hi Folded           guifg=#000078 guibg=#E6E6E6 ctermfg=18   ctermbg=188  gui=NONE      cterm=NONE
hi IncSearch                                                              gui=reverse   cterm=reverse
hi ModeMsg                                                                gui=bold      cterm=bold
hi MoreMsg          guifg=#277B45               ctermfg=29                gui=bold      cterm=bold
hi PmenuSbar                      guibg=#BEBEBE              ctermbg=145  gui=NONE      cterm=NONE
hi PmenuSel         guifg=#FFFFFF guibg=#3A5C78 ctermfg=231  ctermbg=60   gui=NONE      cterm=NONE
hi PmenuThumb                                                             gui=reverse   cterm=reverse
hi Question         guifg=#387B04               ctermfg=64                gui=bold      cterm=bold
hi SignColumn       guifg=#000078 guibg=#BEBEBE ctermfg=10   ctermbg=145  gui=NONE      cterm=NONE
hi SpecialKey       guifg=#FF00FF               ctermfg=13                gui=NONE      cterm=NONE
hi StatusLine       guifg=#FFFFFF guibg=#6C6C6C ctermfg=231  ctermbg=23   gui=NONE      cterm=NONE
hi StatusLineNC     guifg=#5D6C7D guibg=#E5E5E5 ctermfg=60   ctermbg=188  gui=NONE      cterm=NONE
hi TabLine                        guibg=#C9C9C9              ctermbg=188  gui=underline cterm=underline
hi TabLineFill                                                            gui=reverse   cterm=reverse
hi TabLineSel                                                             gui=bold      cterm=bold
hi Title            guifg=#1187C1               ctermfg=31                gui=bold      cterm=bold
hi Warning          guifg=#770004               ctermfg=88                gui=NONE      cterm=NONE
hi WarningMsg       guifg=#E61222               ctermfg=160               gui=NONE      cterm=NONE
hi Error            guifg=#770004 guibg=#FFAA33 ctermfg=88   ctermbg=215  gui=underline,bold,italic cterm=bold
hi ErrorMsg         guifg=#FFFFFF guibg=#E61222 ctermfg=231  ctermbg=160  gui=NONE      cterm=NONE
hi Underlined       guifg=#53A7FF               ctermfg=75                gui=underline cterm=underline
hi Special          guifg=#7500DA guibg=NONE    ctermfg=92   ctermbg=NONE gui=NONE      cterm=NONE
hi Snippet          guifg=#D0961A guibg=#FFFFCC ctermfg=172  ctermbg=230  gui=italic    cterm=NONE

hi SyntasticErrorSign guibg=#FFCCCC guifg=#880000
hi SyntasticWarningSign guibg=#FFFFCC guifg=#888800

if &background == "dark"
  " dark colors
  hi Normal         guifg=#FFFFFF guibg=#000000 ctermfg=231  ctermbg=16   gui=NONE      cterm=NONE
  hi NonText        guifg=#00FFFF               ctermfg=14                gui=bold      cterm=bold
  hi Todo           guifg=#8CFF88 guibg=#137B04 ctermfg=120  ctermbg=28   gui=NONE      cterm=NONE
  hi CursorLine                   guibg=#1A1A1A              ctermbg=234  gui=NONE      cterm=NONE
  hi LineNr         guifg=#A9A9A9 guibg=#000000 ctermfg=244  ctermbg=16   gui=NONE      cterm=NONE
  hi CursorLineNr   guifg=#CCCCCC guibg=#1A1A1A ctermfg=251  ctermbg=233  gui=bold      cterm=bold
  hi ColorColumn                  guibg=#666666              ctermbg=241  gui=NONE      cterm=NONE
  hi Pmenu                        guibg=#444444              ctermbg=238  gui=NONE      cterm=NONE
  hi Constant       guifg=#E47C48               ctermfg=173               gui=NONE      cterm=NONE
  hi String         guifg=#FE2B38               ctermfg=197               gui=NONE      cterm=NONE
  hi Character      guifg=#786DFF               ctermfg=99                gui=NONE      cterm=NONE
  hi Identifier     guifg=#00CC00               ctermfg=40                gui=NONE      cterm=NONE
  hi Statement      guifg=#CC3090               ctermfg=168               gui=bold      cterm=bold
  hi PreProc        guifg=#E47C48               ctermfg=173               gui=bold      cterm=bold
  hi Type           guifg=#00A0FF               ctermfg=39                gui=bold      cterm=bold
  hi Directory      guifg=#00A0FF               ctermfg=39                gui=NONE      cterm=NONE
  hi VertSplit      guifg=#6C6C6C guibg=#7F7F7F ctermfg=23   ctermbg=59   gui=NONE      cterm=NONE
  hi DiffAdd        guifg=#FFFFFF guibg=#34A75D ctermfg=231  ctermbg=71   gui=NONE      cterm=NONE
  hi DiffChange     guifg=#FFFFFF guibg=#770078 ctermfg=231  ctermbg=90   gui=NONE      cterm=NONE
  hi DiffDelete     guifg=#DAFFFF guibg=#386DA5 ctermfg=195  ctermbg=61   gui=bold      cterm=bold
  hi DiffText       guifg=#FFFFFF guibg=#FF0000 ctermfg=231  ctermbg=196  gui=underline cterm=underline
  hi Visual                       guibg=#666666              ctermbg=59   gui=NONE      cterm=NONE

  hi IndentGuidesOdd  guibg=#111111
  hi IndentGuidesEven guibg=#111111

else
  " light colors
  hi Normal         guifg=#000000 guibg=#FFFFFF ctermfg=16   ctermbg=231  gui=NONE      cterm=NONE
  hi NonText        guifg=#00875F               ctermfg=29                gui=bold      cterm=bold
  hi Todo           guifg=#0D5402 guibg=#8CFF88 ctermfg=22   ctermbg=120  gui=NONE      cterm=NONE
  hi CursorLine                   guibg=#F1F5FA              ctermbg=231  gui=NONE      cterm=NONE
  hi LineNr         guifg=#888888 guibg=#E6E6E6 ctermfg=102  ctermbg=188  gui=NONE      cterm=NONE
  hi CursorLineNr   guifg=#888888 guibg=#E6E6E6 ctermfg=102  ctermbg=188  gui=bold      cterm=bold
  hi ColorColumn                  guibg=#C9C9C9              ctermbg=188  gui=NONE      cterm=NONE
  hi Pmenu                        guibg=#BFD9FF              ctermbg=153  gui=NONE      cterm=NONE
  hi Constant       guifg=#FC7808               ctermfg=208  ctermbg=231  gui=NONE      cterm=NONE
  hi String         guifg=#AA0000               ctermfg=124  ctermbg=231  gui=NONE      cterm=NONE
  hi Character      guifg=#786DFF               ctermfg=99   ctermbg=231  gui=NONE      cterm=NONE
  hi Identifier     guifg=#387A61               ctermfg=65   ctermbg=231  gui=NONE      cterm=NONE
  hi Statement      guifg=#9E1B4E               ctermfg=125  ctermbg=231  gui=bold      cterm=bold
  hi PreProc        guifg=#137B04               ctermfg=28   ctermbg=231  gui=bold      cterm=bold
  hi Type           guifg=#134DBF               ctermfg=25   ctermbg=231  gui=bold      cterm=bold
  hi Directory      guifg=#134DBF               ctermfg=25   ctermbg=231  gui=NONE      cterm=NONE
  hi VertSplit      guifg=#6C6C6C guibg=#E5E5E5 ctermfg=59   ctermbg=188  gui=NONE      cterm=NONE
  hi DiffAdd                      guibg=#88FF88              ctermbg=120  gui=NONE      cterm=NONE
  hi DiffChange                   guibg=#FCA7FF              ctermbg=219  gui=NONE      cterm=NONE
  hi DiffDelete     guifg=#0000FF guibg=#DAFFFF ctermfg=12   ctermbg=195  gui=bold      cterm=NONE
  hi DiffText                     guibg=#FF9999              ctermbg=210  gui=NONE      cterm=NONE
  hi Visual                       guibg=#98BDFE              ctermbg=111  gui=NONE      cterm=reverse

  hi IndentGuidesOdd  guibg=#EEEEEE
  hi IndentGuidesEven guibg=#EEEEEE

endif

if has("gui_macvim") && !exists("s:augroups_defined")
  au FocusLost * if exists("colors_name") && colors_name == "force" |
      \ if &bg == "light" |
      \ hi Visual guibg=MacSecondarySelectedControlColor |
      \ else |
      \ hi Visual guibg=#333333 |
      \ endif
  au FocusGained * if exists("colors_name") && colors_name == "force" |
      \ if &bg == "light" |
      \ hi Visual guibg=MacSelectedTextBackgroundColor |
      \ else |
      \ hi Visual guibg=#666666 |
      \ endif

  let s:augroups_defined = 1
endif

if has("gui_macvim")
  if &bg == "light"
    set transparency=0
  else
    set transparency=20
  endif
endif

if exists("g:force_greyComments")
  if &bg == "light"
    hi Comment guifg=#888888 ctermfg=102 gui=italic cterm=NONE
  else
    hi Comment guifg=#BEBEBE ctermfg=145 gui=italic cterm=NONE
  endif
else
  if &bg == "light"
    hi Comment guifg=#00703C ctermfg=23  gui=italic cterm=NONE
  else
    hi Comment guifg=#74C365 ctermfg=113 gui=italic cterm=NONE
  endif
endif

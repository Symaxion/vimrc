" Theme to mimic the default colorscheme of powerline
" Not 100% the same so it's powerline... ish.
"
" Differences from default powerline:
" * Paste indicator isn't colored different
" * Far right hand section matches the color of the mode indicator
"
" Differences from other airline themes:
" * No color differences when you're in a modified buffer
" * Visual mode only changes the mode section. Otherwise
"   it appears the same as normal mode

" Normal mode                                    " fg             & bg
let s:N1 = [ '#005f00' , '#afd700' , 22  , 148 ] " darkestgreen   & brightgreen
let s:N2 = [ '#303030' , '#dadada' , 236 , 253 ] " gray2          & gray11
let s:N3 = [ '#000000' , '#d0d0d0' , 16  , 252 ] " black          & gray10

" Insert mode                                    " fg             & bg
let s:I1 = [ '#005f5f' , '#ffffff' , 23  , 231 ] " darkestcyan    & white
let s:I2 = [ '#0000ff' , '#87afff' , 21  , 111 ] " fullblue       & bluepurple
let s:I3 = [ '#005f87' , '#87d7ff' , 24  , 117 ] " darkestblue    & mediumcyan

" Visual mode                                    " fg             & bg
let s:V1 = [ '#870000' , '#ff8700' , 88  , 208 ] " darkred        & brightorange

" Replace mode                                   " fg             & bg
let s:RE = [ '#ffffff' , '#d70000' , 231 , 160 ] " white          & brightred

let g:airline#themes#powerlineish_light#palette = {}

let g:airline#themes#powerlineish_light#palette.normal = 
    \ airline#themes#generate_color_map(s:N1, s:N2, s:N3)

let g:airline#themes#powerlineish_light#palette.insert = 
    \ airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#powerlineish_light#palette.insert_replace =
    \ airline#themes#generate_color_map(s:RE, s:N2, s:N3)

let g:airline#themes#powerlineish_light#palette.visual =
    \ airline#themes#generate_color_map(s:V1, s:N2, s:N3)

let g:airline#themes#powerlineish_light#palette.replace = copy(airline#themes#powerlineish_light#palette.normal)
let g:airline#themes#powerlineish_light#palette.replace.airline_a = [ s:RE[0] , s:RE[1] , s:RE[2] , s:RE[3] , '' ]


let s:IA = [ s:N2[0] , s:N3[1] , s:N2[2] , s:N3[3] , '' ]
let g:airline#themes#powerlineish_light#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)

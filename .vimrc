" Full vimrc with plugins

" Basic options

" Vim settings {{{1

set smartindent
set cindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab
set expandtab
set ignorecase
set smartcase
set textwidth=80
set formatoptions+=r
set cinoptions=:0g0N-s
set backspace=2
set mouse=a
set hidden
set nobackup
set nowritebackup
set noswapfile
set ruler
set showcmd
set clipboard=unnamed
set encoding=utf-8
set hlsearch
set incsearch
set grepprg=grep\ -nH\ $*
set completeopt-=preview
set path+=/usr/local/include

syntax on
filetype plugin on
filetype plugin indent on

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j
endif

let g:tex_flavor='latex'
let g:is_posix = 1
let g:load_doxygen_syntax=1
let g:vim_markdown_math=1
let g:vim_markdown_folding_disabled=1

" }}}

" Keybinds {{{1

" Map redraw screen (C-L) to also turn of search highlighting. {{{2
nnoremap <C-l> :nohl<CR><C-l>

" Auto indent for C-like languages {{{2
if &ft == 'c' || &ft == 'cpp' || &ft == 'objc' || &ft == 'objcpp'
  noremap <D-i> :pyf ~/.vim/python/clang-format.py<CR>
  inoremap <D-i> <ESC>:pyf ~/.vim/python/clang-format.py<CR>i
else
  nnoremap <D-i> gg=G
  inoremap <D-i> <Esc>gg=Gi
  vnoremap <D-i> =
endif

" Easier split switching {{{2
nnoremap <Tab> <C-w>w
nnoremap <S-Tab> <C-w>W

" Jump back to previous/next -- easier and avoid conflict with <C-I> (Tab)
nnoremap <Leader>o <C-O>
nnoremap <Leader>i <C-I>

" Commands {{{1

" Tweaks {{{1

" Automatically change to directory of file {{{1
autocmd BufEnter * silent! lcd %:p:h

" Show NFOs in correct codepage {{{2
au BufNewFile,BufRead *.nfo edit ++enc=cp437

" Delete trailing whitespace in code {{{2
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python,glsl,cmake 
  \ autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
" }}}

" Color scheme {{{1
let g:force_greyComments=1
set background=dark
colo force
" }}}

" Plugins

let g:pathogen_disabled = []

" BufExplorer options {{{1
nmap <silent> <D-e>
        \ :<C-u>exe winnr('$') . "wincmd w"<CR>
        \ :<C-u>BufExplorer<CR>
imap <silent> <D-e> 
        \ <Esc>:<C-u>exe winnr('$') . "wincmd w"<CR>
        \ :<C-u>BufExplorer<CR>

" MiniBufExplorer options {{{1
let g:miniBufExplorerAutoStart=0
let g:miniBufExplBuffersNeeded=0
let g:miniBufExplUseSingleClick=1
let g:miniBufExplorerDebugLevel=10

" NOTE: Temporarily disable minibufexpl
" Delete this if removed, re-enable if kept
call add(g:pathogen_disabled, 'minibufexpl.vim')

" NERDTree options {{{1
let g:nerdtree_tabs_open_on_gui_startup = 0
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2
let g:NERDTreeMapHelp='h'
let g:NERDTreeOpenInTabByDefault=1
let g:NERDTreeAutoRefreshOnSave=0
let g:NERDTreeIgnore=[
  \ '\.aux$',
  \ '\.bbl$',
  \ '\.blg$',
  \ '\.fdb_latexmk$',
  \ '\.fls$',
  \ '\.toc$',
  \ '\.lof$',
  \ '\.loa$',
  \ '\.tdo$',
  \ '\.bcf$',
  \ '\.latexmain$',
  \ '\.run.xml$',
  \ '-blx\.bib$']

nnoremap <silent>;r
        \ :<C-u>NERDTreeFind<CR>


" Airline Options {{{1
let g:airline_theme = 'powerlineish_light'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'
let g:airline_detect_spell=0

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1

set showtabline=2

" Local vimrc options {{{1
let g:local_vimrc = [ '.vimrc_local.vim' ]

" Snipmate options {{{1
let g:snips_author = "Frank Erens"

" Templates options {{{1
let g:templates = {}
let g:templates.name = "Frank Erens"
let g:templates.email = "frank@synthi.net"

" LaTeX-Box options {{{1
let g:LatexBox_viewer = 'open'
let g:LatexBox_Folding = 0
let g:LatexBox_fold_envs = 0
let g:LatexBox_fold_preamble = 0
let g:LatexBox_quickfix = 4

" YouCompleteMe options {{{1
let g:ycm_global_ycm_extra_conf=$HOME . '/.vim/python/ycm_global.py'
let g:ycm_extra_conf_vim_data = ['g:ycm_global_ycm_extra_conf']
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_confirm_extra_conf = 0
let g:ycm_open_loclist_on_ycm_diags = 1
let g:ycm_filepath_completion_use_working_dir = 1
let g:ycm_filetype_blacklist = {}
let g:ycm_server_python_interpreter = "/usr/local/bin/python3"

nnoremap <silent> ;e :YcmForceCompileAndDiagnostics<CR>

" ListToggle options {{{1
let g:lt_location_list_toggle_map = ';l'
let g:lt_quickfix_list_toggle_map = ';q'

" Syntastic options {{{1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'

" Turn off checkers for LaTeX
let g:syntastic_tex_checkers = []

" Dash.vim options {{{1
nnoremap <Leader>] <Plug>DashSearch

" delimitMate options {{{1
let delimitMate_expand_cr = 1
au FileType vim let b:delimitMate_quotes="'" 

" Sideways.vim options {{{1
nnoremap <silent> ,< :SidewaysLeft<CR>
nnoremap <silent> ,> :SidewaysRight<CR>
omap aa <Plug>SidewaysArgumentTextobjA
xmap aa <Plug>SidewaysArgumentTextobjA
omap ia <Plug>SidewaysArgumentTextobjI
xmap ia <Plug>SidewaysArgumentTextobjI

" XMLEdit options {{{1
let g:xmledit_enable_html = 1
" Vim indent guides options {{{1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1


let g:vimrc_plugins_loaded=1

" Force Python 3
let $PYTHONHOME="/usr/local/Frameworks/Python.framework/Versions/3.6"
call has('python3')

" Load pathogen {{{1
call pathogen#infect()

" Denite options {{{1
nnoremap <silent> ;f
        \ :<C-u>exe winnr('$') . "wincmd w"<CR>
        \ :<C-u>DeniteProjectDir -buffer-name=files
        \ -sorters=sorter_sublime
        \ file_point buffer file_rec<CR>

nnoremap <silent> ;g
        \ :<C-u>exe winnr('$') . "wincmd w"<CR>
        \ :<C-u>DeniteProjectDir
        \ -mode=normal -default-action=quickfix
        \ grep<CR>

" Map PgUp/PgDn for navigating Denite results
call denite#custom#map('insert', '<Up>', '<C-T>')
call denite#custom#map('insert', '<Down>', '<C-G>')

call denite#custom#map('normal', '<PageUp>', 'k')
call denite#custom#map('normal', '<PageDown>', 'j')
call denite#custom#map('normal', '<Up>', 'k')
call denite#custom#map('normal', '<Down>', 'j')

" Use ag for filename searching
call denite#custom#var('file_rec', 'command',
	  \ ['ag', '--nocolor', '--nogroup', '-g', ''])

" Use ag for file contents searching
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',
    \ ['-aS', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Use Sublime sorter
call denite#custom#source('file_rec', 'sorters', ['sorter_sublime'])

" }}}

" vim: fdm=marker



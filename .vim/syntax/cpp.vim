" Vim Syntax File
" Maintainer: Frank Erens <frank@synthi.net>
" Last Change: 2015-08-05

syn match cppConstant   /\<k[A-Z]\w\+\>/
syn match cppMember     /\<m[A-Z]\w\+\>/
syn match cppGlobal     /\<g[A-Z]\w\+\>/

hi def link cppConstant Constant
hi def link cppMember   Identifier
hi def link cppGlobal   WarningMsg

" Opens a terminal in the directory of the file.

" Mac OS X
if has("macunix")
    command! Term silent !osascript -e 'tell application "iTerm"' -e 'activate' -e 'set myTerm to (create window with default profile)' -e 'tell current session of myTerm' -e 'write text "cd '$(pwd)'; clear"' -e 'end tell' -e 'end tell'
endif

" Windows/Cygwin
" TODO.

" Linux/Unix/etc...
if has("unix") && !has("macunix") && !has("win32unix")
    if executable("konsole")
        command! Term silent !konsole --workdir $(pwd)
    endif
endif

" VimProjects

fun! FindProject()
    return fnamemodify(finddir(".vimproject", ".;"), ":p:h:h")
endfun

fun! LoadProject(path)
    if a:path == ""
        return
    endif

    let g:ProjectRoot = a:path

    execute "source ".g:ProjectRoot."/.vimproject/vimrc"

    execute "set rtp=".&rtp.",".a:path."/.vimproject"     
    echo "Project ".g:ProjectRoot." loaded!"

endfun

fun! FindAndLoadProject() 
    call LoadProject(FindProject())
endfun

if !has("win32")
  au! BufNewFile,BufRead * silent! call FindAndLoadProject()
endif

if WINDOWS; then
    INCLUDE=(
        .vim:vimfiles
        .vimrc:_vimrc
        .gvimrc:_gvimrc
    )
else
    INCLUDE=(
        .vim
        .vimrc
        .gvimrc
    )
fi

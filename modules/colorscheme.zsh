function color() {
    if [[ -n "$1" ]]; then
        colorscheme=$1
    else
        colorscheme="default"
    fi

    if [[ ! -f "$ZSHCONFDIR/colorschemes/$colorscheme.zsh" ]]; then
        colorscheme="default"
    fi

    source $ZSHCONFDIR/colorschemes/$colorscheme.zsh
}

function _colorcomplete() {
    reply=()
    if (( CURRENT == 2 )) ; then
        for f in $ZSHCONFDIR/colorschemes/* ; do
            reply+=(${${f##*/}%\.*})
        done
    fi
}

# Completion \o/
compctl -Y "%B${c[24]}colorscheme%f%b" -K _colorcomplete color

if [[ -z "$ZCOLORSCHEME" ]]; then
    color $ZCOLOR
    export ZCOLORSCHEME=$ZCOLOR
fi

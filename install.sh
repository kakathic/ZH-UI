
ls /bin

Likk="$GITHUB_WORKSPACE"

Taive(){ curl -# -L "$1" -o "$2"; }
Xem(){ curl -s -L -G "$@"; }
Getpro () { grep -m1 "$1=" $Likk/Zom_Custom.md | cut -d = -f2; }


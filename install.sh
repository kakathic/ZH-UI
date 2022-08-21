# kakathic

Likk="$GITHUB_WORKSPACE"

Taive(){ curl -# -L "$1" -o "$2"; }
Xem(){ curl -s -L -G "$@"; }
Getpro () { grep -m1 "$1=" $Likk/Zom_custom.md | cut -d = -f2; }

ListTM="tmp
Unpack
Repapk
Unzip
"

for Vak in $ListTM; do
mkdir -p $Vak
done

Taive "$(Getpro Http)" "$Likk/rom.zip"

unzip -qo "$Likk/rom.zip" -d "$Likk/Unzip"






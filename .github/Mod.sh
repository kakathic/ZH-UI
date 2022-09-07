#!/bin/bash
# Thư mục chứa tập tin: $TOME/Apk
[[ -z "$(ls $TOME/Apk)" ]] && echo "- Không có tập tin nào!"  
# Thư mục chứa apk,jar đã mod: $TOME/Mod

apktool() { java -Xmx512M -Dfile.encoding=utf-8 -jar $TOME/.github/Tools/kikfox.jar "$@"; }
baksmali() { java -Xmx512M -Dfile.encoding=utf-8 -jar $TOME/.github/Tools/baksmali-2.3.4.jar "$@"; }
smali() { java -Xmx512M -Dfile.encoding=utf-8 -jar $TOME/.github/Tools/smali-2.5.2.jar "$@"; }

Timkiem() { grep -Rl "$1" $2; }

Thaythe() {
Tt1="$(Timkiem "$1" "$3")"
[[ "$Tt1" ]] && echo "MOD: $1 -> $2" | sed "s|\\\/|/|g"
for Tt2 in $Tt1; do
[[ "$Tt2" ]] && sed -i -e "s|$1|$2|g" $Tt2
done
}

Vsmali() {
for Vka in $(Timkiem "$1" "$4"); do
echo "MOD: $(echo "$1" | sed 's|\\||g')"
sed -i -e "/^$1/,/$2/c $(echo "$3" | sed -z 's|\n|\\n|g')" "$Vka"
done
}



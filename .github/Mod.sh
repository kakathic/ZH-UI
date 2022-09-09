#kakathic

TOME="$GITHUB_WORKSPACE"
bash $TOME/Option.md

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

# Cài ngôn ngữ

Taive "https://github.com/kakathic/ZH-TT/releases/download/HH/TT.Zip" "$TOME/VH.zip"
unzip -qo $TOME/VH.zip -d $TOME/VH
[ -e /mnt/tmp/product/overlay ] && TMVH=/mnt/tmp/product/overlay || TMVH=/mnt/tmp/vendor/overlay
sudo cp -rf $TOME/VH/apk/* $TMVH
sudo cp -rf $TOME/VH/framework-miui-res /mnt/tmp/system/media/theme/default
if [ "$Licham" == 0 ];then
sudo cp -rf $TOME/VH/notamlich/*.apk $TMVH
sudo cp -rf $TOME/VH/notamlich/framework-miui-res /mnt/tmp/system/media/theme/default
fi





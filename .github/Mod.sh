#kakathic

TOME="$GITHUB_WORKSPACE"
bash $TOME/Option.md

# Thư mục chứa tập tin: $TOME/Apk
[[ -z "$(ls $TOME/Apk)" ]] && echo "- Không có tập tin nào!"  
# Thư mục chứa apk,jar đã mod: $TOME/Mod

apktool() { java -Xmx512M -Dfile.encoding=utf-8 -jar $TOME/.github/Tools/kikfox.jar "$@"; }
baksmali() { java -Xmx512M -Dfile.encoding=utf-8 -jar $TOME/.github/Tools/baksmali-2.3.4.jar "$@"; }
smali() { java -Xmx512M -Dfile.encoding=utf-8 -jar $TOME/.github/Tools/smali-2.5.2.jar "$@"; }
sudo apt install zipalign >/dev/null

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


# Xử lý apk
Unpack(){
for vapk in $TOME/Apk/*.apk; do
mkdir -p ${vapk%.*}
unzip -qo "$vapk" '*.dex' -d ${vapk%.*}
for vsmali in ${vapk%.*}/*.dex; do
baksmali $vsmali -o ${vsmali%.*}
done
ls ${vapk%.*}
done
}

# Đóng gói apk
Repack(){
for bapk in $TOME/Apk/*.apk; do
for bsmali in $(cat ${bapk%.*}/class).dex; do
rm -fr $bsmali
smali -o ${bsmali%.*} -o $bsmali
done
cd ${bapk%.*}
zip -qr -0 $bapk *.dex
zipalign -f 4 $bapk $TOME/${bapk##*/}
done
}

# Cài ngôn ngữ
if [ "$NNTV" == "Viet_Nam" ];then
Taive "https://github.com/kakathic/ZH-TT/releases/download/HH/TT.Zip" "$TOME/VH.zip"
7z x -tzip -y "$TOME/TT.Zip" -p2 -o$TOME/VH >&2
[ -e /mnt/tmp/product/overlay ] && TMVH=$TOME/Mod/product/overlay || TMVH=$TOME/Mod/vendor/overlay
mkdir -p $TMVH
mkdir -p $TOME/Mod/system/media/theme/default
sudo cp -rf $TOME/VH/apk/* $TMVH
sudo cp -rf $TOME/VH/framework-miui-res $TOME/Mod/system/media/theme/default
if [ "$Licham" == 0 ];then
sudo cp -rf $TOME/VH/notamlich/*.apk $TMVH
sudo cp -rf $TOME/VH/notamlich/framework-miui-res $TOME/Mod/system/media/theme/default
fi
else
Taive "https://github.com/kakathic/ZH-TT/releases/download/HH/TG.Zip" "$TOME/TG.zip"
7z x -tzip -y "$TOME/TG.Zip" -p2 -o$TOME/VH >&2
[ -e /mnt/tmp/product/overlay ] && TMVH=$TOME/Mod/product/overlay || TMVH=$TOME/Mod/vendor/overlay
mkdir -p $TMVH
sudo cp -rf $TOME/VH/apk/* $TMVH
fi

# unpack all
Unpack;








Repack;
# kết thúc



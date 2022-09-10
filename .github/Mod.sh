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

Timkiem(){ find $TOME/Apk/$2 -name "*.smali" -exec grep -l "$1" {} +; }

Vsmali() {
for Vka in $(Timkiem "$1" "$4/$5"); do
#echo "MOD: $(echo "$1" | sed 's|\\||g')"
sed -i -e "/^$1/,/$2/c $(echo "$3" | sed -z 's|\n|\\n|g')" "$Vka"
echo "$Vak" >> $4/class
done
}


# giải nén file
Unpackfile(){
for vapk in $TOME/Apk/*.*; do
mkdir -p ${vapk%.*}
unzip -qo "$vapk" '*.dex' -d ${vapk%.*}
for vsmali in ${vapk%.*}/*.dex; do
baksmali d $vsmali -o ${vsmali%.*}
done
ls ${vapk%.*}
done
}

# Đóng gói apk
Repackfile(){
for bapk in $TOME/Apk/*.*; do
for bsmali in $(cat ${bapk%.*}/class | sed "s|$TOME/Apk/||g" | cut -d '/' -f2 | sort | uniq).dex; do
rm -fr $bsmali
smali a -o ${bsmali%.*} -o $bsmali
done
cd ${bapk%.*}
zip -qr -0 $bapk *.dex
zipalign -f 4 $bapk $TOME/Mod/${bapk##*/}
done
}

# Cài ngôn ngữ
if [ "$NNTV" == "Viet_Nam" ];then
Taive "https://github.com/kakathic/ZH-TT/releases/download/HH/TT.Zip" "$TOME/VH.zip"
7z x -tzip -y "$TOME/TT.Zip" -o $TOME/VH -p2
[ -e /mnt/tmp/product/overlay ] && TMVH=$TOME/Mod/product/overlay || TMVH=$TOME/Mod/vendor/overlay
mkdir -p $TMVH
mkdir -p $TOME/Mod/system/media/theme/default
cp -rf $TOME/VH/apk/* $TMVH
cp -rf $TOME/VH/framework-miui-res $TOME/Mod/system/media/theme/default
if [ "$Licham" == 0 ];then
cp -rf $TOME/VH/notamlich/*.apk $TMVH
cp -rf $TOME/VH/notamlich/framework-miui-res $TOME/Mod/system/media/theme/default
fi
else
Taive "https://github.com/kakathic/ZH-TT/releases/download/HH/TG.Zip" "$TOME/TG.zip"
7z x -tzip -y "$TOME/TG.Zip" -p2 -o$TOME/VH
[ -e /mnt/tmp/product/overlay ] && TMVH=$TOME/Mod/product/overlay || TMVH=$TOME/Mod/vendor/overlay
mkdir -p $TMVH
cp -rf $TOME/VH/apk/* $TMVH
fi

# Unpack all
Unpackfile;

# Xoá Getapps
Vsmali ".method private checkSystemSelfProtection(Z)V" \
".end method" \
'.method private checkSystemSelfProtection(Z)V
    .locals 1
    return-void
.end method' \
''$m'-services' "classes*/com/miui/server/*"






Repackfile;
# kết thúc



#kakathic

TOME="$GITHUB_WORKSPACE"
. $TOME/Option.md

API=$(grep ro.build.version.sdk= $TOME/tmp/system/system/build.prop | cut -d = -f2)
[ "$API" -ge 31 ] && m='miui-'
# Thư mục chứa tập tin: $TOME/Apk
[[ -z "$(ls $TOME/Apk)" ]] && echo "- Không có tập tin nào!"  
# Thư mục chứa apk,jar đã mod: $TOME/Mod

# apktool() { java -Xmx512M -Dfile.encoding=utf-8 -jar $TOME/.github/Tools/kikfox.jar "$@"; }
baksmali() { java -Xmx4g -jar $TOME/.github/Tools/baksmali-2.3.4.jar "$@"; }
smali() { java -Xmx4g -jar $TOME/.github/Tools/smali-2.5.2.jar "$@"; }

Timkiem() { find $TOME/Mod/$2 -name "*.smali" -exec grep -l "$1" {} +; }

Vsmali() {
for Vka in $(Timkiem "$1" "$4"); do
echo "MOD: $(echo "$1" | sed 's|\\||g')"
sed -i -e "/^$1/,/$2/c $(echo "$3" | sed -z 's|\n|\\n|g')" "$Vka"
echo "$Vka" >> $TOME/Mod/$(echo "$4" | sed "s|$TOME/Mod/||g" | cut -d '/' -f1)/class
done
}

# giải nén file
Unpackfile() {
for vapk in $TOME/Mod/*.*; do
mkdir -p ${vapk%.*}
unzip -qo "$vapk" '*.dex' -d ${vapk%.*}
for vsmali in ${vapk%.*}/*.dex; do
baksmali d --api $API $vsmali -o ${vsmali%.*}
done
done
}

# Đóng gói apk
Repackfile() {
for bapk in $TOME/Mod/*.*; do
if [ "${bapk##*.}" == 'apk' ] || [ "${bapk##*.}" == 'jar' ];then
for bsmali in $(cat ${bapk%.*}/class | sed "s|$TOME/Mod/||g" | cut -d '/' -f2 | sort | uniq); do
if [ -e "$bsmali".dex ];then
rm -fr "$bsmali".dex
smali a --api $API ${bapk%.*}/$bsmali -o "${bapk%.*}/$bsmali".dex
fi
done
unset bsmali
cd ${bapk%.*}
sudo zip -qr $bapk '*.dex'
zipalign -f 4 $bapk $TOME/Mod/tmp/${bapk##*/}
cp -rf $TOME/Mod/tmp/${bapk##*/} $bapk
fi
done
}

# Copy dữ liệu
Timfile() {
sudo cp -f $(find $TOME/tmp/* -name "$1") $TOME/Mod
}

# Cài ngôn ngữ
if [ "$NNTV" == "Viet_Nam" ];then
Taive "https://github.com/kakathic/ZH-VN/releases/download/HH/TT.Zip" "$TOME/TT.Zip"
7za x -tzip -y "$TOME/TT.Zip" -o$TOME/VH -p2 >/dev/null
[ -e $TOME/tmp/product/overlay ] && TMVH=$TOME/Mod/product/overlay || TMVH=$TOME/Mod/vendor/overlay
mkdir -p $TMVH
mkdir -p $TOME/Mod/system/media/theme/default
cp -af $TOME/VH/apk/* $TMVH
cp -af $TOME/VH/framework-miui-res $TOME/Mod/system/media/theme/default
if [ "$Licham" == 0 ];then
cp -af $TOME/VH/notamlich/*.apk $TMVH
cp -af $TOME/VH/notamlich/framework-miui-res $TOME/Mod/system/media/theme/default
fi
else
Taive "https://github.com/kakathic/ZH-TT/releases/download/HH/TG.Zip" "$TOME/TG.zip"
7za x -tzip -y "$TOME/TG.Zip" -o$TOME/VH -p2 >/dev/null
[ -e $TOME/tmp/product/overlay ] && TMVH=$TOME/Mod/product/overlay || TMVH=$TOME/Mod/vendor/overlay
mkdir -p $TMVH
cp -af $TOME/VH/apk/* $TMVH
fi

Timfile ''$m'services.jar'

# Unpack all
Unpackfile;

# Xoá Getapps
Vsmali ".method private checkSystemSelfProtection(Z)V" \
".end method" \
'.method private checkSystemSelfProtection(Z)V
    .locals 1
    return-void
.end method' \
''$m'services/classes*/com/miui/server/*'

Repackfile;
# kết thúc



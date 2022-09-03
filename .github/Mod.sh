# Thư mục chứa tập tin: $TOME/Apk
[[ -z "$(ls $TOME/Apk)" ]] && echo "- Không có tập tin nào!"  
# Thư mục chứa apk,jar đã mod: $TOME/Mod

apktool(){ java -Xmx512M -Dfile.encoding=utf-8 -jar $TOME/.github/Tools/kikfox.jar "$@"; }
baksmali(){ java -Xmx512M -Dfile.encoding=utf-8 -jar $TOME/.github/Tools/baksmali-2.3.4.jar "$@"; }
smali(){ java -Xmx512M -Dfile.encoding=utf-8 -jar $TOME/.github/Tools/smali-2.5.2.jar "$@"; }




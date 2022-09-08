echo "▼ Tên máy chủ"
uname -a
echo ::set-output name=uname::$(uname -a)
echo
echo "▼ Kiểm thử"

echo "- Cập nhật thư viện"
sudo apt-get update > /dev/null
sudo apt-get install curl zstd binutils e2fsprogs erofs-utils simg2img img2simg > /dev/null
pip3 install protobuf bsdiff4 six crypto construct google docopt pycryptodome > /dev/null

echo "pycryptodome
docopt
protobuf<=3.20.1" > requirements.txt
pip3 install -r requirements.txt > /dev/null

TOME="$GITHUB_WORKSPACE"
export TOME
Danhsach="tmp
Unpack
Repack
Unzip
Payload
Super
Apk
Mod
Up"
for Tao in $Danhsach; do
mkdir -p $Tao
done

echo "- Chuẩn bị"
Taive() { curl -s -L "$1" -o "$2"; }
Xem() { curl -s -L -G "$@"; }
Laylink() { grep -m1 "$1" $TOME/Zom_custom.md | cut -d = -f2; } 

echo "- Tìm tên rom" 
Linkrom=$(Laylink "https://") 
Tenrom=${Linkrom##*/} && Dinhdang=${Linkrom##*.}; 
echo "
Tên rom: $Tenrom 
Định dạng: $Dinhdang
"
echo "- Link Rom: $Linkrom"

echo "- Tải về" 
Taive "$Linkrom" "$TOME/$Tenrom" 
ls "$TOME/$Tenrom"

echo "- Giải nén rom" 
if [[ -s $TOME/$Tenrom ]]; then 
echo "- Kiểm tra định dạng"
[[ "$Dinhdang" == "zip" ]] && unzip -qo "$TOME/$Tenrom" -d "$TOME/Unzip"
[[ "$Dinhdang" == "tgz" ]] && tar -xf "$TOME/$Tenrom" -C "$TOME/Unzip"
[[ -s $TOME/Unzip/images/super.img ]] && mv -f $TOME/Unzip/images/super.img $TOME/Unzip/super.img 
ls $TOME/Unzip 
else echo "- Không có tập tin rom"
fi 

echo

#bash $TOME/.github/Unpack.sh
Unpack; 
bash $TOME/.github/Mod.sh
#Mod; 
#bash $TOME/.github/Debloat.sh
Debloat; 
#bash $TOME/.github/Repack.sh
Repack; 

cd $TOME/.github/lib/Flash_2in1
zip -qr $TOME/Up/ZH-UI_$Tenrom *

echo "- Kết thúc"

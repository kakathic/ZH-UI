echo "▶ Tên máy chủ"
uname -a
echo ::set-output name=uname::$(uname -a)
echo
echo "▶ Kiểm thử"

echo "- Cập nhật thư viện"
sudo apt-get update > /dev/null
sudo apt-get install curl zstd binutils e2fsprogs erofs-utils simg2img img2simg > /dev/null
pip3 install protobuf bsdiff4 six crypto construct google docopt pycryptodome > /dev/null

echo "pycryptodome
docopt
protobuf<=3.20.1" > requirements.txt
pip3 install -r requirements.txt > /dev/null

Likk="$GITHUB_WORKSPACE"
Danhsach="tmp
Unpack
Repapk
Unzip
Payload
Super
"
for Tao in $Danhsach; do
mkdir -p $Tao
done

echo "- Chuẩn bị"
Taive() { curl -s -L "$1" -o "$2"; }
Xem() { curl -s -L -G "$@"; }
Laylink() { grep -m1 "$1" $Likk/Zom_custom.md | cut -d = -f2; } 

echo "- Tìm tên rom" 
Linkrom=$(Laylink "https://") 
Tenrom=${Linkrom##*/} && Dinhdang=${Linkrom##*.}; 
echo "
Tên rom: $Tenrom 
Định dạng: $Dinhdang
"
echo "- Link Rom: $Linkrom"

echo "- Tải về" 
Taive "$Linkrom" "$Likk/$Tenrom" 
ls "$Likk/$Tenrom"

echo "- Giải nén rom" 
if [[ -s $Likk/$Tenrom ]]; then 
echo "- Kiểm tra định dạng"
[[ "$Dinhdang" == "zip" ]] && unzip -qo "$Likk/$Tenrom" -d "$Likk/Unzip"
[[ "$Dinhdang" == "tgz" ]] && tar -cf "$Likk/$Tenrom" -C "$Likk/Unzip"
[[ -s $Likk/Unzip/images/super.img ]] && mv -f $Likk/Unzip/images/super.img $Likk/Unzip/super.img 
ls $Likk/Unzip 
else echo "- Không có tập tin rom"
fi 

echo

. $Likk/Unpack.sh
. $Likk/Mod.sh
. $Likk/Repack.sh

echo "- Kết thúc"

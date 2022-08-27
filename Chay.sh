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
Laylink() { grep -m1 "$1" $Likk/Zom_custom.md | awk -F= '{print $2}'; } 

echo "- Tìm tên rom" 
Tenrom=$(grep -m1 "https://" $Likk/Zom_custom.md | awk -F/ '{print $5}') && Dinhdang=$(echo $Tenrom | awk -F. '{print $NF}');
echo "
Tên rom: $Tenrom 
Định dạng: $Dinhdang
"
echo "- Link Rom: $(Laylink "https://")"
echo "- Tải về"
# Taive "$(Laylink "https://")" "$Likk/$Tenrom" 
curl -s -L "$(Laylink "https://")" -o "$Likk/$Tenrom" 
echo "- Giải nén rom"
if [[ -s $Likk/$Tenrom ]]; then 
echo "- Kiểm tra định dạng"
[[ "$Dinhdang" == "zip" ]] && unzip -qo "$Likk/$Tenrom" -d "$Likk/Unzip"
[[ "$Dinhdang" == "tgz" ]] && tar -cf "$Likk/$Tenrom" -C "$Likk/Unzip"
[[ -s $Likk/Unzip/images/super.img ]] && mv -f $Likk/Unzip/images/super.img $Likk/Unzip/super.img 
else echo "- Không có tập tin rom"
fi 
echo "- Xong"

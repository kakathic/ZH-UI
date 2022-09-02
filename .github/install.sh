# kakathic

TOME="$GITHUB_WORKSPACE"

Taive() { curl -s -L "$1" -o "$2"; }
Xem(){ curl -s -L -G "$@"; }
Getpro() { grep -m1 "$1=" $TOME/Zom_custom.md | cut -d = -f2; }

ListTM="tmp
Unpack
Repapk
Unzip
Payload
Super
"

for Vak in $ListTM; do
mkdir -p $Vak
done

echo "
Tải file bổ sung..."

sudo apt-get update > /dev/null
sudo apt-get install zstd binutils e2fsprogs erofs-utils simg2img img2simg > /dev/null
pip3 install protobuf bsdiff4 six crypto construct google docopt pycryptodome > /dev/null

echo "pycryptodome
docopt
protobuf<=3.20.1" > requirements.txt
pip3 install -r requirements.txt > /dev/null

echo "
Tải rom..." 

Taive "$(Getpro Http)" "$TOME/rom.zip"
unzip -qo "$TOME/rom.zip" -d "$TOME/Unzip"
file "$TOME/rom.zip"

echo "
Tên máy chủ
"
uname -a
echo ::set-output name=uname::$(uname -a)
echo

. $TOME/.github/Unpack.sh
. $TOME/.github/Mod.sh
. $TOME/.github/Repack.sh

echo "- Kết thúc"

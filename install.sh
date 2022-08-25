# kakathic

Likk="$GITHUB_WORKSPACE"

Taive() { curl -s -L "$1" -o "$2"; }
Xem() { curl -s -L -G "$@"; }
Getpro() { grep -m1 "$1=" $Likk/Zom_custom.md | cut -d = -f2; }

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
Tải file bổ sung...
"

sudo apt-get update > /dev/null
sudo apt-get install zstd binutils e2fsprogs erofs-utils > /dev/null
pip3 install protobuf bsdiff4 six crypto construct google docopt pycryptodome > /dev/null

echo "pycryptodome
docopt
protobuf<=3.20.1" > requirements.txt
pip3 install -r requirements.txt > /dev/null



# Taive "$(Getpro Http)" "$Likk/rom.zip"
# unzip -qo "$Likk/rom.zip" -d "$Likk/Unzip"
# file "$Likk/rom.zip"

Taive "$(Getpro Http)" "$Likk/rom.ext" 
Hexf=$(hexdump -n 4 $Likk/rom.ext | cut -c 8-12);
[[ $Hexf = "4b50" ]] && unzip -qo "$Likk/rom.ext" -d "$Likk/Unzip" || tar -xf "$Likk/rom.ext" -C "$Likk/Unzip"
[[ -s $Likk/Unzip/images/super.img ]] && mv -f $Likk/Unzip/images/super.img $Likk/Unzip/super.img

echo "
Tên máy chủ
"
uname -a
echo ::set-output name=uname::$(uname -a)
echo

. $Likk/Unpack.sh
. $Likk/Mod.sh
. $Likk/Repack.sh

echo "- Kết thúc"

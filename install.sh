# kakathic

Likk="$GITHUB_WORKSPACE"

Taive(){ curl -s -L "$1" -o "$2"; }
Xem(){ curl -s -L -G "$@"; }
Getpro () { grep -m1 "$1=" $Likk/Zom_custom.md | cut -d = -f2; }

ListTM="tmp
Unpack
Repapk
Unzip
Payload
"

for Vak in $ListTM; do
mkdir -p $Vak
done


set PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION=python

echo "
Tải file bổ sung...
"

sudo apt-get update >/dev/null
sudo apt-get install zstd binutils e2fsprogs erofs-utils python3-pip >/dev/null
pip3 install protobuf bsdiff4 six crypto construct google docopt pycryptodome >/dev/null
pip install --upgrade pip

Taive "$(Getpro Http)" "$Likk/rom.zip"
unzip -qo "$Likk/rom.zip" -d "$Likk/Unzip"
ls "$Likk/Unzip"

echo "
Tên máy chủ
"
uname -a
echo ::set-output name=uname::$(uname -a)
echo

. $Likk/Unpack.sh
. $Likk/Mod.sh
. $Likk/Repack.sh

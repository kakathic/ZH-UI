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

echo "Tải file bổ sung..."
uname -a
echo ::set-output name=uname::$(uname -a)

sudo apt-get update >/dev/null
sudo apt-get install -y zstd binutils e2fsprogs android-sdk-ext4-utils >/dev/null
pip3 install protobuf bsdiff4 six crypto construct google docopt pycryptodome >/dev/null

#Taive "$(Getpro Http)" "$Likk/rom.zip"
#unzip -qo "$Likk/rom.zip" -d "$Likk/Unzip"
#ls "$Likk/Unzip"

. $Likk/Unpack.sh
. $Likk/Mod.sh
. $Likk/Repack.sh


dump.erofs
fsck.erofs

ls /bin >> bin.txt




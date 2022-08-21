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

pip3 install protobuf bsdiff4 six crypto construct google docopt pycryptodome >/dev/null
sudo apt-get install -y zstd binutils e2fsprogs erofs-utils android-sdk-ext4-utils >/dev/null
apt search android-sdk-ext4-utils
#Taive "$(Getpro Http)" "$Likk/rom.zip"
#unzip -qo "$Likk/rom.zip" -d "$Likk/Unzip"
#ls "$Likk/Unzip"

. $Likk/Unpack.sh
. $Likk/Mod.sh
. $Likk/Repack.sh

e2fsck | tee -a bin.txt
dump.erofs | tee -a bin.txt
fsck.erofs | tee -a bin.txt
make_ext4fs | tee -a bin.txt
mkfs.erofs | tee -a bin.txt
tune2fs | tee -a bin.txt
resize2fs | tee -a bin.txt
ls /bin | tee -a bin.txt




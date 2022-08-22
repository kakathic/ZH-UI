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
sudo apt-get install zstd binutils e2fsprogs erofs-utils >/dev/null
pip3 install protobuf bsdiff4 six crypto construct google docopt pycryptodome >/dev/null

#Taive "$(Getpro Http)" "$Likk/rom.zip"
#unzip -qo "$Likk/rom.zip" -d "$Likk/Unzip"
#ls "$Likk/Unzip"

. $Likk/Unpack.sh
. $Likk/Mod.sh
. $Likk/Repack.sh

fsck.erofs | tee -a $Likk/bin.txt
lpunpack | tee -a $Likk/bin.txt
lpmake | tee -a $Likk/bin.txt
lpadd | tee -a $Likk/bin.txt
lpdump | tee -a $Likk/bin.txt
lpflash | tee -a $Likk/bin.txt
make_ext4fs | tee -a $Likk/bin.txt
mkfs.erofs | tee -a $Likk/bin.txt
resize2fs | tee -a $Likk/bin.txt
tune2fs | tee -a $Likk/bin.txt
zstd | tee -a $Likk/bin.txt
brotli | tee -a $Likk/bin.txt
w_e2fsdroid | tee -a $Likk/bin.txt
w_lpmake | tee -a $Likk/bin.txt
w_mke2fs | tee -a $Likk/bin.txt

ls /bin >> $Likk/bin.txt




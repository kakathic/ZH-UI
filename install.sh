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
sudo apt-get install -y zstd binutils e2fsprogs >/dev/null
pip3 install protobuf bsdiff4 six crypto construct google docopt pycryptodome >/dev/null

#Taive "$(Getpro Http)" "$Likk/rom.zip"
#unzip -qo "$Likk/rom.zip" -d "$Likk/Unzip"
#ls "$Likk/Unzip"

. $Likk/Unpack.sh
. $Likk/Mod.sh
. $Likk/Repack.sh


dump.erofs 2>&1
fsck.erofs 2>&1
lpunpack 2>&1
lpmake 2>&1
lpadd 2>&1
lpdump 2>&1
lpflash 2>&1
make_ext4fs 2>&1
mkfs.erofs 2>&1
resize2fs 2>&1
tune2fs 2>&1
zstd 2>&1
brotli 2>&1
w_e2fsdroid 2>&1
w_lpmake 2>&1
w_mke2fs 2>&1

ls /bin > $Likk/bin.txt




echo "- Chạy thử nghiệm lệnh"
echo
TOME="$GITHUB_WORKSPACE"
sudo apt-get install curl zstd binutils e2fsprogs erofs-utils simg2img img2simg zipalign > /dev/null
chmod -R 777 $TOME/.github/bin
e2fsdroid=$TOME/.github/bin/e2fsdroid
make_ext4fs=$TOME/.github/bin/make_ext4fs
erofs=$TOME/.github/bin/extract.erofs
mkerofs=$TOME/.github/bin/mkfs.erofs
lpmake=$TOME/.github/bin/lpmake
make_super=$TOME/.github/bin/make_super
Ten=system
Tam=$TOME/tmp/tam
New=$TOME/$Ten
mkdir -p $Tam 
mkdir -p $New
Tenfc=$TOME/.github/${Ten}_file_contexts
SizeM=$((4*1024))M

echo "2"
$make_super



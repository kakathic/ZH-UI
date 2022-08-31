echo "- Chạy thử nghiệm lệnh"
echo

sudo apt-get update > /dev/null
sudo apt-get install zstd binutils e2fsprogs erofs-utils simg2img img2simg > /dev/null
pip3 install protobuf bsdiff4 six crypto construct google docopt pycryptodome > /dev/null

echo "pycryptodome
docopt
protobuf<=3.20.1" > requirements.txt
pip3 install -r requirements.txt > /dev/null

lpmake 
resize2fs
e2fsck
make_ext4fs
zstd --help 
hexdump --help
tune2fs
fsck.erofs
mkfs.erofs
7z
java 
simg2img | tee 1.txt
rimg2sdat | tee 1.txt
img2simg | tee 1.txt
sdat2img | tee 1.txt
mount --help | tee 1.txt

Likk="$GITHUB_WORKSPACE" 
echo " Thử ngiệm"
echo " Tạo nơi chứa"
mkdir -p $Likk/tmp
mkdir -p $Likk/Apk
mkdir -p $Likk/s
touch $Likk/Apk/test.txt
echo " Tạo ext4"
make_ext4fs -J -T 0 -l 64M -a system -L test $Likk/tmp/test.img $Likk/Apk
ls $Likk/tmp/test.img 
echo "Mount tập tin"
mount -w $Likk/tmp/test.img $Likk/s
sync 
echo "Kiểm tra thư mục"
ls $Likk/s
echo " Kết thúc"

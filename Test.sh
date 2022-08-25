echo "- Chạy thử nghiệm lệnh"
echo

sudo apt-get update > /dev/null
sudo apt-get install zstd binutils e2fsprogs erofs-utils > /dev/null
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
img2img
simg2img
sdat2img

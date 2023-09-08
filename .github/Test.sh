sudo rm -rf /usr/share/dotnet
sudo rm -rf /opt/ghc
sudo rm -rf "/usr/local/share/boost"
sudo rm -rf "$AGENT_TOOLSDIRECTORY"

export TOME="$GITHUB_WORKSPACE"
export PATH="$TOME/.github/bin:$PATH"
chmod -R 777 $TOME/.github/bin/* >/dev/null
chmod -R 777 $TOME/.github/*.sh >/dev/null
sed -i -e 's/\r$//' $TOME/.github/bin/Rebuild >/dev/null 

echo "▼ Tên máy chủ"
uname -a
echo

sudo apt-get update > /dev/null
sudo apt-get install curl zstd binutils e2fsprogs erofs-utils simg2img img2simg zipalign > /dev/null
pip3 install protobuf bsdiff4 six crypto construct google docopt pycryptodome > /dev/null

echo "pycryptodome
docopt
protobuf<=3.20.1" > requirements.txt
pip3 install -r requirements.txt > /dev/null

echo "- Chạy thử nghiệm lệnh"

TOME="$GITHUB_WORKSPACE"
$TOME/.github/bin/lpmake

echo "- Kết thúc" 

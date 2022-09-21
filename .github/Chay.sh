#kakathic & chamchamfy

export TOME="$GITHUB_WORKSPACE"

chmod -R 777 .github/bin/* >/dev/null
export PATH="$TOME/.github/bin:$PATH"
chmod -R 777 .github/*.sh >/dev/null

echo "▼ Tên máy chủ"
uname -a
echo ::set-output name=uname::$(uname -a)
echo

sudo apt-get update > /dev/null
sudo apt-get install curl zstd binutils e2fsprogs erofs-utils simg2img img2simg zipalign > /dev/null
pip3 install protobuf bsdiff4 six crypto construct google docopt pycryptodome > /dev/null

echo "pycryptodome
docopt
protobuf<=3.20.1" > requirements.txt
pip3 install -r requirements.txt > /dev/null

Danhsach="tmp
Unpack
Repack
Unzip
Payload
Super
Apk
Mod/tmp
VH
Up"
for Tao in $Danhsach; do
mkdir -p $Tao
done


User="User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101 Firefox/102.0"
Taive() { curl -s -L -H "$User" "$1" -o "$2"; }
Xem() { curl -s -L -G -H "$User" "$@"; }

Tenrom=${URL##*/} && Tenr=${Tenrom%.*} && Dinhdang=${URL##*.}; 
echo "- Link Rom: $URL"
echo "
- Tên rom: $Tenrom 
- Định dạng: $Dinhdang
"
echo "TENZ=$Tenrom" >> $GITHUB_ENV

echo "- Tải về" 
Taive "$URL" "$TOME/$Tenrom" 

echo "- Giải nén rom" 
if [[ -s $TOME/$Tenrom ]]; then 
[[ "$Dinhdang" == "zip" ]] && unzip -qo "$TOME/$Tenrom" -d "$TOME/Unzip"
[[ "$Dinhdang" == "tgz" ]] && tar -xf "$TOME/$Tenrom" -C "$TOME/Unzip"
[[ -s $TOME/Unzip/images/super.img ]] && mv -f $TOME/Unzip/images/super.img $TOME/Unzip/super.img 
ls $TOME/Unzip 
else echo "- Không có tập tin rom"
fi 

echo

#. $TOME/.github/Unpack.sh
Unpack; 
. $TOME/.github/Mod.sh
#Mod; 
#. $TOME/.github/Debloat.sh
Debloat; 
#. $TOME/.github/Repack.sh
Repack; 

echo "- Kết thúc"

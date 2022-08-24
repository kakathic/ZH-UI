# Loại phân vùng (1,2,3) 
sokhe=1

# Tên nhóm
nhom=main

# Chế độ (none/readonly)
chedo=none

# Kích cỡ phân vùng super 8.5GB
ssize=8.5

# Tạo super.img
taosuper() { lpmake -d "$super_raw_size" -s "$sokhe" -m 65536 -g "$nhom":"$super_size" --super-name super -p system:"$chedo":"$size_system":"$nhom" -i system=system.img -p system_ext:"$chedo":"$size_system_ext":"$nhom" -i system_ext=system_ext.img -p vendor:"$chedo":"$size_vendor":"$nhom" -i vendor=vendor.img -p product:"$chedo":"$size_product":"$nhom" -i product=product.img -p odm:"$chedo":"$size_odm":"$nhom" -i odm=odm.img -o $Likk/super.img; } 

# Kiểm tra kích cỡ và tạo super.img 
giamthieu() { resize2fs -f -M $Likk/Super/$TEN.img > /dev/null 2>&1 && resize2fs -f -M $Likk/Super/$TEN.img > /dev/null 2>&1; } 

tangkichco() { resize2fs -f $Likk/Super/$TEN.img $(expr size_$TEN * 1024 + 200)M > /dev/null 2>&1; } 

cd $Likk/Super 
for EXT in system.img vendor.img product.img system_ext.img odm.img; do 
TEN=$(echo $EXT | awk -F. '{print $1}'); 
size_$TEN=$(wc -c < $Likk/Super/$TEN.img);
[ -s $Likk/Super/$EXT ] && giamthieu
done 

for EXT in system.img vendor.img system_ext.img; do 
TEN=$(echo $EXT | awk -F. '{print $1}'); 
size_$TEN=$(wc -c < $Likk/Super/$TEN.img);
[ -s $Likk/Super/$EXT ] && tangkichco 
done 

super_size=$(ls -l $Likk/Super | sed -n 1p | awk '{print int($2)}'); 
super_raw_size=$(awk "BEGIN {print int($ssize*1024*1024*1024)}"); 

if [ "$super_size" -lt "$super_raw_size" ]; then 
taosuper
else 
cd $Likk/Super
for EXT in system.img vendor.img product.img system_ext.img odm.img; do 
TEN=$(echo $EXT | awk -F. '{print $1}'); 
size_$TEN=$(wc -c < $Likk/Super/$TEN.img);
[ -s $Likk/Super/$EXT ] && giamthieu 
done 
super_raw_size=$(awk "BEGIN {print int($ssize*1024*1024*1024)}"); 
taosuper
fi 

# Phiên bản rom
ten=$(grep 'incremental' $Likk/Unzip/*/*/*/metadata | awk -F= '{print $2}'); 
mamay=$(grep 'pre-device' $Likk/Unzip/*/*/*/metadata | awk -F= '{print $2}'); 

# Tạo zip flash 
sed -i "s|Device:|Device: $mamay|; s|ROM: MIUI|ROM: MIUI $ten|" $Likk/Lib/Flash_2in1/*/*/*/update-binary 
if [ -s $Likk/super.img ]; then 
zstd -10 $Likk/super.img -o $Likk/Lib/images/super.img.zst 
# rm -f $Likk/Payload/vbmeta.img vbmeta_system.img 2> /dev/null 
mv -f $Likk/Payload/* $Likk/Lib/images 
cd $Likk/Lib
zip -9qr $Likk/Rom_2in1_${mamay}_${ten}.zip * 
[ -s $Likk/Rom_2in1_${mamay}_${ten}.zip ] && echo " + Tạo xong"; 
fi 

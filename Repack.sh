# Tính kích cỡ từng tập tin 
system_size=$(Xemb $Likk/Super/system.img)
system_ext_size=$(Xemb $Likk/Super/system_ext.img)
vendor_size=$(Xemb $Likk/Super/vendor.img)
product_size=$(Xemb $Likk/Super/product.img)
odm_size=$(Xemb $Likk/Super/odm.img)

# Tính tổng kích cỡ thư mục super 
kichcosuper() { super_size=$(ls -l $Likk/Super | sed -n 1p | awk '{print int($2)}'); } 

# Tính kích cỡ phân vùng super 8.5GB
ssize=8.5
super_raw_size=$(awk "BEGIN {print int($ssize*1024*1024*1024)}"); 

# Loại phân vùng (1,2,3) 
sokhe=1

# Tên nhóm
nhom=main

# Chế độ (none/readonly)
chedo=none

# Tạo super.img
taosuper() { lpmake -d "$super_raw_size" -s "$sokhe" -m 65536 -g "$nhom":"$super_size" --super-name super -p system:"$chedo":"$system_size":"$nhom" -i system=system.img -p system_ext:"$chedo":"$system_ext_size":"$nhom" -i system_ext=system_ext.img -p vendor:"$chedo":"$vendor_size":"$nhom" -i vendor=vendor.img -p product:"$chedo":"$product_size":"$nhom" -i product=product.img -p odm:"$chedo":"$odm_size":"$nhom" -i odm=odm.img -o $Likk/super.img; } 

giamthieu() { resize2fs -f -M $Likk/Super/$EXT.img > /dev/null 2>&1 && resize2fs -f -M $Likk/Super/$EXT.img > /dev/null 2>&1; } 

tangkichco() { resize2fs -f $Likk/Super/$EXT.img $(expr ($EXT * 1024 + 200)M > /dev/null 2>&1; } 

# Kiểm tra kích cỡ và tạo super.img 
cd $Likk/Super
for EXT in system.img vendor.img product.img system_ext.img odm.img; do 
[ -s $Likk/Super/$EXT ] && giamthieu
done 
for EXT in system.img vendor.img system_ext.img; do 
[ -s $Likk/Super/$EXT ] && tangkichco 
done 
kichcosuper 

if [ "$super_size" -lt "$super_raw_size" ]; then 
taosuper
else 
cd $Likk/Super
for EXT in system.img vendor.img product.img system_ext.img odm.img; do 
[ -s $Likk/Super/$EXT ] && giamthieu
done 
kichcosuper
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

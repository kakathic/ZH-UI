echo " + Kiểm tra kích cỡ super..." 
cd $Likk/Super 

# Loại phân vùng (1,2,3) 
Sokhe=1

# Tên nhóm
Nhom=main

# Chế độ (none/readonly)
Chedo=none

# Kích cỡ phân vùng super 8.5GB
Ssize=8.5

# Kiểm tra kích cỡ 
tongkichco() { Ssuper="$(ls -l $Likk/Super | sed -n 1p | awk '{print int($2)}')" 2> /dev/null; } 

kichcosuper() { Ssuperr="$(awk "BEGIN {print int($Ssize*1024*1024*1024)}")" 2> /dev/null; } 

kichco() { Ssystem=$(wc -c < $Likk/Super/system.img); Ssystem_ext=$(wc -c < $Likk/Super/system_ext.img); Svendor=$(wc -c < $Likk/Super/vendor.img); Sproduct=$(wc -c < $Likk/Super/product.img); Sodm=$(wc -c < $Likk/Super/odm.img); } 

giamthieu() { for EXT in system.img vendor.img product.img system_ext.img odm.img; do [ -s $Likk/Super/$EXT ] && resize2fs -f -M $Likk/Super/$EXT > /dev/null 2>&1 && resize2fs -f -M $Likk/Super/$EXT > /dev/null 2>&1; done; } 
 
tangkichco() { for EXT in system.img vendor.img product.img system_ext.img odm.img; do [ -s $Likk/Super/$EXT ] && resize2fs -f $Likk/Super/$EXT $(awk "BEGIN {print int($(wc -c < $Likk/Super/$EXT)*1024+200)}")M > /dev/null 2>&1; done; } 

echo " + Tạo super.img..." 
taosuper() { lpmake -d "$Ssuperr" -s "$Sokhe" -m 65536 -g "$Nhom":"$Ssuper" -n super -p system:"$Chedo":"$Ssystem":"$Nhom" -i system=system.img -p system_ext:"$Chedo":"$Ssystem_ext":"$Nhom" -i system_ext=system_ext.img -p vendor:"$Chedo":"$Svendor":"$Nhom" -i vendor=vendor.img -p product:"$Chedo":"$Sproduct":"$Nhom" -i product=product.img -p odm:"$Shedo":"$Sodm":"$Nhom" -i odm=odm.img -o $Likk/super.img; } 

kichcosuper && giamthieu && tangkichco && kichco && tongkichco 

if [[ "$Ssuper" -lt "$Ssuperr" ]]; then taosuper; else giamthieu && kichco && tongkichco && taosuper; fi 

# Phiên bản rom
Ten=$(grep 'incremental' $Likk/Unzip/*/*/*/metadata | awk -F= '{print $2}'); 
Mamay=$(grep 'pre-device' $Likk/Unzip/*/*/*/metadata | awk -F= '{print $2}'); 

echo " + Tạo zip flash..." 
sed -i "s|Device:|Device: $Mamay|; s|ROM: MIUI|ROM: MIUI $Ten|" $Likk/Lib/Flash_2in1/*/*/*/*/update-binary 2> /dev/null 
if [ -s $Likk/super.img ]; then 
zstd -10 $Likk/super.img -o $Likk/Lib/images/super.img.zst 
# rm -f $Likk/Payload/vbmeta.img vbmeta_system.img 2> /dev/null 
mv -f $Likk/Payload/* $Likk/Lib/images 
cd $Likk/Lib
zip -9qr $Likk/Rom_2in1_${mamay}_${ten}.zip * 
[ -s $Likk/Rom_2in1_${Mamay}_${Ten}.zip ] && echo " + Tạo xong"; 
fi 

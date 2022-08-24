echo " + Tạo super..." 
cd $Likk/Super 

# Loại phân vùng (1,2,3) 
Sokhe=1

# Tên nhóm
Nhom=main

# Chế độ (none/readonly)
Chedo=none

# Kích cỡ phân vùng super 8.5GB
Ssize=8.5

# Tạo super.img
taosuper() { lpmake -d "$Ssuperr" -s "$Sokhe" -m 65536 -g "$Nhom":"$Ssuper" --super-name super -p system:"$Chedo":"$Ssystem":"$Nhom" -i system=system.img -p system_ext:"$Chedo":"$Ssystem_ext":"$Nhom" -i system_ext=system_ext.img -p vendor:"$Chedo":"$Svendor":"$Nhom" -i vendor=vendor.img -p product:"$Chedo":"$Sproduct":"$Nhom" -i product=product.img -p odm:"$Shedo":"$Sodm":"$Nhom" -i odm=odm.img -o $Likk/super.img; } 

# Kiểm tra kích cỡ và tạo super.img 
tongkichco() { Ssuper="$(ls -l $Likk/Super | sed -n 1p | awk '{print int($2)}')" > $Likk/tmp/super_size.txt; } 

kichcosuper() { Ssuperr="$(awk "BEGIN {print int($Ssize*1024*1024*1024)}")" > $Likk/tmp/super_raw_size.txt; } 

kichco() { for EXT in system.img vendor.img product.img system_ext.img odm.img; do [ -s $Likk/Super/$EXT ] && TEN=$(echo $EXT | awk -F. '{print $1}') && S${TEN}=$(wc -c < $Likk/Super/$TEN.img) > $Likk/tmp/${TEN}_size.txt; done; } 

giamthieu() { for EXT in system.img vendor.img product.img system_ext.img odm.img; do [ -s $Likk/Super/$EXT ] && resize2fs -f -M $Likk/Super/$EXT > /dev/null 2>&1 && resize2fs -f -M $Likk/Super/$EXT > /dev/null 2>&1; done; } 
 
tangkichco() { for EXT in system.img vendor.img product.img system_ext.img odm.img; do [ -s $Likk/Super/$EXT ] && TEN=$(echo $EXT | awk -F. '{print $1}') && S${TEN}=$(wc -c < $Likk/Super/$TEN.img) > $Likk/tmp/${TEN}_size.txt && resize2fs -f $Likk/Super/$TEN.img $(expr "$S${TEN}" * 1024 + 200)M > /dev/null 2>&1; done; } 

kichcosuper && giamthieu && tangkichco && kichco && tongkichco 

if [[ "$Ssuper" -lt "$Ssuperr" ]]; then taosuper; else giamthieu && kichco && tongkichco && taosuper; fi 

# Phiên bản rom
Ten=$(grep 'incremental' $Likk/Unzip/*/*/*/metadata | awk -F= '{print $2}'); 
Mamay=$(grep 'pre-device' $Likk/Unzip/*/*/*/metadata | awk -F= '{print $2}'); 

# Tạo zip flash 
sed -i "s|Device:|Device: $Mamay|; s|ROM: MIUI|ROM: MIUI $Ten|" $Likk/Lib/Flash_2in1/*/*/*/*/update-binary 
if [ -s $Likk/super.img ]; then 
zstd -10 $Likk/super.img -o $Likk/Lib/images/super.img.zst 
# rm -f $Likk/Payload/vbmeta.img vbmeta_system.img 2> /dev/null 
mv -f $Likk/Payload/* $Likk/Lib/images 
cd $Likk/Lib
zip -9qr $Likk/Rom_2in1_${mamay}_${ten}.zip * 
[ -s $Likk/Rom_2in1_${Mamay}_${Ten}.zip ] && echo " + Tạo xong"; 
fi 

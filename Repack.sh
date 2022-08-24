# Tính kích cỡ từng tập tin 
system_size=$(Xemb $Likk/Super/system.img)
system_ext_size=$(Xemb $Likk/Super/system_ext.img)
vendor_size=$(Xemb $Likk/Super/vendor.img)
product_size=$(Xemb $Likk/Super/product.img)
odm_size=$(Xemb $Likk/Super/odm.img)

# Tính tổng kích cỡ thư mục super 
super_size=$(ls -l $Likk/Super | sed -n 1p | awk '{print int($2)}'); 

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
lpmake -d "$super_raw_size" -s "$sokhe" -m 65536 -g "$nhom":"$super_size" --super-name super -p system:"$chedo":"$system_size":"$nhom" -i system=system.img -p system_ext:"$chedo":"$system_ext_size":"$nhom" -i system_ext=system_ext.img -p vendor:"$chedo":"$vendor_size":"$nhom" -i vendor=vendor.img -p product:"$chedo":"$product_size":"$nhom" -i product=product.img -p odm:"$chedo":"$odm_size":"$nhom" -i odm=odm.img -o $Likk/super.img

# Phiên bản rom
ten=$(grep 'incremental' $Likk/Unzip/*/*/*/metadata | awk -F= '{print $2}'); 
mamay=$(grep 'pre-device' $Likk/Unzip/*/*/*/metadata | awk -F= '{print $2}'); 

# Cập nhật zip flash
mkdir -p $Likk/tmp
unzip -qo $Likk/Lib/Flash_2in1.zip -d $Likk/tmp 
sed -i "s|Device:|Device: $mamay|; s|ROM : MIUI China|ROM: MIUI $ten|" $Likk/tmp/*/*/*/update-binary 
[ -s $Likk/super.img ] && zstd -10 $Likk/super.img -o $Likk/tmp/images/super.img.zst 
# rm -f $Likk/Payload/vbmeta.img vbmeta_system.img 2> /dev/null 
mv -f $Likk/Payload/* $Likk/tmp/images 
cd $Likk/tmp 
zip -9qr $Likk/Rom_2in1_${mamay}_${ten}.zip * 

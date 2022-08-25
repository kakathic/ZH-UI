echo " + Kiểm tra kích cỡ super..." 
cd $Likk/Super 

# Loại phân vùng (1,2,3) 
Sokhe=1

# Tên nhóm
Nhom=main

# Khe 
Khe= 

# Chế độ (none/readonly)
Chedo=none

# Kích cỡ phân vùng super 8.5GB
Ssize=8.5

# Kiểm tra kích cỡ 
kichcosuper() { Ssuperr=$(echo $Ssize | awk '{print int($Ssize*1024*1024*1024)}'); } 

kichco() { Ssystem=$(wc -c < $Likk/Super/system${Khe}.img); Ssystem_ext=$(wc -c < $Likk/Super/system_ext${Khe}.img); Svendor=$(wc -c < $Likk/Super/vendor${Khe}.img); Sproduct=$(wc -c < $Likk/Super/product${Khe}.img); Sodm=$(wc -c < $Likk/Super/odm.img); } 

tongkichco() { Ssuper=$(ls -l $Likk/Super | awk '{Ssuper+=$5} END {print Ssuper}'); } 

giamthieu() { for EXT in system${Khe}.img vendor${Khe}.img product${Khe}.img system_ext${Khe}.img odm.img; do [ -s $Likk/Super/$EXT ] && resize2fs -f -M $Likk/Super/$EXT > /dev/null 2>&1 && resize2fs -f -M $Likk/Super/$EXT > /dev/null 2>&1; done; } 
 
tangkichco() { for EXT in system${Khe}.img vendor${Khe}.img product${Khe}.img system_ext${Khe}.img; do [ -s $Likk/Super/$EXT ] && Size=$(echo "$(wc -c < $Likk/Super/$EXT)" | awk '{print int($TEN*1024+200)}') && resize2fs -f $Likk/Super/$EXT ${Size}M > /dev/null 2>&1; done; } 

ghidoc() { for EXT in system${Khe}.img vendor${Khe}.img product${Khe}.img system_ext${Khe}.img odm.img; do [ -s $Likk/Super/$EXT ] && e2fsck -y -E unshare_blocks $Likk/Super/$EXT > /dev/null 2>&1; done; } 

echo " + Tạo super.img..." 
taosuper() { lpmake --device-size "$Ssuperr" --metadata-slots "$Sokhe" --metadata-size 65536 --group "$Nhom":"$Ssuper" --super-name super --partition system${Khe}:"$Chedo":"$Ssystem":"$Nhom" --image system${Khe}=system${Khe}.img --partition system_ext${Khe}:"$Chedo":"$Ssystem_ext":"$Nhom" --image system_ext${Khe}=system_ext${Khe}.img --partition vendor${Khe}:"$Chedo":"$Svendor":"$Nhom" --image vendor${Khe}=vendor${Khe}.img --partition product${Khe}:"$Chedo":"$Sproduct":"$Nhom" --image product${Khe}=product${Khe}.img --partition odm${Khe}:"$Chedo":"$Sodm":"$Nhom" --image odm${Khe}=odm${Khe}.img -o $Likk/tmp/super.img > /dev/null 2>&1; } 

kichcosuper && echo " Kích cỡ phân vùng super: $Ssuperr" 
#giamthieu && tangkichco 
kichco && echo " Kích cỡ system: $Ssystem system_ext: $Ssystem_ext vendor: $Svendor product: $Sproduct odm: $Sodm" 
tongkichco && echo " Kích cỡ tổng super: $Ssuper"
taosuper

# if [[ "$Ssuper" -lt "$Ssuperr" ]]; then taosuper; else giamthieu && kichco && tongkichco && echo " Kích cỡ tổng super: $Ssuper" && taosuper; fi 

# Phiên bản rom
Ten=$(grep 'incremental' $Likk/Unzip/*/*/*/metadata | awk -F= '{print $2}'); 
Mamay=$(grep 'pre-device' $Likk/Unzip/*/*/*/metadata | awk -F= '{print $2}'); 

echo " + Tạo zip flash..." 
sed -i "s|Device:|Device: $Mamay|; s|ROM: MIUI|ROM: MIUI $Ten|" $Likk/Lib/Flash_2in1/*/*/*/*/update-binary 2> /dev/null 
if [ -s $Likk/tmp/super.img ]; then 
zstd -10 $Likk/tmp/super.img -o $Likk/Lib/Flash_2in1/images/super.img.zst 
# rm -f $Likk/Payload/vbmeta.img vbmeta_system${Khe}.img 2> /dev/null 
mv -f $Likk/Payload/* $Likk/Lib/Flash_2in1/images 
#cd $Likk/Lib/Flash_2in1
#zip -9qr $Likk/Rom_2in1_${mamay}_${ten}.zip * 
#[ -s $Likk/Rom_2in1_${Mamay}_${Ten}.zip ] && echo " + Tạo xong"; 
fi 

echo " + Kiểm tra thông tin super..." 
cd $Likk/Super 
# Phiên bản rom
if [[ -f $Likk/Unzip/META-INF/com/android/metadata ]]; then 
Phienban=$(grep 'incremental' $Likk/Unzip/*/*/*/metadata | awk -F= '{print $2}'); 
Mamay=$(grep 'pre-device' $Likk/Unzip/*/*/*/metadata | awk -F= '{print $2}'); 
Loai=$(grep 'ota-type' $Likk/Unzip/*/*/*/metadata | awk -F= '{print $2}'); 
fi 

# Chế độ (none/readonly)
Chedo=none

# Kích cỡ phân vùng super 8.5GB
Ssize=$(grep -m1 "super_size" $Likk/Zom_custom.md | awk -F= '{print $2}')

# Kiểm tra kích cỡ 
kichcosuper() { Ssuperr=$(echo $Ssize | awk '{print int($Ssize*1024*1024*1024)}'); } 

kichco() { Ssystem=$(wc -c < $Likk/Super/system${Khe}.img); Ssystem_ext=$(wc -c < $Likk/Super/system_ext${Khe}.img); Svendor=$(wc -c < $Likk/Super/vendor${Khe}.img); Sproduct=$(wc -c < $Likk/Super/product${Khe}.img); Sodm=$(wc -c < $Likk/Super/odm${Khe}.img); } 

tongkichco() { Ssuper=$(ls -l $Likk/Super | awk '{Ssuper+=$5} END {print Ssuper}'); } 


# Loại phân vùng 
if [[ -f $Likk/Payload/modem.img ]] || [[ -f $Likk/Unzip/images/modem.img ]] || [[ -f $Likk/Unzip/firmware-update/modem.img ]]; then 
for n in system_b.img system_ext_b.img vendor_b.img product_b.img odm_b.img; do touch $Likk/Super/$n 2> /dev/null; done 
for i in system.img system_ext.img vendor.img product.img odm.img; do mv -f $Likk/Super/$i $Likk/Super/${i//./_a.} 2> /dev/null; done 
Khe="_a"
Sokhe=3
Nhom="qti_dynamic_partitions_a"
kichcosuper
Nhomkhac="--group qti_dynamic_partitions_b:$Ssuperr --partition system_b:none:0:qti_dynamic_partitions_b --image system_b=system_b.img --partition system_ext_b:none:0:qti_dynamic_partitions_b --image system_ext_b=system_ext_b.img --partition vendor_b:none:0:qti_dynamic_partitions_b --image vendor_b=vendor_b.img --partition product_b:none:0:qti_dynamic_partitions_b --image product_b=product_b.img --partition odm_b:none:0:qti_dynamic_partitions_b --image odm_b=odm_b.img"
else 
Khe= 
Sokhe=1
Nhom="main" 
Nhomkhac= 
fi 

# Tùy chỉnh kích cỡ 
giamthieu() { for EXT in system${Khe}.img vendor${Khe}.img product${Khe}.img system_ext${Khe}.img odm${Khe}.img; do [[ -s $Likk/Super/$EXT ]] && resize2fs -f -M $Likk/Super/$EXT > /dev/null 2>&1 && resize2fs -f -M $Likk/Super/$EXT > /dev/null 2>&1; done; } 
 
tangkichco() { for EXT in system${Khe}.img vendor${Khe}.img product${Khe}.img system_ext${Khe}.img; do [[ -s $Likk/Super/$EXT ]] && Size=$(echo "$(wc -c < $Likk/Super/$EXT)" | awk '{print int($TEN*1024+200)}') && resize2fs -f $Likk/Super/$EXT ${Size}M > /dev/null 2>&1; done; } 

ghidoc() { for EXT in system${Khe}.img vendor${Khe}.img product${Khe}.img system_ext${Khe}.img odm${Khe}.img; do [[ -s $Likk/Super/$EXT ]] && e2fsck -y -E unshare_blocks $Likk/Super/$EXT > /dev/null 2>&1; done; } 

echo " + Tạo super.img..." 
taosuper() { lpmake --device super:"$Ssuperr" --metadata-slots "$Sokhe" --metadata-size 65536 --super-name super --group "$Nhom":"$Ssuperr" --partition system${Khe}:"$Chedo":"$Ssystem":"$Nhom" --image system${Khe}=system${Khe}.img --partition system_ext${Khe}:"$Chedo":"$Ssystem_ext":"$Nhom" --image system_ext${Khe}=system_ext${Khe}.img --partition vendor${Khe}:"$Chedo":"$Svendor":"$Nhom" --image vendor${Khe}=vendor${Khe}.img --partition product${Khe}:"$Chedo":"$Sproduct":"$Nhom" --image product${Khe}=product${Khe}.img --partition odm${Khe}:"$Chedo":"$Sodm":"$Nhom" --image odm${Khe}=odm${Khe}.img $Nhomkhac -o $Likk/tmp/super.img > /dev/null 2>&1; } 

kichcosuper && echo " Kích cỡ phân vùng super: $Ssuperr" 
giamthieu && tangkichco && ghidoc 
kichco && echo " Kích cỡ từng phân vùng: 
 - system$Khe: $Ssystem 
 - system_ext$Khe: $Ssystem_ext 
 - vendor$Khe: $Svendor 
 - product$Khe: $Sproduct 
 - odm$Khe: $Sodm" 
tongkichco
echo "--device super:"$Ssuperr" --metadata-slots "$Sokhe" --metadata-size 65536 --super-name super --group "$Nhom":"$Ssuperr" --partition system${Khe}:"$Chedo":"$Ssystem":"$Nhom" --image system${Khe}=system${Khe}.img --partition system_ext${Khe}:"$Chedo":"$Ssystem_ext":"$Nhom" --image system_ext${Khe}=system_ext${Khe}.img --partition vendor${Khe}:"$Chedo":"$Svendor":"$Nhom" --image vendor${Khe}=vendor${Khe}.img --partition product${Khe}:"$Chedo":"$Sproduct":"$Nhom" --image product${Khe}=product${Khe}.img --partition odm${Khe}:"$Chedo":"$Sodm":"$Nhom" --image odm${Khe}=odm${Khe}.img $Nhomkhac"

if [[ "$Ssuper" -lt "$Ssuperr" ]]; then echo " Kích cỡ tổng super: $Ssuper" && taosuper; else echo " Tổng kích cỡ lớn hơn kích cỡ phân vùng" && giamthieu && ghidoc && kichco && tongkichco && echo " Kích cỡ tổng super: $Ssuper" && taosuper; fi 

echo " + Tạo tập tin flash..." 
if [[ "$Khe" == "_a" ]]; then rm -f $Likk/Lib/Flash_2in1/windows_install.bat $Likk/Lib/Flash_2in1/mac_or_linux_install.sh 2> /dev/null; else rm -f $Likk/Lib/Flash_2in1/windows_install_ab.bat $Likk/Lib/Flash_2in1/mac_or_linux_install_ab.sh 2> /dev/null; fi 
sed -i "s|Device:|Device: $Mamay|; s|ROM: MIUI|ROM: MIUI $Phienban|" $Likk/Lib/Flash_2in1/*/*/*/*/update-binary 2> /dev/null 
if [[ -s $Likk/tmp/super.img ]]; then 
zstd -10 $Likk/tmp/super.img -o $Likk/Lib/Flash_2in1/images/super.img.zst 
# rm -f $Likk/Payload/vbmeta.img vbmeta_system.img 2> /dev/null 
[[ -n "$(ls $Likk/Payload)" ]] && mv -f $Likk/Payload/* $Likk/Lib/Flash_2in1/images 
[[ -d $Likk/Unzip/images ]] && [[ -n "$(ls $Likk/Unzip/images)" ]] && mv -f $Likk/Unzip/images/* $Likk/Lib/Flash_2in1/images 
[[ -d $Likk/Unzip/firmware-update ]] && [[ -n "$(ls $Likk/Unzip/firmware-update)" ]] && mv -f $Likk/Unzip/firmware-update/* $Likk/Lib/Flash_2in1/images 
[[ -s $Likk/Lib/Flash_2in1/images/super.img.zst ]] && echo " + Tạo xong"; 
fi 

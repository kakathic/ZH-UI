#chamchamfy
echo " + Kiểm tra thông tin super..." 
cd $TOME/Super 
# Phiên bản rom
if [[ -f $TOME/Unzip/META-INF/com/android/metadata ]]; then 
Phienban=$(grep 'incremental' $TOME/Unzip/*/*/*/metadata | awk -F= '{print $2}'); 
Mamay=$(grep 'pre-device' $TOME/Unzip/*/*/*/metadata | awk -F= '{print $2}'); 
Loai=$(grep 'ota-type' $TOME/Unzip/*/*/*/metadata | awk -F= '{print $2}'); 
fi 

# Chế độ (none/readonly)
Chedo=none

# Kích cỡ phân vùng super 8.5GB
Ssize=$(grep -m1 "super_size" $TOME/Zom_custom.md | awk -F= '{print $2}')

# Kiểm tra kích cỡ 
kichcosuper() { Ssuperr=$(echo $Ssize | awk '{print int($Ssize*1024*1024*1024)}'); } 

kichco() { Ssystem=$(wc -c < $TOME/Super/system${Khe}.img); Ssystem_ext=$(wc -c < $TOME/Super/system_ext${Khe}.img); Svendor=$(wc -c < $TOME/Super/vendor${Khe}.img); Sproduct=$(wc -c < $TOME/Super/product${Khe}.img); Sodm=$(wc -c < $TOME/Super/odm${Khe}.img); } 

tongkichco() { Ssuper=$(ls -l $TOME/Super | awk '{Ssuper+=$5} END {print Ssuper}'); } 


# Loại phân vùng 
if [[ -f $TOME/Payload/modem.img ]] || [[ -f $TOME/Unzip/images/modem.img ]] || [[ -f $TOME/Unzip/firmware-update/modem.img ]]; then 
for n in system_b.img system_ext_b.img vendor_b.img product_b.img odm_b.img; do touch $TOME/Super/$n 2> /dev/null; done 
for i in system.img system_ext.img vendor.img product.img odm.img; do mv -f $TOME/Super/$i $TOME/Super/${i//./_a.} 2> /dev/null; done 
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
giamthieu() { for EXT in system${Khe}.img vendor${Khe}.img product${Khe}.img system_ext${Khe}.img odm${Khe}.img; do [[ -s $TOME/Super/$EXT ]] && resize2fs -f -M $TOME/Super/$EXT > /dev/null 2>&1 && resize2fs -f -M $TOME/Super/$EXT > /dev/null 2>&1; done; } 
 
tangkichco() { for EXT in system${Khe}.img vendor${Khe}.img product${Khe}.img system_ext${Khe}.img; do [[ -s $TOME/Super/$EXT ]] && Size=$(echo "$(wc -c < $TOME/Super/$EXT)" | awk '{print int($TEN*1024+200)}') && resize2fs -f $TOME/Super/$EXT ${Size}M > /dev/null 2>&1; done; } 

ghidoc() { for EXT in system${Khe}.img vendor${Khe}.img product${Khe}.img system_ext${Khe}.img odm${Khe}.img; do [[ -s $TOME/Super/$EXT ]] && e2fsck -y -E unshare_blocks $TOME/Super/$EXT > /dev/null 2>&1; done; } 

echo " + Tạo super.img..." 
taosuper() { lpmake --device super:"$Ssuperr" --metadata-slots "$Sokhe" --metadata-size 65536 --super-name super --group "$Nhom":"$Ssuperr" --partition system${Khe}:"$Chedo":"$Ssystem":"$Nhom" --image system${Khe}=system${Khe}.img --partition system_ext${Khe}:"$Chedo":"$Ssystem_ext":"$Nhom" --image system_ext${Khe}=system_ext${Khe}.img --partition vendor${Khe}:"$Chedo":"$Svendor":"$Nhom" --image vendor${Khe}=vendor${Khe}.img --partition product${Khe}:"$Chedo":"$Sproduct":"$Nhom" --image product${Khe}=product${Khe}.img --partition odm${Khe}:"$Chedo":"$Sodm":"$Nhom" --image odm${Khe}=odm${Khe}.img $Nhomkhac -o $TOME/tmp/super.img > /dev/null 2>&1; } 

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
if [[ "$Khe" == "_a" ]]; then rm -f $TOME/.github/lib/Flash_2in1/windows_install.bat $TOME/.github/lib/Flash_2in1/mac_or_linux_install.sh 2> /dev/null; else rm -f $TOME/.github/lib/Flash_2in1/windows_install_ab.bat $TOME/.github/lib/Flash_2in1/mac_or_linux_install_ab.sh 2> /dev/null; fi 
sed -i "s|Device:|Device: $Mamay|; s|ROM: MIUI|ROM: MIUI $Phienban|" $TOME/.github/lib/Flash_2in1/*/*/*/*/update-binary 2> /dev/null 
if [[ -s $TOME/tmp/super.img ]]; then 
zstd -10 $TOME/tmp/super.img -o $TOME/.github/lib/Flash_2in1/images/super.img.zst 
# rm -f $TOME/Payload/vbmeta.img vbmeta_system.img 2> /dev/null 
[[ -n "$(ls $TOME/Payload)" ]] && mv -f $TOME/Payload/* $TOME/.github/lib/Flash_2in1/images 
[[ -d $TOME/Unzip/images ]] && [[ -n "$(ls $TOME/Unzip/images)" ]] && mv -f $TOME/Unzip/images/* $TOME/.github/lib/Flash_2in1/images 
[[ -d $TOME/Unzip/firmware-update ]] && [[ -n "$(ls $TOME/Unzip/firmware-update)" ]] && mv -f $TOME/Unzip/firmware-update/* $TOME/.github/lib/Flash_2in1/images 
[[ -s $TOME/.github/lib/Flash_2in1/images/super.img.zst ]] && echo " + Tạo xong"; 
fi 

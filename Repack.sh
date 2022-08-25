echo " + Kiểm tra kích cỡ super..." 
cd $Likk/Super 

# Chế độ (none/readonly)
Chedo=none

# Kích cỡ phân vùng super 8.5GB
Ssize=8.5

# Loại phân vùng 
if [[ -f $Likk/Super/system_a.img ]]; then 
Khe='_a'
Sokhe=3
Nhom='qti_dynamic_partitions_a'
Nhomkhac='--group "qti_dynamic_partitions_b":"0" --partition system_b:"none":"0":"qti_dynamic_partitions_b" --image system_b=system_b.img --partition system_ext_b:"none":"0":"qti_dynamic_partitions_b" --image system_ext_b=system_ext_b.img --partition vendor_b:"none":"0":"qti_dynamic_partitions_b" --image vendor_b=vendor_b.img --partition product_b:"none":"0":"qti_dynamic_partitions_b" --image product_b=product_b.img --partition odm_b:"none":"0":"qti_dynamic_partitions_b" --image odm_b=odm_b.img' 
else 
Khe= 
Sokhe=1
Nhom="main" 
Nhomkhac= 
fi 

# Kiểm tra kích cỡ 
kichcosuper() { Ssuperr=$(echo $Ssize | awk '{print int($Ssize*1024*1024*1024)}'); } 

kichco() { Ssystem=$(wc -c < $Likk/Super/system${Khe}.img); Ssystem_ext=$(wc -c < $Likk/Super/system_ext${Khe}.img); Svendor=$(wc -c < $Likk/Super/vendor${Khe}.img); Sproduct=$(wc -c < $Likk/Super/product${Khe}.img); Sodm=$(wc -c < $Likk/Super/odm${Khe}.img); } 

tongkichco() { Ssuper=$(ls -l $Likk/Super | awk '{Ssuper+=$5} END {print Ssuper}'); } 

giamthieu() { for EXT in system${Khe}.img vendor${Khe}.img product${Khe}.img system_ext${Khe}.img odm${Khe}.img; do [[ -s $Likk/Super/$EXT ]] && resize2fs -f -M $Likk/Super/$EXT > /dev/null 2>&1 && resize2fs -f -M $Likk/Super/$EXT > /dev/null 2>&1; done; } 
 
tangkichco() { for EXT in system${Khe}.img vendor${Khe}.img product${Khe}.img system_ext${Khe}.img; do [[ -s $Likk/Super/$EXT ]] && Size=$(echo "$(wc -c < $Likk/Super/$EXT)" | awk '{print int($TEN*1024+200)}') && resize2fs -f $Likk/Super/$EXT ${Size}M > /dev/null 2>&1; done; } 

ghidoc() { for EXT in system${Khe}.img vendor${Khe}.img product${Khe}.img system_ext${Khe}.img odm${Khe}.img; do [[ -s $Likk/Super/$EXT ]] && e2fsck -y -E unshare_blocks $Likk/Super/$EXT > /dev/null 2>&1; done; } 

echo " + Tạo super.img..." 
taosuper() { lpmake --device-size "$Ssuperr" --metadata-slots "$Sokhe" --metadata-size 65536 --super-name super --group "$Nhom":"$Ssuper" --partition system${Khe}:"$Chedo":"$Ssystem":"$Nhom" --image system${Khe}=system${Khe}.img --partition system_ext${Khe}:"$Chedo":"$Ssystem_ext":"$Nhom" --image system_ext${Khe}=system_ext${Khe}.img --partition vendor${Khe}:"$Chedo":"$Svendor":"$Nhom" --image vendor${Khe}=vendor${Khe}.img --partition product${Khe}:"$Chedo":"$Sproduct":"$Nhom" --image product${Khe}=product${Khe}.img --partition odm${Khe}:"$Chedo":"$Sodm":"$Nhom" --image odm${Khe}=odm${Khe}.img $Nhomkhac -o $Likk/tmp/super.img > /dev/null 2>&1; } 

kichcosuper && echo " Kích cỡ phân vùng super: $Ssuperr" 
giamthieu && tangkichco && ghidoc 
kichco && echo " Kích cỡ system: $Ssystem system_ext: $Ssystem_ext vendor: $Svendor product: $Sproduct odm: $Sodm" 
tongkichco && echo " Kích cỡ tổng super: $Ssuper"
taosuper

if [[ "$Ssuper" -lt "$Ssuperr" ]]; then taosuper; else giamthieu && kichco && ghidoc && tongkichco && echo " Kích cỡ tổng super: $Ssuper" && taosuper; fi 

# Phiên bản rom
Ten=$(grep 'incremental' $Likk/Unzip/*/*/*/metadata | awk -F= '{print $2}'); 
Mamay=$(grep 'pre-device' $Likk/Unzip/*/*/*/metadata | awk -F= '{print $2}'); 

echo " + Tạo tập tin flash..." 
[[ "$Khe" = "_a" ]] && cp -af $Likk/Lib/update-binary $Likk/Lib/Flash_2in1/META-INF/com/google/android 2> /dev/null && cp -af $Likk/Lib/windows-install.bat $Likk/Lib/Flash_2in1 2> /dev/null; 
sed -i "s|Device:|Device: $Mamay|; s|ROM: MIUI|ROM: MIUI $Ten|" $Likk/Lib/Flash_2in1/*/*/*/*/update-binary 2> /dev/null 
if [[ -s $Likk/tmp/super.img ]]; then 
zstd -10 $Likk/tmp/super.img -o $Likk/Lib/Flash_2in1/images/super.img.zst 
# rm -f $Likk/Payload/vbmeta.img vbmeta_system${Khe}.img 2> /dev/null 
mv -f $Likk/Payload/* $Likk/Lib/Flash_2in1/images 
[[ -s $Likk/Lib/Flash_2in1/images/super.img.zst ]] && echo " + Tạo xong"; 
fi 

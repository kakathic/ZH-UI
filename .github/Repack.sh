#!/bin/bash
#chamchamfy
Home="$GITHUB_WORKSPACE" 
#lpmake=$Home/.github/bin/lpmake 
lpmake=$Home/.github/bin/make_super 
cd $Home/Super 
# Phiên bản rom
if [[ -f $Home/Unzip/META-INF/com/android/metadata ]]; then 
Phienban=$(grep 'incremental' $Home/Unzip/*/*/*/metadata | awk -F= '{print $2}'); 
Mamay=$(grep 'pre-device' $Home/Unzip/*/*/*/metadata | awk -F= '{print $2}'); 
Loai=$(grep 'ota-type' $Home/Unzip/*/*/*/metadata | awk -F= '{print $2}'); 
fi 

# Di chuyển tập tin
mv -f $Home/tmp/*.img $Home/Super 2>/dev/null  

# Chế độ (none/readonly)
. Option.md
#Chedo=none

# Kích cỡ phân vùng super 8.5GB/9GB
Ssize=$SIZE

# Kiểm tra kích cỡ 
kichcosuper() { Ssuperr=$(echo $Ssize | awk '{print int($Ssize*1024*1024*1024)}'); } 

kichco() { [[ -s $Home/Super/system${Khe}.img ]] && Ssystem=$(wc -c < $Home/Super/system${Khe}.img); [[ -s $Home/Super/system_ext${Khe}.img ]] && Ssystem_ext=$(wc -c < $Home/Super/system_ext${Khe}.img); [[ -s $Home/Super/vendor${Khe}.img ]] && Svendor=$(wc -c < $Home/Super/vendor${Khe}.img); [[ -s $Home/Super/product${Khe}.img ]] && Sproduct=$(wc -c < $Home/Super/product${Khe}.img); [[ -s $Home/Super/odm${Khe}.img ]] && Sodm=$(wc -c < $Home/Super/odm${Khe}.img); [[ -s $Home/Super/mi_ext${Khe}.img ]] && Smi_ext=$(wc -c < $Home/Super/mi_ext${Khe}.img); [[ -s $Home/Super/system_dlkm${Khe}.img ]] && Ssystem_dlkm=$(wc -c < $Home/Super/system_dlkm${Khe}.img); [[ -s $Home/Super/vendor_dlkm${Khe}.img ]] && Svendor_dlkm=$(wc -c < $Home/Super/vendor_dlkm${Khe}.img); } 

tongkichco() { Ssuper=$(ls -l $Home/Super | awk '{Ssuper+=$5} END {print Ssuper}'); } 

ghidoc() { for EXT in system${Khe}.img vendor${Khe}.img product${Khe}.img system_ext${Khe}.img odm${Khe}.img; do [[ -s $Home/Super/$EXT ]] && SizeM=$(echo "$(wc -c < $Home/Super/$EXT)" | awk '{print int($1*1.1/1024/1024)}')M && resize2fs -f $Home/Super/$EXT ${SizeM} >/dev/null 2>&1 && e2fsck -y -E unshare_blocks $Home/Super/$EXT >/dev/null 2>&1; done; } 

ktraphanvung() { 
ghidoc 
kichcosuper 
kichco 
pkmi_ext="--partition mi_ext_b:none:0:qti_dynamic_partitions_b --image mi_ext_b=mi_ext_b.img"
pksystem_dlkm="--partition system_dlkm_b:none:0:qti_dynamic_partitions_b --image system_dlkm_b=system_dlkm_b.img" 
pkvendor_dlkm="--partition vendor_dlkm_b:none:0:qti_dynamic_partitions_b --image vendor_dlkm_b=vendor_dlkm_b.img" 
pmi_ext="--partition mi_ext${Khe}:${Chedo}:${Smi_ext}:${Nhom} --image mi_ext${Khe}=mi_ext${Khe}.img" 
psystem_dlkm="--partition system_dlkm${Khe}:${Chedo}:${Ssystem_dlkm}:${Nhom} --image system_dlkm${Khe}=system_dlkm${Khe}.img" 
pvendor_dlkm="--partition vendor_dlkm${Khe}:${Chedo}:${Svendor_dlkm}:${Nhom} --image vendor_dlkm${Khe}=vendor_dlkm${Khe}.img" 

[[ "$Ssuperr" -lt "$((9*1024*1024*1024))" ]] && unset pkmi_ext pksystem_dlkm pkvendor_dlkm pmi_ext psystem_dlkm pvendor_dlkm; 
Nhomchinh="--group ${Nhom}:${Ssuperr} --partition system${Khe}:${Chedo}:${Ssystem}:${Nhom} --image system${Khe}=system${Khe}.img --partition system_ext${Khe}:${Chedo}:${Ssystem_ext}:${Nhom} --image system_ext${Khe}=system_ext${Khe}.img --partition vendor${Khe}:${Chedo}:${Svendor}:${Nhom} --image vendor${Khe}=vendor${Khe}.img --partition product${Khe}:${Chedo}:${Sproduct}:${Nhom} --image product${Khe}=product${Khe}.img --partition odm${Khe}:${Chedo}:${Sodm}:${Nhom} --image odm${Khe}=odm${Khe}.img ${pmi_ext} ${psystem_dlkm} ${pvendor_dlkm}" 
}

# Loại phân vùng 
if [[ "$Ssuperr" -lt "$((9*1024*1024*1024))" ]]; then tenphanvung="system.img system_ext.img vendor.img product.img odm.img"; tenphanvungkhac="system_b.img system_ext_b.img vendor_b.img product_b.img odm_b.img"; else tenphanvung="system.img system_ext.img vendor.img product.img odm.img mi_ext.img system_dlkm.img vendor_dlkm.img"; tenphanvungkhac="system_b.img system_ext_b.img vendor_b.img product_b.img odm_b.img mi_ext_b.img system_dlkm_b.img vendor_dlkm_b.img"; fi 
if [[ -f $Home/Payload/modem.img ]] || [[ -f $Home/Unzip/images/modem.img ]] || [[ -f $Home/Unzip/firmware-update/modem.img ]]; then 
for i in $tenphanvung; do mv -f $Home/Super/$i $Home/Super/${i//./_a.} 2>/dev/null; done 
touch $tenphanvungkhac 2>/dev/null;   
Khe="_a"
Sokhe=3
Nhom="qti_dynamic_partitions_a"
ktraphanvung 
Nhomkhac="--group qti_dynamic_partitions_b:${Ssuperr} --partition system_b:none:0:qti_dynamic_partitions_b --image system_b=system_b.img --partition system_ext_b:none:0:qti_dynamic_partitions_b --image system_ext_b=system_ext_b.img --partition vendor_b:none:0:qti_dynamic_partitions_b --image vendor_b=vendor_b.img --partition product_b:none:0:qti_dynamic_partitions_b --image product_b=product_b.img --partition odm_b:none:0:qti_dynamic_partitions_b --image odm_b=odm_b.img ${pkmi_ext} ${pksystem_dlkm} ${pkvendor_dlkm}" 
else 
Khe= 
Sokhe=1
Nhom="main"
ktraphanvung
Nhomkhac= 
fi 

echo "- Kích cỡ phân vùng super: $Ssuperr" 
echo "- Kích cỡ từng phân vùng: 
 ✓ system$Khe: $Ssystem 
 ✓ system_ext$Khe: $Ssystem_ext 
 ✓ vendor$Khe: $Svendor 
 ✓ product$Khe: $Sproduct 
 ✓ odm$Khe: $Sodm
 ✓ system_dlkm$Khe: $Ssystem_dlkm
 ✓ vendor_dlkm$Khe: $Svendor_dlkm" 
tongkichco && echo "- Kích cỡ tổng các phân vùng: $Ssuper" 
echo "→ Tạo super.img..."  
taosuper="--device super:${Ssuperr} --metadata-slots ${Sokhe} --metadata-size 65536 --super-name super ${Nhomchinh} ${Nhomkhac} --output $Home/tmp/super.img" 
#if [[ "$Ssuper" -lt "$Ssuperr" ]]; then $lpmake $taosuper; else echo "- Tổng kích cỡ lớn hơn kích cỡ phân vùng"; fi 

$lpmake --device super:${Ssuperr} --metadata-slots ${Sokhe} --metadata-size 65536 --super-name super --group ${Nhom}:${Ssuperr} --partition system${Khe}:${Chedo}:${Ssystem}:${Nhom} --image system${Khe}=system${Khe}.img --partition system_ext${Khe}:${Chedo}:${Ssystem_ext}:${Nhom} --image system_ext${Khe}=system_ext${Khe}.img --partition vendor${Khe}:${Chedo}:${Svendor}:${Nhom} --image vendor${Khe}=vendor${Khe}.img --partition product${Khe}:${Chedo}:${Sproduct}:${Nhom} --image product${Khe}=product${Khe}.img --partition odm${Khe}:${Chedo}:${Sodm}:${Nhom} --image odm${Khe}=odm${Khe}.img --group qti_dynamic_partitions_b:${Ssuperr} --partition system_b:none:0:qti_dynamic_partitions_b --image system_b=system_b.img --partition system_ext_b:none:0:qti_dynamic_partitions_b --image system_ext_b=system_ext_b.img --partition vendor_b:none:0:qti_dynamic_partitions_b --image vendor_b=vendor_b.img --partition product_b:none:0:qti_dynamic_partitions_b --image product_b=product_b.img --partition odm_b:none:0:qti_dynamic_partitions_b --image odm_b=odm_b.img --output $Home/tmp/super.img 

echo "→ Tạo tập tin flash..." 
if [[ "$Khe" == "_a" ]]; then rm -f $Home/.github/lib/Flash_2in1/windows_install.bat $Home/.github/lib/Flash_2in1/mac_or_linux_install.sh 2>/dev/null; else rm -f $Home/.github/lib/Flash_2in1/windows_install_ab.bat $Home/.github/lib/Flash_2in1/mac_or_linux_install_ab.sh 2>/dev/null; fi 
sed -i "s|Device:|Device: $Mamay|; s|ROM: MIUI|ROM: MIUI $Phienban|" $Home/.github/lib/Flash_2in1/*/*/*/*/update-binary 2>/dev/null 
if [[ -s $Home/tmp/super.img ]]; then echo "- Xử lý super.img"
zstd -10 $Home/tmp/super.img -o $Home/.github/lib/Flash_2in1/images/super.img.zst 
rm -f $Home/Payload/vbmeta*.img $Home/Unzip/images/vbmeta*.img $Home/Unzip/firmware-update/vbmeta*.img 2>/dev/null 
[[ -n "$(ls $Home/Payload)" ]] && mv -f $Home/Payload/* $Home/.github/lib/Flash_2in1/images 
[[ -d $Home/Unzip/images ]] && [[ -n "$(ls $Home/Unzip/images)" ]] && mv -f $Home/Unzip/images/* $Home/.github/lib/Flash_2in1/images 
[[ -d $Home/Unzip/firmware-update ]] && [[ -n "$(ls $Home/Unzip/firmware-update)" ]] && mv -f $Home/Unzip/firmware-update/* $Home/.github/lib/Flash_2in1/images 
fi 
[[ -s $Home/.github/lib/Flash_2in1/images/super.img.zst ]] && echo "✓ Tạo xong" || echo "✓ Tạo lỗi";  
rm -rf $Home/Super/* 2>/dev/null; 

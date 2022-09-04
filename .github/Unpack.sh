Phanvung="system system_a system_b vendor vendor_a vendor_b product product_a product_b system_ext system_ext_a system_ext_b odm odm_a odm_b"; 
Ungdung="ThemeManager.apk miui.apk miuisystem.apk framework.jar framework-ext-res.apk framework-res.apk core-oj.jar miui-services.jar services.jar MiuiSystemUI.apk Settings.apk PackageInstaller.apk"; 

if [[ -s $TOME/Unzip/payload.bin ]]; then 
 echo " + Trích xuất payload.bin" 
 python3 $TOME/.github/lib/Libpy/payload_dumper.py $TOME/Unzip/payload.bin --out $TOME/Payload > /dev/null 
 for Ten in $Phanvung; do [[ -f $TOME/Payload/$Ten.img ]] && mv -f $TOME/Payload/$Ten.img $TOME/Super; done 
 [[ -n "$(ls $TOME/Super/*.img)" ]] && echo " + Trích xuất xong!"  
fi 

if [[ -s $TOME/Unzip/system.new.dat.br ]]; then 
 echo " + Trích xuất new.dat.br"
 cd $TOME/Unzip 
 for Ten in $Phanvung; do 
  [[ -s $Ten.new.dat.br ]] && brotli -df $Ten.new.dat.br
  [[ -s $Ten.new.dat ]] && python3 $TOME/.github/lib/Libpy/sdat2img.py $Ten.transfer.list $Ten.new.dat $TOME/Super/$Ten.img 
 done 
 [[ -n "$(ls $TOME/Super/*.img)" ]] && echo " + Trích xuất xong!" 
fi 

if [[ -s $TOME/Unzip/imgages/super.img ]]; then 
 echo " + Trích xuất super.img" 
 mv -f $TOME/Unzip/imgages/super.img $TOME/Unzip; 
 cd $TOME/Unzip 
 #Hexf=$(hexdump -n 4 super.img | cut -c 8-12); 
 [[ -n "$(echo $(hexdump -n 4 super.img) | grep 'ff3a')" ]] && mv -f super.img supers.img && simg2img supers.img super.img 
 python3 $TOME/.github/lib/Libpy/lpunpack.py super.img $TOME/Super > /dev/null 
 [[ -n "$(ls $TOME/Super/*.img)" ]] && echo " + Trích xuất xong!" 
fi 

if [[ -s $TOME/Unzip/imgages/super.img.zst ]]; then 
 echo " + Trích xuất super.img.zst" 
 mv -f $TOME/Unzip/imgages/super.img.zst $TOME/Unzip; 
 cd $TOME/Unzip 
 zstd -d super.img.zst -o $TOME/Unzip >/dev/null
 python3 $TOME/.github/lib/Libpy/lpunpack.py super.img $TOME/Super > /dev/null 
 [[ -n "$(ls $TOME/Super/*.img)" ]] && echo " + Trích xuất xong!" 
fi 

echo " Trích xuất app" 
cd $TOME/Super 
mkdir -p $TOME/Apk
ls $TOME/Super

for Ten in system system_a system_ext system_ext_a; do 
 echo "$TOME/Super/$Ten.img"
 if [[ -s $TOME/Super/$Ten.img ]]; then 
  e2fsck -fy $TOME/Super/$Ten.img
  [[ ! -e /mnt/$Ten ]] && sudo mkdir -p /mnt/$Ten
  [[ -n "$(ls /mnt/$Ten)" ]] && sudo umount /mnt/$Ten
  sudo losetup /dev/loop0
  [[ -z "$(ls /mnt/$Ten)" ]] && sudo mount -t ext4 -o rw,loop $TOME/Super/$Ten.img /mnt/$Ten
ls /mnt/$Ten 
  [[ -n "$(ls /mnt/$Ten)" ]] && for UD in $Ungdung; do find /mnt/$Ten -type -f -name "*$UD" -exec cp -af "$1" $TOME/Apk {} +; done
ls $TOME/Apk
 fi
done 
echo " Trích app xong" 

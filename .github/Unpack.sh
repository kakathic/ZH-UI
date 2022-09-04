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

for Ten in system system_a system_ext system_ext_a; do 
 if [[ -s $TOME/Super/$Ten.img ]]; then 
  sudo mkdir -p /mnt/tmp/$Ten 
  if [[ -n "$(hexdump -n 4000 $Ten.img | grep 'e1e2 e0f5')" ]]; then 
   echo "✓ $Ten.img là erofs"
   sudo fsck.erofs --extract=/mnt/tmp/$Ten --force --overwrite --preserve $Ten.img 
  elif [[ -n "$(hexdump -n 4000 $Ten.img | grep 'ef53')" ]]; then 
   echo "✓ $Ten.img là ext4 raw" 
   sudo python3 $TOME/.github/lib/Libpy/imgextractor.py $Ten.img /mnt/tmp
  elif [[ -n "$(hexdump -n 4 $Ten.img | grep 'ff3a')" ]]; then 
   echo "✓ $Ten.img là ext4 sparse" 
   mv -f $Ten.img ${Ten}s.img && simg2img ${Ten}s.img $Ten.img && sudo python3 $TOME/.github/lib/Libpy/imgextractor.py $Ten.img /mnt/tmp
  else echo "✓ Không biết định dạng!" 
  fi 
  [[ -n "$(ls /mnt/tmp/$Ten)" ]] && for UD in $Ungdung; do sudo find /mnt/tmp/$Ten -type f -name "*$UD" -exec sudo cp -pf "$1" $TOME/Apk {} +; done
 fi
done 
[[ -z "$(ls $TOME/Apk)" ]] && echo " Trích app lỗi" || ls $TOME/Apk 

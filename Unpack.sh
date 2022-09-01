Phanvung="system system_a system_b vendor vendor_a vendor_b product product_a product_b system_ext system_ext_a system_ext_b odm odm_a odm_b"; 
Ungdung="ThemeManager.apk miui.apk miuisystem.apk framework.jar framework-ext-res.apk framework-res.apk core-oj.jar miui-services.jar services.jar MiuiSystemUI.apk Settings.apk PackageInstaller.apk"; 

if [[ -s $Likk/Unzip/payload.bin ]]; then 
 echo " + Trích xuất payload.bin" 
 python3 $Likk/Lib/Libpy/payload_dumper.py $Likk/Unzip/payload.bin --out $Likk/Payload > /dev/null 
 for Ten in $Phanvung; do [[ -f $Likk/Payload/$Ten.img ]] && mv -f $Likk/Payload/$Ten.img $Likk/Super; done 
 [[ -n "$(ls $Likk/Super/*.img)" ]] && echo " + Trích xuất xong!"  
fi 

if [[ -s $Likk/Unzip/system.new.dat.br ]]; then 
 echo " + Trích xuất new.dat.br"
 cd $Likk/Unzip 
 for Ten in $Phanvung; do 
  [[ -s $Ten.new.dat.br ]] && brotli -df $Ten.new.dat.br
  [[ -s $Ten.new.dat ]] && python3 $Likk/Lib/Libpy/sdat2img.py $Ten.transfer.list $Ten.new.dat $Likk/Super/$Ten.img 
 done 
 [[ -n "$(ls $Likk/Super/*.img)" ]] && echo " + Trích xuất xong!" 
fi 

if [[ -s $Likk/Unzip/imgages/super.img ]]; then 
 echo " + Trích xuất super.img" 
 mv -f $Likk/Unzip/imgages/super.img $Likk/Unzip; 
 cd $Likk/Unzip 
 #Hexf=$(hexdump -n 4 super.img | cut -c 8-12); 
 [[ -n "$(echo $(hexdump -n 4 super.img) | grep 'ff3a')" ]] && mv -f super.img supers.img && simg2img supers.img super.img 
 python3 $Likk/Lib/Libpy/lpunpack.py super.img $Likk/Super > /dev/null 
 [[ -n "$(ls $Likk/Super/*.img)" ]] && echo " + Trích xuất xong!" 
fi 

if [[ -s $Likk/Unzip/imgages/super.img.zst ]]; then 
 echo " + Trích xuất super.img.zst" 
 mv -f $Likk/Unzip/imgages/super.img.zst $Likk/Unzip; 
 cd $Likk/Unzip 
 zstd -d super.img.zst -o $Likk/Unzip >/dev/null
 python3 $Likk/Lib/Libpy/lpunpack.py super.img $Likk/Super > /dev/null 
 [[ -n "$(ls $Likk/Super/*.img)" ]] && echo " + Trích xuất xong!" 
fi 

echo " Trích xuất app" 
cd $Likk/Super 
sudo mkdir -p /mnt/s
mkdir -p $Likk/Apk
ls $Likk/Super

for Ten in $Phanvung; do 
 echo "$Likk/Super/$Ten.img"
 sudo umount /mnt/s 
 [[ -s $Ten.img ]] && sudo mount -o rw,loop $Likk/Super/$Ten.img /mnt/s
 [[ -n "$(ls /mnt/s)" ]] && for U in $Ungdung; do find /mnt/s -type -f -name "*$U" -exec cp -af "$1" $Likk/Apk {} +; done
done 
echo " Trích app xong" 

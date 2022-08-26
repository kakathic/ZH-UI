Xemb() { ls -l $1 | awk '{print $5}'; }

if [[ -s $Likk/Unzip/payload.bin ]]; then 
echo " + Trích xuất payload.bin" 
python3 $Likk/Lib/Libpy/payload_dumper.py $Likk/Unzip/payload.bin --out $Likk/Payload > /dev/null 
for tim in system.img system_a.img system_b.img vendor.img vendor_a.img vendor_b.img product.img product_a.img product_b.img system_ext.img system_ext_a.img system_ext_b.img odm.img odm_a.img odm_b.img; do [[ -f $Likk/Payload/$tim ]] && mv -f $Likk/Payload/$tim $Likk/Super; done 
[[ -n "$(ls $Likk/Super/*.img)" ]] && echo " + Trích xuất xong!"  
fi 

if [[ -s $Likk/Unzip/system.new.dat.br ]]; then 
echo " + Trích xuất new.dat.br"
cd $Likk/Unzip 
for ext in system.new.dat.br vendor.new.dat.br product.new.dat.br system_ext.new.dat.br odm.new.dat.br; do 
Ten=$(echo "$ext" | awk -F. '{print $1}'); 
[[ -s $ext ]] && brotli -df $ext
[[ -s $Ten.new.dat ]] && python3 $Likk/Lib/Libpy/sdat2img.py $Ten.transfer.list $Ten.new.dat $Likk/Super/$Ten.img 
done 
[[ -n "$(ls $Likk/Super/*.img)" ]] && echo " + Trích xuất xong!" 
fi 

if [[ -s $Likk/Unzip/imgages/super.img ]]; then 
echo " + Trích xuất super.img" 
mv -f $Likk/Unzip/imgages/super.img $Likk/Unzip; 
cd $Likk/Unzip 
Hexf=$(hexdump -n 4 super.img | cut -c 8-12); 
[[ $Hexf == ff3a ]] && mv -f super.img supers.img && simg2img supers.img super.img 
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

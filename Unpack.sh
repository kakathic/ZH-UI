Xemb() { ls -l $1 | awk '{print $5}'; }

echo " + Trích xuất payload.bin"

python3 $Likk/Libpy/payload_dumper.py $Likk/Unzip/payload.bin --out $Likk/Payload > /dev/null 

for kdbfnd in system.img vendor.img product.img odm.img system_ext.img; do
mv -f $Likk/Payload/$kdbfnd $Likk/Super
done
[ $? -eq 0 ] && echo " + Trích xuất xong!" 

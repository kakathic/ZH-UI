Xemb() { ls -l $1 | awk '{print $5}'; }

echo " + Trích xuất payload.bin"

python3 $Likk/Lib/Libpy/payload_dumper.py $Likk/Unzip/payload.bin --out $Likk/Payload > /dev/null 

for ten in system.img vendor.img product.img odm.img system_ext.img system_a.img system_ext_a.img vendor_a.img product_a.img odm_a.img system_b.img system_ext_b.img vendor_b.img product_b.img odm_b.img; do
mv -f $Likk/Payload/$ten $Likk/Super
done
[ $? -eq 0 ] && echo " + Trích xuất xong!" 

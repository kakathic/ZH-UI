Xemb() { ls -l $1 | awk '{print $5}'; }

echo " + Trích xuất payload.bin"

python3 $Likk/Lib/Libpy/payload_dumper.py $Likk/Unzip/payload.bin --out $Likk/Payload > /dev/null 

[ $? -eq 0 ] && echo " + Trích xuất xong!" 

for Tim in system.img vendor.img product.img odm.img system_ext.img; do
mv -f $Likk/Payload/$Tim $Likk/Super 
done

mv -f $Likk/Payload/{system,system_a,system_b,vendor,vendor_a,vendor_b,product,product_a,product_b,system_ext,system_ext_a,system_ext_b,odm,odm_a,odm_b}.img $Likk/Super 2> /dev/null; 


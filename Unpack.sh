Xemb(){ ls -l $1 | awk '{print $5}'; }

echo "- Bung payload.bin"

python3 $Likk/Libpy/payload_dumper.py $Likk/Unzip/payload.bin --out $Likk/Payload > /dev/null 

for kdbfnd in system.img vendor.img product.img odm.img system_ext.img; do
mv -f $Likk/Payload/$kdbfnd $Likk/Super
done

system_size=$(Xemb $Likk/Super/system.img)
system_ext_size=$(Xemb $Likk/Super/system_ext.img)
vendor_size=$(Xemb $Likk/Super/vendor.img)
product_size=$(Xemb $Likk/Super/product.img)
odm_size=$(Xemb $Likk/Super/odm.img)
# Tính tổng kích cỡ thư mục super 
super_size=$(ls -l $Likk/Super | sed -n 1p | awk '{print int($2)}'); 


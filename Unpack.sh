Xemb() { ls -l $1 | awk '{print $5}'; }

echo " + Trích xuất payload.bin"

python3 $Likk/Lib/Libpy/payload_dumper.py $Likk/Unzip/payload.bin --out $Likk/Payload > /dev/null 

[ $? -eq 0 ] && echo " + Trích xuất xong!" 

#for tim in system.img vendor.img product.img odm.img system_ext.img; do mv -f $Likk/Payload/$tim $Likk/Super; done

case $tim in system.img|system_a.img|system_b.img|vendor.img|vendor_a.img|vendor_b.img|product.img|product_a.img|product_b.img|system_ext.img|system_ext_a.img|system_ext_b.img|odm.img|odm_a.img|odm_b.img) [[ -f $Likk/Payload/$tim ]] && mv -f $Likk/Payload/$tim $Likk/Super;; esac  


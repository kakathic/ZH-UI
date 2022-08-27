cd $(dirname $0)
clear

not_support() {
    echo 'Hệ thống của bạn chưa được hỗ trợ, Vui lòng chọn hệ thống khác để flash'
    exit
}

if [ "$(uname)" == "Linux" ]; then
    systemType=linux
elif [ "$(uname)" == "Darwin" ]; then
    systemType=darwin
else
    not_support
fi

if [ -f "images/super.img.zst" ]; then
    echo 'Đang chuẩn bị'
    echo '- Bắt đầu chuyển đổi super.img.zst ==》super.img (Có thể mất nhiều thời gian, tùy thuộc vào cấu hình máy tính của bạn)'
    read -p "Lưu ý: Hãy đảm bảo rằng dung lượng còn lại của phân vùng hiện tại của bạn lớn hơn 10GB, nếu không, quá trình chuyển đổi super sẽ không thành công, dẫn đến không thể flash. (Bấm phím bất kỳ để tiếp tục)" readtemp
    zstd --rm -d images/super.img.zst -o images/super.img
    if [ $? -ne 0 ]; then
        read -p "Chuyển đổi bị lỗi, nhấn phím bất kì để thoát" readtemp
        exit
    fi
    echo 'Chuẩn bị hoàn thành'
    echo
fi

q1() {
    read -p "Q1:Thiết bị của sẳn sàng cài đặt? (Y/N) " choice1
    if [ "$choice1" == 'Y' ] || [ "$choice1" == 'y' ]; then
        q2
    elif [ "$choice1" == 'N' ] || [ "$choice1" == 'n' ]; then
        q1_1
    fi
    q1
}

q1_1() {
    read -p "Q1-1:Cài đặt lần đầu sẽ xóa dữ liệu và bộ nhớ trong. Bạn đồng ý không？(Y/N) " choice1_1
    if [ "$choice1_1" == 'Y' ] || [ "$choice1_1" == 'y' ]; then
        q2
    elif [ "$choice1_1" == 'N' ] || [ "$choice1_1" == 'n' ]; then
        exit
    fi
    q1_1
}

q2() {
    read -p "Q2:Bạn muốn cài đặt Magisk (ROOT)? (Y/N) " choice2
    if [ "$choice2" == 'Y' ] || [ "$choice2" == 'y' ] || [ "$choice2" == 'N' ] || [ "$choice2" == 'n' ]; then
        main
    fi
    q2
}

main() {
    if [ -f "images/abl.elf" ]; then
        bin/$systemType/all/fastboot $* flash abl images/abl.elf
        bin/$systemType/all/fastboot $* flash ablbak images/abl.elf
    fi
    if [ -f "images/aop.mbn" ]; then
        bin/$systemType/all/fastboot $* flash aop images/aop.mbn
        bin/$systemType/all/fastboot $* flash aopbak images/aop.mbn
    fi
    if [ -f "images/BTFM.bin" ]; then
        bin/$systemType/all/fastboot $* flash bluetooth images/BTFM.bin
    fi
    if [ -f "images/cmnlib64.mbn" ]; then
        bin/$systemType/all/fastboot $* flash cmnlib64 images/cmnlib64.mbn
        bin/$systemType/all/fastboot $* flash cmnlib64bak images/cmnlib64.mbn
    fi
    if [ -f "images/cmnlib.mbn" ]; then
        bin/$systemType/all/fastboot $* flash cmnlib images/cmnlib.mbn
        bin/$systemType/all/fastboot $* flash cmnlibbak images/cmnlib.mbn
    fi
    if [ -f "images/devcfg.mbn" ]; then
        bin/$systemType/all/fastboot $* flash devcfg images/devcfg.mbn
        bin/$systemType/all/fastboot $* flash devcfgbak images/devcfg.mbn
    fi
    if [ -f "images/dspso.bin" ]; then
        bin/$systemType/all/fastboot $* flash dsp images/dspso.bin
    fi
    if [ -f "images/dtbo.img" ]; then
        bin/$systemType/all/fastboot $* flash dtbo images/dtbo.img
    fi
    if [ -f "images/featenabler.mbn" ]; then
        bin/$systemType/all/fastboot $* flash featenabler images/featenabler.mbn
    fi
    if [ -f "images/hyp.mbn" ]; then
        bin/$systemType/all/fastboot $* flash hyp images/hyp.mbn
        bin/$systemType/all/fastboot $* flash hypbak images/hyp.mbn
    fi
    if [ -f "images/km4.mbn" ]; then
        bin/$systemType/all/fastboot $* flash keymaster images/km4.mbn
    fi
    if [ -f "images/NON-HLOS.bin" ]; then
        bin/$systemType/all/fastboot $* flash modem images/NON-HLOS.bin
    fi
    if [ -f "images/qupv3fw.elf" ]; then
        bin/$systemType/all/fastboot $* flash qupfw images/qupv3fw.elf
        bin/$systemType/all/fastboot $* flash qupfwbak images/qupv3fw.elf
    fi
    if [ -f "images/tz.mbn" ]; then
        bin/$systemType/all/fastboot $* flash tz images/tz.mbn
        bin/$systemType/all/fastboot $* flash tzbak images/tz.mbn
    fi
    if [ -f "images/uefi_sec.mbn" ]; then
        bin/$systemType/all/fastboot $* flash uefisecapp images/uefi_sec.mbn
    fi
    if [ -f "images/vbmeta.img" ]; then
        bin/$systemType/all/fastboot $* flash vbmeta images/vbmeta.img
    fi
    if [ -f "images/vbmeta_system.img" ]; then
        bin/$systemType/all/fastboot $* flash vbmeta_system images/vbmeta_system.img
    fi
    if [ -f "images/xbl_config_4.elf" ]; then
        bin/$systemType/all/fastboot $* flash xbl_config_4 images/xbl_config_4.elf
    fi
    if [ -f "images/xbl_config_5.elf" ]; then
        bin/$systemType/all/fastboot $* flash xbl_config_5 images/xbl_config_5.elf
    fi
    if [ -f "images/xbl_4.elf" ]; then
        bin/$systemType/all/fastboot $* flash xbl_4 images/xbl_4.elf
    fi
    if [ -f "images/xbl_5.elf" ]; then
        bin/$systemType/all/fastboot $* flash xbl_5 images/xbl_5.elf
    fi
    if [ -f "images/storsec.mbn" ]; then
        bin/$systemType/all/fastboot $* flash storsec images/storsec.mbn
        bin/$systemType/all/fastboot $* flash storsecbak images/storsec.mbn
    fi
    if [ -f "images/logo.img" ]; then
        bin/$systemType/all/fastboot $* flash logo images/logo.img
    fi
 

    if [ "$choice2" == 'Y' ] || [ "$choice2" == 'y' ]; then
        bin/$systemType/all/fastboot $* flash boot images/boot_magisk.img
    elif [ "$choice2" == 'N' ] || [ "$choice2" == 'n' ]; then
        bin/$systemType/all/fastboot $* flash boot images/boot.img
    fi

    if [ -f "images/super.img" ]; then
        echo 'Bắt đầu flash super. Tệp này lớn và có thể mất nhiều thời gian (tùy thuộc vào cấu hình máy tính của bạn).'
        bin/$systemType/all/fastboot $* flash super images/super.img
    fi

    bin/$systemType/all/fastboot $* flash cust images/cust.img

    if [ "$choice1_1" == 'Y' ] || [ "$choice1_1" == 'y' ]; then
        bin/$systemType/all/fastboot $* erase userdata
        bin/$systemType/all/fastboot $* erase metadata
    fi
    bin/$systemType/all/fastboot $* reboot
    exit
}
q1

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
    if [ -f "images/abl.img" ]; then
        bin/$systemType/all/fastboot $* flash abl_ab images/abl.img
    fi
    if [ -f "images/aop.img" ]; then
        bin/$systemType/all/fastboot $* flash aop_ab images/aop.img
    fi
    if [ -f "images/bluetooth.img" ]; then
        bin/$systemType/all/fastboot $* flash bluetooth_ab images/bluetooth.img
    fi
    if [ -f "images/cmnlib64.img" ]; then
        bin/$systemType/all/fastboot $* flash cmnlib64_ab images/cmnlib64.img
    fi
    if [ -f "images/cmnlib.img" ]; then
        bin/$systemType/all/fastboot $* flash cmnlib_ab images/cmnlib.img
    fi
    if [ -f "images/cpucp.img" ]; then
        bin/$systemType/all/fastboot $* flash cpucp_ab images/cpucp.img
    fi
    if [ -f "images/devcfg.img" ]; then
        bin/$systemType/all/fastboot $* flash devcfg_ab images/devcfg.img
    fi
    if [ -f "images/dsp.img" ]; then
        bin/$systemType/all/fastboot $* flash dsp_ab images/dsp.img
    fi
    if [ -f "images/dtbo.img" ]; then
        bin/$systemType/all/fastboot $* flash dtbo_ab images/dtbo.img
    fi
    if [ -f "images/featenabler.img" ]; then
        bin/$systemType/all/fastboot $* flash featenabler_ab images/featenabler.img
    fi
    if [ -f "images/hyp.img" ]; then
        bin/$systemType/all/fastboot $* flash hyp_ab images/hyp.img
    fi
    if [ -f "images/imagefv.img" ]; then
        bin/$systemType/all/fastboot $* flash imagefv_ab images/imagefv.img
    fi
    if [ -f "images/keymaster.img" ]; then
        bin/$systemType/all/fastboot $* flash keymaster_ab images/keymaster.img
    fi
    if [ -f "images/modem.img" ]; then
        bin/$systemType/all/fastboot $* flash modem_ab images/modem.img
    fi
    if [ -f "images/qupfw.img" ]; then
        bin/$systemType/all/fastboot $* flash qupfw_ab images/qupfw.img
    fi
    if [ -f "images/shrm.img" ]; then
        bin/$systemType/all/fastboot $* flash shrm_ab images/shrm.img
    fi
    if [ -f "images/tz.img" ]; then
        bin/$systemType/all/fastboot $* flash tz_ab images/tz.img
    fi
    if [ -f "images/uefisecapp.img" ]; then
        bin/$systemType/all/fastboot $* flash uefisecapp_ab images/uefisecapp.img
    fi
    if [ -f "images/vbmeta.img" ]; then
        bin/$systemType/all/fastboot $* flash vbmeta_ab images/vbmeta.img
    fi
    if [ -f "images/vbmeta_system.img" ]; then
        bin/$systemType/all/fastboot $* flash vbmeta_system_ab images/vbmeta_system.img
    fi
    if [ -f "images/vendor_boot.img" ]; then
        bin/$systemType/all/fastboot $* flash vendor_boot_ab images/vendor_boot.img
    fi
    if [ -f "images/xbl_config.img" ]; then
        bin/$systemType/all/fastboot $* flash xbl_config_ab images/xbl_config.img
    fi
    if [ -f "images/xbl.img" ]; then
        bin/$systemType/all/fastboot $* flash xbl_ab images/xbl.img
    fi
    

    if [ "$choice2" == 'Y' ] || [ "$choice2" == 'y' ]; then
        bin/$systemType/all/fastboot $* flash boot_ab images/boot_magisk.img
    elif [ "$choice2" == 'N' ] || [ "$choice2" == 'n' ]; then
        bin/$systemType/all/fastboot $* flash boot_ab images/boot_official.img
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
    
    bin/$systemType/all/fastboot $* set_active a
    bin/$systemType/all/fastboot $* reboot
    exit
}
q1

@echo off
mode con cols=100 lines=30
title ←Nếu từ [Chọn] được hiển thị ở bên trái của tiêu đề cửa sổ, vui lòng nhấn Enter hoặc nhấn nút chuột phải để xóa lựa chọn, nếu quá trình sẽ dừng lại. 

if %PROCESSOR_ARCHITECTURE%==x86 (set cpuArch=x86) else set cpuArch=amd64

echo.
echo.
echo.Hãy nhấn phím bất kỳ để tiếp tục
pause >nul 2>nul
cls
echo.Không đóng cửa sổ hoặc thao tác với chuột và bàn phím. Nếu từ [Chọn] hiển thị ở phía bên trái của tiêu đề cửa sổ, vui lòng nhấn Enter hoặc nhấn nút chuột phải để xóa lựa chọn, nếu không việc thực thi đầu ra sẽ dừng lại.
echo.
if exist images\super.img.zst (
echo.Đang chuẩn bị
echo. - Bắt đầu chuyển đổi super.img.zst ==》super.img  (Có thể mất nhiều thời gian, tùy thuộc vào cấu hình máy tính của bạn)
echo. Lưu ý: Hãy đảm bảo rằng dung lượng còn lại của phân vùng hiện tại của bạn lớn hơn 10GB, nếu không, quá trình chuyển đổi super sẽ không thành công, dẫn đến không thể flash. (Bấm phím bất kỳ để tiếp tục)
pause >nul 2>nul
bin\windows\%cpuArch%\zstd --rm -d images\super.img.zst -o images\super.img
if %errorlevel% == 1 (
    echo.Chuyển đổi không thành công, nhấn phím bất kỳ để thoát
    pause >nul 2>nul
    exit
)
echo.Chuẩn bị đã hoàn tất
echo.
)


:Q1
set /p CHOICE1="Q1:Lần cài đặt đầu tiên yêu cầu xóa dữ liệu và bộ nhớ trong của bạn. Bạn có đồng ý không? (Y/N) "
if /i "%CHOICE1%" == "y" (
    goto Q2
) else if /i "%CHOICE1%" == "n" (
    exit
) else (
    goto Q1
)

:Q2
set /p CHOICE2="Q2:Cài đặt Magisk（ROOT）?(Y/N) "
if /i "%CHOICE2%" == "y" (
    goto MAIN
) else if /i "%CHOICE2%" == "n" (
    goto MAIN
) else (
    goto Q2
)
goto MAIN

:MAIN
if exist images\abl.img (
bin\windows\all\fastboot %* flash abl_ab images\abl.img
)
if exist images\aop.img (
bin\windows\all\fastboot %* flash aop_ab images\aop.img
)
if exist images\bluetooth.img (
bin\windows\all\fastboot %* flash bluetooth_ab images\bluetooth.img
)
if exist images\cmnlib64.img (
bin\windows\all\fastboot %* flash cmnlib64_ab images\cmnlib64.img
)
if exist images\cmnlib.img (
bin\windows\all\fastboot %* flash cmnlib_ab images\cmnlib.img
)
if exist images\devcfg.img (
bin\windows\all\fastboot %* flash devcfg_ab images\devcfg.img
)
if exist images\dsp.img (
bin\windows\all\fastboot %* flash dsp_ab images\dsp.img
)
if exist images\dtbo.img (
bin\windows\all\fastboot %* flash dtbo_ab images\dtbo.img
)
if exist images\featenabler.img (
bin\windows\all\fastboot %* flash featenabler_ab images\featenabler.img
)
if exist images\hyp.img (
bin\windows\all\fastboot %* flash hyp_ab images\hyp.img
)
if exist images\imagefv.img (
bin\windows\all\fastboot %* flash imagefv_ab images\imagefv.img
)
if exist images\keymaster.img (
bin\windows\all\fastboot %* flash keymaster_ab images\keymaster.img
)
if exist images\modem.img (
bin\windows\all\fastboot %* flash modem_ab images\modem.img
)
if exist images\qupfw.img (
bin\windows\all\fastboot %* flash qupfw_ab images\qupfw.img
)
if exist images\tz.img (
bin\windows\all\fastboot %* flash tz_ab images\tz.img
)
if exist images\uefisecapp.img (
bin\windows\all\fastboot %* flash uefisecapp_ab images\uefisecapp.img
)
if exist images\vbmeta.img (
bin\windows\all\fastboot %* flash vbmeta_ab images\vbmeta.img
)
if exist images\vbmeta_system.img (
bin\windows\all\fastboot %* flash vbmeta_system_ab images\vbmeta_system.img
)
if exist images\vendor_boot.img (
bin\windows\all\fastboot %* flash vendor_boot_ab images\vendor_boot.img
)
if exist images\xbl_config.img (
bin\windows\all\fastboot %* flash xbl_config_ab images\xbl_config.img
)
if exist images\xbl.img (
bin\windows\all\fastboot %* flash xbl_ab images\xbl.img
)
@REM flash firmware done

if /i "%CHOICE2%" == "y" (
    bin\windows\all\fastboot %* flash boot_ab images\boot_magisk.img
) else if /i "%CHOICE2%" == "n" (
    bin\windows\all\fastboot %* flash boot_ab images\boot.img
)
if exist images\super.img (
echo. Bắt đầu flash super. Tệp này lớn và có thể mất nhiều thời gian (tùy thuộc vào cấu hình máy tính của bạn). 
echo. Không đóng cửa sổ hoặc thao tác chuột và bàn phím. Nếu từ [Chọn] hiển thị ở phía bên trái của tiêu đề cửa sổ, vui lòng nhấn Enter hoặc nhấn nút chuột phải để xóa lựa chọn, nếu không, việc thực thi đầu ra sẽ dừng lại.
bin\windows\all\fastboot %* flash super images\super.img
)
bin\windows\all\fastboot %* flash cust images\cust.img
if exist images\recovery.img (
bin\windows\all\fastboot %* flash recovery images\recovery.img
)
if /i "%CHOICE1%" == "y" (
    bin\windows\all\fastboot %* erase userdata
    bin\windows\all\fastboot %* erase metadata
)
bin\windows\all\fastboot %* set_active a
bin\windows\all\fastboot %* reboot
echo.
echo.
:Finish
goto Finish
:END
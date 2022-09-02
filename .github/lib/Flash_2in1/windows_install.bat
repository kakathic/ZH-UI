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
if exist images\cmnlib64.mbn (
bin\windows\all\fastboot %* flash cmnlib64 images\cmnlib64.mbn
)
if exist images\xbl_config_5.elf (
bin\windows\all\fastboot %* flash xbl_config_5 images\xbl_config_5.elf
)
if exist images\NON-HLOS.bin (
bin\windows\all\fastboot %* flash modem images\NON-HLOS.bin
)
if exist images\cmnlib.mbn (
bin\windows\all\fastboot %* flash cmnlib images\cmnlib.mbn
)
if exist images\BTFM.bin (
bin\windows\all\fastboot %* flash bluetooth images\BTFM.bin
)
if exist images\km4.mbn (
bin\windows\all\fastboot %* flash keymaster images\km4.mbn
)
if exist images\xbl_5.elf (
bin\windows\all\fastboot %* flash xbl_5 images\xbl_5.elf
)
if exist images\tz.mbn (
bin\windows\all\fastboot %* flash tz images\tz.mbn
)
if exist images\aop.mbn (
bin\windows\all\fastboot %* flash aop images\aop.mbn
)
if exist images\featenabler.mbn (
bin\windows\all\fastboot %* flash featenabler images\featenabler.mbn
)
if exist images\xbl_config_4.elf (
bin\windows\all\fastboot %* flash xbl_config_4 images\xbl_config_4.elf
)
if exist images\storsec.mbn (
bin\windows\all\fastboot %* flash storsec images\storsec.mbn
)
if exist images\uefi_sec.mbn (
bin\windows\all\fastboot %* flash uefisecapp images\uefi_sec.mbn
)
if exist images\qupv3fw.elf (
bin\windows\all\fastboot %* flash qupfw images\qupv3fw.elf
)
if exist images\abl.elf (
bin\windows\all\fastboot %* flash abl images\abl.elf
)
if exist images\dspso.bin (
bin\windows\all\fastboot %* flash dsp images\dspso.bin
)
if exist images\devcfg.mbn (
bin\windows\all\fastboot %* flash devcfg images\devcfg.mbn
)
if exist images\xbl_4.elf (
bin\windows\all\fastboot %* flash xbl_4 images\xbl_4.elf
)
if exist images\hyp.mbn (
bin\windows\all\fastboot %* flash hyp images\hyp.mbn
)
if exist images\cmnlib64.mbn (
bin\windows\all\fastboot %* flash cmnlib64bak images\cmnlib64.mbn
)
if exist images\cmnlib.mbn (
bin\windows\all\fastboot %* flash cmnlibbak images\cmnlib.mbn
)
if exist images\tz.mbn (
bin\windows\all\fastboot %* flash tzbak images\tz.mbn
)
if exist images\aop.mbn (
bin\windows\all\fastboot %* flash aopbak images\aop.mbn
)
if exist images\storsec.mbn (
bin\windows\all\fastboot %* flash storsecbak images\storsec.mbn
)
if exist images\qupv3fw.elf (
bin\windows\all\fastboot %* flash qupfwbak images\qupv3fw.elf
)
if exist images\abl.elf (
bin\windows\all\fastboot %* flash ablbak images\abl.elf
)
if exist images\devcfg.mbn (
bin\windows\all\fastboot %* flash devcfgbak images\devcfg.mbn
)
if exist images\hyp.mbn (
bin\windows\all\fastboot %* flash hypbak images\hyp.mbn
)
if exist images\logo.img (
bin\windows\all\fastboot %* flash logo images\logo.img
)
if exist images\dtbo.img (
bin\windows\all\fastboot %* flash dtbo images\dtbo.img
)
if exist images\vbmeta.img (
bin\windows\all\fastboot %* flash vbmeta images\vbmeta.img
)
if exist images\vbmeta_system.img (
bin\windows\all\fastboot %* flash vbmeta_system images\vbmeta_system.img
)
@REM flash firmware done

if /i "%CHOICE2%" == "y" (
    bin\windows\all\fastboot %* flash boot images\boot_magisk.img
) else if /i "%CHOICE2%" == "n" (
    bin\windows\all\fastboot %* flash boot images\boot.img
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
bin\windows\all\fastboot %* reboot
echo.
echo.
:Finish
goto Finish
:END
@echo off
mode con cols=100 lines=30
title ←Neu tu [Chon] duoc hien thi o ben trai cua tieu de cua so, vui long nhan Enter hoac nhan nut chuot phai de xoa lua chon, neu qua trinh se dung lai. 

if %PROCESSOR_ARCHITECTURE%==x86 (set cpuArch=x86) else set cpuArch=amd64

echo.
echo.
echo.Hay nhan phim bat ky de tiep tuc
pause >nul 2>nul
cls
echo.Khong dong cua so hoac thao tac voi chuot va ban phim. Neu tu [Chon] hien thi o phia ben trai cua tieu de cua so, vui long nhan Enter hoac nhan nut chuot phai de xoa lua chon, neu khong viec thuc thi dau ra se dung lai.
echo.
if exist images\super.img.zst (
echo.Dang chuan bi
echo. - Bat dau chuyen doi super.img.zst ==》super.img  (Co the mat nhieu thoi gian, tuy thuoc vao cau hinh may tinh cua ban)
echo. Luu y: Hay dam bao rang dung luong con lai cua phan vung hien tai cua ban lon hon 10GB, neu khong, qua trinh chuyen doi super se khong thanh cong, dan den khong the flash. (Bam phim bat ky de tiep tuc)
pause >nul 2>nul
bin\windows\%cpuArch%\zstd --rm -d images\super.img.zst -o images\super.img
if %errorlevel% == 1 (
    echo.Chuyen doi khong thanh cong, nhan phim bat ky de thoat
    pause >nul 2>nul
    exit
)
echo.Chuan bi da hoan tat
echo.
)


:Q1
set /p CHOICE1="Q1:Lan cai dat dau tien yeu cau xoa du lieu va bo nho trong cua ban. Ban co dong y khong? (Y/N) "
if /i "%CHOICE1%" == "y" (
    goto Q2
) else if /i "%CHOICE1%" == "n" (
    exit
) else (
    goto Q1
)

:Q2
set /p CHOICE2="Q2:Cai dat Magisk（ROOT）?(Y/N) "
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
if exist images\cpucp.img (
bin\windows\all\fastboot %* flash cpucp_ab images\cpucp.img
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
if exist images\shrm.img (
bin\windows\all\fastboot %* flash shrm_ab images\shrm.img
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
echo. Bat dau flash super. Tep nay lon va co the mat nhieu thoi gian (tuy thuoc vao cau hinh may tinh cua ban). 
echo. Khong dong cua so hoac thao tac chuot va ban phim. Neu tu [Chon] hien thi o phia ben trai cua tieu de cua so, vui long nhan Enter hoac nhan nut chuot phai de xoa lua chon, neu khong, viec thuc thi dau ra se dung lai.
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
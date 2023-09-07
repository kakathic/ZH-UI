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
bin\windows\all\fastboot %* reboot
echo.
echo.
:Finish
goto Finish
:END
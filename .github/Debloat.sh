#chamchamfy
Phanvung="system vendor product system_ext"; 
Nha=/mnt
Danhsachxoa="
BaiduIME
MIFinance
MIUIDriveMode
MIUIDuokanReader
MIUIGameCenter
MIUIHuanji
MIUINewHome
MIUIVipAccount
MIUIVirtualSim
MIUIYoupin
MiShop
SmartHome
wps-lite
GameCenter
GoogleCalendarSyncAdapter
MiLiveAssistant
facebook-installer
facebook-services
MiCreditInStub
Gmail2
Chrome
Maps
NewHome
SmartTravel
XiaoAiSpeechEngine
tv.danmaku.bili_26
com.iflytek.inputmethod.miui
AndroidAutoStub
SystemAppUpdater
PlayAutoInstallStubApp
AndroidAutoStub 
CloudPrint2 
DeviceInfo
EmergencyInfo
FM
GoogleFeedback 
GoogleLocationHistory 
GoogleOneTimeInitializer 
#GoogleTTS
PhotoTable
QColor
QdcmFF
SimContact 
SoundPickerGoogle 
Velvet 
WAPPushManager
WfdService
aiasst_service
dpmserviceapp
seccamservice
talkback
xdivert
AiAsstVision
AnalyticsCore
AutoRegistration
BTProductionLineTool
BasicDreams
BlockedNumberProvider
BookmarkProvider
Browser 
MiBrowserGlobal 
MiBrowser
MIUIBrowser
BuiltInPrintService
#Calculator
#MIUICalculator
#Calendar
#MIUICalendar
CameraTools
CatchLog
#CleanMaster 
#MIUICleanMaster 
CompanionDeviceManager
Cit
CtsShimPrebuilt
DMRegService
DiracAudioControlService
DynamicSystemInstallationService
Email 
MIUIEmail 
FusedLocationProvider
#Health 
HybridAccessory
HybridPlatform
Joyose
KSICibaEngine
Lens 
YouTube
#LiveWallpapersPicker
#MiuiAod
#MIUIAod
#MiuiAudioMonitor
#MiuiBiometric
MiuiBugReport
#MiuiCamera
MiuiCompass
MIUICompass
MiuiContentExtension
MiuiDaemon
#MiuiPersonalAssistant
#MIUIPersonalAssistant
#MiuiPlayClient
MiuiPrintSpoolerBeta
MIUIQuickSearchBox
QuickSearchBox
MiuiScanner
MIUIScanner
#MiuiSuperMarket
#MIUISuperMarket
MIUIVideo
MiuiVideoGlobal 
MIUIVipService
MiuiVipService
MIUIWallpaper_SnowMountain 
#MiuiWeather 
#Weather 
#MiuiYellowPage
#MIUIYellowPage
Miuigreenguard
MIUIgreenguard
MIService
#MIShare
MIpay
MSA
ManagedProvisioning
MarkupGoogle 
MiGalleryLockscreen
MiGameCenterSDKService
MiGameService
#MiLink
MiLiveAssistant 
MiMobileNoti 
MiMover
#MIPlayClient
MiRadio 
MiService
Mirror
ModemTestBox
#Music 
#MIUIMusic
NQNfcNci
NextPay
#Notes
#MIUINotes
ONS
PacProcessor
PaymentService
#PersonalAssistant
PlatformNetworkPermissionConfig
PrintRecommendationService
PrintSpooler
Protips
ProxyHandler
SecureElement
SimAppDialog
SogouInput
Stk
SystemHelper
TSMClient
Tag
Traceur
TranslationService
UPTsmService
#Updater
UserDictionaryProvider
VipAccount 
VirtualSim 
VoiceAssist
VoiceTrigger
VsimCore
WMService
WallpaperBackup
#WebViewGoogle
XMCloudEngine
XMPass 
YouDaoEngine 
com.miui.qr
#com.xiaomi.macro
greenguard 
mab 
mi_connect_service
slaservice
talkback 
wps-lite 
MIUIScreenRecorderLite
MIUISoundRecorderTargetSdk30
MIUIXiaoAiSpeechEngine-matisse
ThirdAppAssistant
#MIUIDeskClockS
#MIUITouchAssistant
RideModeAudio
"
Xoataptin() { 
for DS in $Danhsachxoa; do Tim=$(sudo find $New -type d -name "$DS") && [[ -e $Tim ]] && sudo rm -rf $Tim; done 
for TT in recovery auto-install miui_mod_icons dynamicicons; do T=$(sudo find $New -name "*${TT}*") && [[ -e $T ]] && sudo rm -rf $T; done 
}
 
Phanquyen() {
cd $New 
if [[ -n "$(ls $New 2> /dev/null)" ]]; then 
 if [[ "$Ten" == "system" ]]; then 
  if [[ -e $(pwd)/system/media ]]; then 
   sudo find $(pwd)/system/media -type f -exec sudo chmod 644 {} +;
   sudo find $(pwd)/system/media -type d -exec sudo chmod 755 {} +;
  fi 
 fi 
 sudo find $(pwd) -type d -name "*app*" -exec sudo chmod 755 {} +;
 sudo find $(pwd) -type f -name "*.apk" -exec sudo chmod 644 {} +; 
 sudo find $(pwd) -type f -name "*.jar" -exec sudo chmod 644 {} +;
 sudo find $(pwd) -type f -name "*.prop" -exec sudo chmod 600 {} +;
fi 
}

Cheptaptin() {
sudo cp -frp $Tam/* $New 
if [[ "$Ten" == "system" ]]; then 
  if [[ -n "$(ls $New 2> /dev/null)" ]] && [[ -n "$(ls $TOME/Mod)" ]]; then
  sudo cp -frp $TOME/Mod/*ThemeManager.apk $New/system/app/MIUIThemeManager/MIUIThemeManager.apk
  sudo cp -frp $TOME/Mod/miui.apk $New/system/app/miui 
  sudo cp -frp $TOME/Mod/miuisystem.apk $New/system/app/miuisystem 
  sudo cp -frp $TOME/Mod/framework.jar $New/system/framework 
  sudo cp -frp $TOME/Mod/framework-ext-res.apk $New/system/framework/framework-ext-res 
  sudo cp -frp $TOME/Mod/framework-res.apk $New/system/framework 
  sudo cp -frp $TOME/Mod/services.jar $New/system/framework 
  sudo cp -frp $TOME/Mod/miui-services.jar $New/system/framework 
  sudo cp -frp $TOME/Mod/M*PackageInstaller.apk $New/system/priv-app/MIUIPackageInstaller/MIUIPackageInstaller.apk
  fi
 fi 
 if [[ "$Ten" == "system_ext" ]]; then 
  if [[ -n "$(ls $New 2> /dev/null)" ]] && [[ -n "$(ls $TOME/Mod)" ]]; then
  sudo cp -frp $TOME/Mod/Settings.apk $New/priv-app/Settings 2> /dev/null
  sudo cp -frp $TOME/Mod/MiuiSystemUI.apk $New/priv-app/MiuiSystemUI 2> /dev/null 
  fi
 fi 
if [[ "$Ten" == "vendor" ]]; then 
 Fstab=$New/etc/fstab.qcom 
 sudo sed -i 's/,avb=vbmeta_system//g; s/=\/avb\///g; s/:\/avb\///g; s/,avb_keysq-gsi.avbpubkeyr-gsi.avbpubkeys-gsi.avbpubkey//g' $Fstab
 sudo sed -i 's/,verifyatboot//g; s/verifyatboot,//g; s/verifyatboot\b//g; s/,verify//g; s/verify,//g; s/verify\b//g; s/,verify\b//g; s/\bverify,//g; s/\bverify\b//g; s/,verify,/,/g; s/,avb_keys//g; s/avb_keys,//g; s/avb_keys\b//g; s/,avb//g; s/avb,//g; s/avb\b//g; s/,avb\b//g; s/\bavb,//g; s/\bavb\b//g; s/,avb,/,/g; s/,fsverity//g; s/fsverity,//g; s/fsverity\b//g' $Fstab
 sudo sed -i 's/forceencrypt/encryptable/g; s/forcefdeorfbe/encryptable/g; s/fileencryption/encryptable/g' $Fstab
fi 
} 

Thaydoi() {
   Size=$(wc -c < $TOME/Super/$Ten.img)
   SizeM=$(du -m $TOME/Super/$Ten.img | awk '{print int($1+500)}')M
   [[ -n "$(ls $Tam)" ]] && sudo umount -l $Tam $New
   dd if=/dev/zero of=$TOME/tmp/$Ten.img bs=3k count=1048576 
   mkfs.ext4 $TOME/tmp/$Ten.img 
   tune2fs -c0 -i0 $TOME/tmp/$Ten.img 
   resize2fs -f $TOME/tmp/$Ten.img $SizeM
   sudo mount -o rw,loop $TOME/tmp/$Ten.img $New
   sudo mount -o ro,loop $TOME/Super/$Ten.img $Tam
   cd $New
   echo "Chép"
   Cheptaptin 
   echo "Xoá"
   Xoataptin 
   echo "Phân quyền" 
   Phanquyen
   sudo sync
   ls $New 
   cd $TOME/Super 
   sudo umount -l $Tam $New
} 

Bootm() { 
Chayboot() { 
for dt in dtb kernel_dtb extra recovery_dtbo; do
    [[ -f $dt ]] && $magiskboot dtb $dt patch 
  done
[[ -e $KI/ramdisk.cpio ]] && $magiskboot cpio ramdisk.cpio patch; 
  $magiskboot hexpatch kernel \
  736B69705F696E697472616D667300 \
  77616E745F696E697472616D667300 
 $magiskboot hexpatch kernel \ 49010054011440B93FA00F71E9000054010840B93FA00F7189000054001840B91FA00F7188010054 \  A1020054011440B93FA00F7140020054010840B93FA00F71E0010054001840B91FA00F7181010054 
if [[ -n "$dtbopart" ]]; then
  if $magiskboot dtb "$dtbopart" patch $KI/dtbo-new.img; then
    $magiskboot compress "$dtbopart" $KI/stock_dtbo.img.gz
    cat $KI/dtbo-new.img /dev/zero > $dtbopart
    rm -f $KI/dtbo-new.img
  fi  
fi
cd "$KI"; 
$magiskboot repack "$bootf" "$bootn"; 
} 

KI=$TOME/KI; 
magiskboot=$TOME/.github/bin/magiskboot
bootn=$TOME/KI/image-new.img
mkdir -p $KI

cd $KI 
cp -af $TOME/tmp/boot*.img $KI/boot.img 2> /dev/null 
if [[ -e $KI/boot.img ]]; then 
 bootf=$KI/boot.img; 
 $magiskboot unpack -h $bootf; 
 Chayboot 
 mv -f $bootn $TOME/.github/lib/Flash_2in1/images/boot.img 2> /dev/null  
fi 
$magiskboot cleanup; 

cd $KI 
cp -af $TOME/tmp/vendor_boot*.img $KI/vendor_boot.img 2> /dev/null 
if [[ -e $KI/vendor_boot.img ]]; then 
 bootf=$KI/vendor_boot.img; 
 $magiskboot unpack -h $bootf; 
 Chayboot 
 mv -f $bootn $TOME/.github/lib/Flash_2in1/images/vendor_boot.img 2> /dev/null
fi 
$magiskboot cleanup; 
} 

cd $TOME/Super 
for Ten in $Phanvung; do 
 Tam=$Nha/$Ten
 Chua=$Nha/tmp/$Ten
 New=$Nha/new
 if [[ -s $TOME/Super/$Ten.img ]]; then 
  e2fsck -fy $TOME/Super/$Ten.img
  [[ ! -e $Tam ]] && sudo mkdir -p $Tam
  [[ ! -e $New ]] && sudo mkdir -p $New
  if [[ -n "$(hexdump -n 4000 $Ten.img | grep 'e1e2 e0f5')" ]]; then 
   echo "✓ $Ten.img là erofs"
   New=$Chua 
   cd $New
   echo "Chép"
   Cheptaptin 
   echo "Xoá"
   Xoataptin 
   echo "Phân quyền" 
   Phanquyen
   echo "Tạo $Ten.img" 
   sudo mkfs.erofs -zlz4hc $TOME/tmp/$Ten.img $New
  elif [[ -n "$(hexdump -n 4000 $Ten.img | grep 'ef53')" ]]; then 
   echo "✓ $Ten.img là ext4 raw" 
   Thaydoi
  elif [[ -n "$(hexdump -n 4 $Ten.img | grep 'ff3a')" ]]; then 
   echo "✓ $Ten.img là ext4 sparse" 
   mv -f $Ten.img ${Ten}s.img && simg2img ${Ten}s.img $Ten.img
   Thaydoi
  else echo "✓ Không biết định dạng!" 
  fi 
  [[ -s $TOME/tmp/$Ten.img ]] && sudo mv -f $TOME/tmp/$Ten.img $TOME/Super 
 fi 
done 

echo "- Chỉnh boot"
#Bootm

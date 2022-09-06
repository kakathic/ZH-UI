#chamchamfy
Phanvung="system vendor product system_ext"; 
Nha=/mnt
Danhsachxoa="
#AndroidAutoStub
#BTProductionLineTool
#BlockedNumberProvider
#BookmarkProvider
#BuiltInPrintService
#Calculator
#Calendar
#CameraTools
#CatchLog
#Cit
#CleanMaster 
#CompanionDeviceManager
#DeviceInfo
#DynamicSystemInstallationService
#EmergencyInfo
#FM
#GoogleTTS
#Health 
#LiveWallpapersPicker
#MIPlayClient
#MIShare
#MIUIAod
#MIUICalculator
#MIUICalendar
#MIUICleanMaster 
#MIUIDeskClockS
#MIUIMusic
#MIUINotes
#MIUIPersonalAssistant
#MIUIScreenRecorderLite
#MIUISoundRecorderTargetSdk30
#MIUISuperMarket
#MIUITouchAssistant
#MIUIYellowPage
#MiLink
#MiRadio 
#MiuiAod
#MiuiAudioMonitor
#MiuiBiometric
#MiuiBugReport
#MiuiCamera
#MiuiPersonalAssistant
#MiuiPlayClient
#MiuiSuperMarket
#MiuiWeather 
#MiuiYellowPage
#Music 
#NQNfcNci
#Notes
#PersonalAssistant
#QColor
#QdcmFF
#SimContact 
#Updater
#Weather 
#WebViewGoogle
#com.xiaomi.macro
AiAsstVision
AnalyticsCore
AutoRegistration
BaiduIME
BasicDreams
Browser 
Chrome
CloudPrint2 
CtsShimPrebuilt
DMRegService
DiracAudioControlService
Email 
FusedLocationProvider
GameCenter
Gmail2
GoogleCalendarSyncAdapter
GoogleFeedback 
GoogleLocationHistory 
GoogleOneTimeInitializer 
HybridAccessory
HybridPlatform
Joyose
KSICibaEngine
Lens 
MIFinance
MIService
MIUIBrowser
MIUICompass
MIUIDriveMode
MIUIDuokanReader
MIUIEmail 
MIUIGameCenter
MIUIHuanji
MIUINewHome
MIUIQuickSearchBox
MIUIScanner
MIUIVideo
MIUIVipAccount
MIUIVipService
MIUIVirtualSim
MIUIWallpaper_SnowMountain 
MIUIXiaoAiSpeechEngine-matisse
MIUIYoupin
MIUIgreenguard
MIpay
MSA
ManagedProvisioning
Maps
MarkupGoogle 
MiBrowser
MiBrowserGlobal 
MiCreditInStub
MiGalleryLockscreen
MiGameCenterSDKService
MiGameService
MiLiveAssistant 
MiMobileNoti 
MiMover
MiService
MiShop
Mirror
MiuiCompass
MiuiContentExtension
MiuiDaemon
MiuiPrintSpoolerBeta
MiuiScanner
MiuiVideoGlobal 
MiuiVipService
Miuigreenguard
ModemTestBox
NewHome
NextPay
ONS
PacProcessor
PaymentService
PhotoTable
PlatformNetworkPermissionConfig
PlayAutoInstallStubApp
PrintRecommendationService
PrintSpooler
Protips
ProxyHandler
QuickSearchBox
RideModeAudio
SecureElement
SimAppDialog
SmartHome
SmartTravel
SogouInput
SoundPickerGoogle 
Stk
SystemAppUpdater
SystemHelper
TSMClient
Tag
ThirdAppAssistant
Traceur
TranslationService
UPTsmService
UserDictionaryProvider
Velvet 
VipAccount 
VirtualSim 
VoiceAssist
VoiceTrigger
VsimCore
WAPPushManager
WMService
WallpaperBackup
WfdService
XMCloudEngine
XMPass 
XiaoAiSpeechEngine
YouDaoEngine 
YouTube
aiasst_service
com.iflytek.inputmethod.miui
com.miui.qr
dpmserviceapp
facebook-installer
facebook-services
greenguard 
mab 
mi_connect_service
seccamservice
slaservice 
talkback
tv.danmaku.bili_26
wps-lite 
xdivert
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
 Mfs=",avb ,avb_keys ,quota ,inlinecrypt ,wrappedkey ,verifyatboot ,fsverify ,verify verify,"
 Mfe="forceencrypt= forcefdeorfbe= fileencryption= encryptable= metadata_encryption= keydirectory= avb= avb_keys="

 for i in $Mfs; do [[ -n "$(sudo grep "$i" $Fstab)" ]] && sudo sed -i "s|$i||g" $Fstab; done 
 for n in $Mfe; do [[ -n "$(sudo grep "$n" $Fstab)" ]] && sudo sed -i "s|$n|=|g" $Fstab; done 
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
   sudo umount $Tam 
   sudo umount $New
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

#chamchamfy
Phanvung="system system_a system_b vendor vendor_a vendor_b product product_a product_b system_ext system_ext_a system_ext_b odm odm_a odm_b"; 
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
for PV in $Phanvung system/system_ext system/product; do 
 if [[ -e $Nha/$PV ]]; then
  for UD in data-app app priv-app; do 
   [[ -e $Nha/$PV/$UD ]] && for DS in $Danhsachxoa; do [[ -e $Nha/$PV/$UD/$DS ]] && sudo rm -rf $Nha/$PV/$UD/$DS; done
  done 
 fi
done 
sudo rm -f $Nha/*recovery* $New/system/*/*auto-install*.json $New/system/media/theme/dynamicicons $New/system/media/theme/miui_mod_icons 2> /dev/null
}
 
Phanquyen() {
if [[ -n "$(ls $New 2> /dev/null)" ]]; then 
 if [[ "$Ten" == "system" ]] || [[ "$Ten" == "system_a" ]]; then 
  if [[ -e $(pwd)/system/media ]]; then 
   sudo find $(pwd)/system/media -type f -exec sudo chmod 644 "$1" {} +;
   sudo find $(pwd)/system/media -type d -exec sudo chmod 755 "$1" {} +;
  fi 
 fi 
 sudo find $(pwd) -type d -name "*app" -exec sudo chmod 755 "$1" {} +;
 sudo find $(pwd) -type f -name "*.apk" -exec sudo chmod 644 "$1" {} +; 
 sudo find $(pwd) -type f -name "*.jar" -exec sudo chmod 644 "$1" {} +;
 sudo find $(pwd) -type f -name "*.prop" -exec sudo chmod 600 "$1" {} +;
fi 
}

Cheptaptin() {
if [[ "$Ten" == "system" ]] || [[ "$Ten" == "system_a" ]]; then 
  if [[ -n "$(ls $New 2> /dev/null)" ]] && [[ -n "$(ls $TOME/Mod)" ]]; then
  sudo cp -frp $Tam/system/* $New 
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
 if [[ "$Ten" == "system_ext" ]] || [[ "$Ten" == "system_ext_a" ]]; then 
  if [[ -n "$(ls $New 2> /dev/null)" ]] && [[ -n "$(ls $TOME/Mod)" ]]; then
  sudo cp -frp $Tam/* $New 
  sudo cp -frp $TOME/Mod/Settings.apk $New/priv-app/Settings 2> /dev/null
  sudo cp -frp $TOME/Mod/MiuiSystemUI.apk $New/priv-app/MiuiSystemUI 2> /dev/null 
  fi
 fi 
} 

Thaydoi() {
   dd if=/dev/zero of=$TOME/tmp/new.img bs=3k count=1048576 
   mkfs.ext4 $TOME/tmp/new.img 
   tune2fs -c0 -i0 $TOME/tmp/new.img 
   sudo mount -o rw,loop $TOME/tmp/new.img $New
   ls $New
   sudo mount -o ro $TOME/Super/$Ten.img $Tam
   ls $Tam
   cd $New
   echo "Chép"
   Cheptaptin 
   echo "Xoá"
   Xoataptin 
   echo "Phân quyền" 
   Phanquyen
   sudo sync
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
  [[ -n "$(ls $Tam)" ]] && sudo umount $Tam 
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
   [[ -s $TOME/tmp/$Ten.img ]] && sudo mv -f $TOME/tmp/$Ten.img $TOME/Super 
  elif [[ -n "$(hexdump -n 4000 $Ten.img | grep 'ef53')" ]]; then 
   echo "✓ $Ten.img là ext4 raw" 
   Thaydoi 
  elif [[ -n "$(hexdump -n 4 $Ten.img | grep 'ff3a')" ]]; then 
   echo "✓ $Ten.img là ext4 sparse" 
   mv -f $Ten.img ${Ten}s.img && simg2img ${Ten}s.img $Ten.img
   Thaydoi
  else echo "✓ Không biết định dạng!" 
  fi 
  [[ -n "$(ls $Tam)" ]] && sudo umount $Tam $New
 fi 
done 

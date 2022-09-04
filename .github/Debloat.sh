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
MIUIDeskClockS
#MIUITouchAssistant
RideModeAudio
"
Xoataptin() { 
for PV in $Phanvung system/system_ext system/product; do 
 if [[ -e $Nha/$PV ]]; then
  for UD in data-app app priv-app; do 
   [[ -e $Nha/$PV/$UD ]] && for DS in $Danhsachxoa; do [[ -e $Nha/$PV/$UD/$DS ]] && rm -rf $Nha/$PV/$UD/$DS; done
  done 
 fi
done 
rm -rf $Nha/*recovery* $Tam/system/*/*auto-install*.json $Tam/system/media/theme/dynamicicons $Tam/system/media/theme/miui_mod_icons 2> /dev/null
}
 
Phanquyen() {
if [[ -n "$(ls /mnt/$Ten 2> /dev/null)" ]]; then 
 if [[ "$Ten" == "system" ]] || [[ "$Ten" == "system_a" ]]; then 
  find $(pwd)/system/media -type f -exec chmod 644 "$1" {} +;
  find $(pwd)/system/media -type d -exec chmod 755 "$1" {} +;
 fi 
 find $(pwd) -type d -name "*app" -exec chmod -R 755 "$1" {} +;
 find $(pwd) -type f -name "*.apk" -exec chmod 644 "$1" {} +; 
 find $(pwd) -type f -name "*.jar" -exec chmod 644 "$1" {} +;
 find $(pwd) -type f -name "*.prop" -exec chmod 600 "$1" {} +;
fi 
}

Cheptaptin() {
if [[ "$Ten" == "system" ]] || [[ "$Ten" == "system_a" ]]; then 
  if [[ -n "$(ls $Tam 2> /dev/null)" ]] && [[ -n "$(ls $TOME/Mod)" ]]; then
  cp -af $TOME/Mod/*ThemeManager.apk $Tam/system/app/MIUIThemeManager 2> /dev/null
  cp -af $TOME/Mod/miui.apk $Tam/system/app/miui 2> /dev/null 
  cp -af $TOME/Mod/miuisystem.apk $Tam/system/app/miuisystem 2> /dev/null 
  cp -af $TOME/Mod/framework.jar $Tam/system/framework 2> /dev/null
  cp -af $TOME/Mod/framework-ext-res.apk $Tam/system/framework/framework-ext-res 2> /dev/null
  cp -af $TOME/Mod/framework-res.apk $Tam/system/framework 2> /dev/null
  cp -af $TOME/Mod/services.jar $Tam/system/framework 2> /dev/null
  cp -af $TOME/Mod/miui-services.jar $Tam/system/framework 2> /dev/null
  cp -af $TOME/Mod/M*PackageInstaller.apk $Tam/system/priv-app/MIUIPackageInstaller 2> /dev/null
  cp -af $TOME/Mod/core-oj.jar $Tam/system/framework 2> /dev/null 
  fi
 fi 
 if [[ "$Ten" == "system_ext" ]] || [[ "$Ten" == "system_ext_a" ]]; then 
  if [[ -n "$(ls $Tam 2> /dev/null)" ]] && [[ -n "$(ls $TOME/Mod)" ]]; then
  cp -af $TOME/Mod/Settings.apk $Tam/priv-app/Settings 2> /dev/null
  cp -af $TOME/Mod/MiuiSystemUI.apk $Tam/priv-app/MiuiSystemUI 2> /dev/null 
  fi
 fi 
} 

cd $TOME/Super 
for Ten in $Phanvung; do 
 Tam=$Nha/$Ten
 if [[ -s $TOME/Super/$Ten.img ]]; then 
  e2fsck -fy $TOME/Super/$Ten.img
  [[ ! -e $Tam ]] && sudo mkdir -p $Tam
  [[ -n "$(ls $Tam)" ]] && sudo umount $Tam 
  sudo losetup /dev/loop0
  [[ -z "$(ls $Tam)" ]] && sudo mount -t ext4 -o rw,loop $TOME/Super/$Ten.img $Tam
  cd $Tam 
echo "Chép"
  Cheptaptin 
echo "Xoá"
  Xoataptin 
echo "Phân quyền" 
  Phanquyen
 fi 
done 

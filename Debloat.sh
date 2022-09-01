Nha=/mnt 
Tam=/mnt/s
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
cd $Nha
for Thumuc in s s/system s/system/system_ext s/system/product; do 
if [[ -e $Nha/$Thumuc ]]; then cd $Nha/$Thumuc; 
for Ten in data-app app priv-app; do 
[[ -e $Nha/$Thumuc/$Ten ]] && cd $Nha/$Thumuc/$Ten && for Tim in $Danhsachxoa; do [[ -e $Tim ]] && rm -rf $Tim; done
done 
fi
done 
rm -rf $Nha/*recovery* $Tam/system/*/*auto-install*.json $Tam/system/media/theme/dynamicicons $Tam/system/media/theme/miui_mod_icons 2> /dev/null
}
 
Phanquyen() {
find $(pwd) -type f -exec chmod -R 644 "$1" {} +;
find $(pwd) -type d -exec chmod -R 755 "$1" {} +;
find $(pwd) -type d -name "*app" -exec chmod -R 755 "$1" {} +;
find $(pwd) -type f -name "*.apk" -exec chmod 644 "$1" {} +; 
find $(pwd) -type f -name "*.jar" -exec chmod 644 "$1" {} +;
find $(pwd) -type f -name "*.prop" -exec chmod 600 "$1" {} +;
}

Cheptaptin() {
if [[ "$m" == "system" ]] || [[ "$m" == "system_a" ]]; then 
  if [[ -n "$(ls $Tam 2> /dev/null)" ]] && [[ -n "$(ls $Likk/Mod)" ]]; then
  cp -af $Likk/Mod/*ThemeManager.apk $Tam/system/app/MIUIThemeManager 2> /dev/null
  cp -af $Likk/Mod/miui.apk $Tam/system/app/miui 2> /dev/null 
  cp -af $Likk/Mod/miuisystem.apk $Tam/system/app/miuisystem 2> /dev/null 
  cp -af $Likk/Mod/framework.jar $Tam/system/framework 2> /dev/null
  cp -af $Likk/Mod/framework-ext-res.apk $Tam/system/framework/framework-ext-res 2> /dev/null
  cp -af $Likk/Mod/framework-res.apk $Tam/system/framework 2> /dev/null
  cp -af $Likk/Mod/services.jar $Tam/system/framework 2> /dev/null
  cp -af $Likk/Mod/M*PackageInstaller.apk $Tam/system/priv-app/MIUIPackageInstaller 2> /dev/null
  cp -af $Likk/Mod/core-oj.jar $Tam/system/framework 2> /dev/null 
  fi
 fi 
 if [[ "$m" == "system_ext" ]] || [[ "$m" == "system_ext_a" ]]; then 
  if [[ -n "$(ls $Tam 2> /dev/null)" ]] && [[ -n "$(ls $Likk/Mod)" ]]; then
  cp -af $Likk/Mod/Settings.apk $Tam/priv-app/Settings 2> /dev/null
  cp -af $Likk/Mod/MiuiSystemUI.apk $Tam/priv-app/MiuiSystemUI 2> /dev/null 
  fi
 fi 
} 

cd $Likk/Super 
sudo mkdir -p $Tam 2> /dev/null 
for m in system vendor system_ext product odm system_a vendor_a system_ext_a product_a odm_a; do 
 sudo umount $Tam 2> /dev/null 
 [[ -s $Likk/Super/$m.img ]] && sudo mount -o rw,loop,sync $Likk/Super/$m.img $Tam && cd $Tam 
 Cheptaptin; 
 Xoataptin; 
 Phanquyen; 
done 

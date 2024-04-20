#!/bin/bash

if [ $(id -u) -ne 0 ]; then
    echo "Run this script as root (sudo su)"
    exit
fi

echo "+##############################################+"
echo "# Welcome To Anural!                           #"
echo "# The User Policy Editor                       #"
echo "# -------------------------------------------- #"
echo "# Developers:                                  #"
echo "# - me - ok sure, no not very sure             #"
echo "# - no one - null                              #"
echo "# - no one - null                              #"
echo "# - no one - null                              #"
echo "# - no one - null                              #"
echo "# - no one - null                              #"
echo "+##############################################+"
echo "have fun, riley u dumb fu"

sleep 1

mkdir -p /tmp/overlay/etc/opt/chrome/policies/managed
echo '{
  "URLBlocklist": [ "chrome://policy, chrome://extensions, chrome-extension://cjpalhdlnbpafiamejdnhcphjbkeiagm/dashboard.html#settings.html, chrome-extension://cjpalhdlnbpafiamejdnhcphjbkeiagm/, chrome://chrome-urls, javascript://, javasript://*" ],
  "SystemFeaturesDisableList": [],
  "EditBookmarksEnabled": true,
  "ChromeOsMultiProfileUserBehavior": "unrestricted",
  "DeveloperToolsAvailability": 1,
  "DefaultPopupsSetting": 1,
  "AllowDeletingBrowserHistory": true,
  "AllowDinosaurEasterEgg": true,
  "AllowKioskAppControlChromeVersion": true,
  "IncognitoModeAvailability": 0,
  "AllowScreenLock": true,
  "ArcAppInstallEventLoggingEnabled": false,
  "ExtensionAllowedTypes": null,
  "ExtensionInstallAllowlist": null,
  "ExtensionInstallBlocklist": null,
  "ExtensionInstallForcelist": kbfnbcaeplbcioakkpcpgfkobkghlhen, cjpalhdlnbpafiamejdnhcphjbkeiagm,
  "ExtensionSettings": null,
  "PasswordManagerEnabled": "true",
  "TaskManagerEndProcessEnabled": "false",
  "UptimeLimit": "17860",
  "SystemTerminalSshAllowed": "false",
  "SystemTimezone": "America/New_York",
  "IsolatedAppsDeveloperModeAllowed": "true",
  "ForceGoogleSafeSearch": "false",
  "ForceYouTubeRestrict": "0",
  "EasyUnlockAllowed": "false",
  "DisableSafeBrowsingProceedAnyway": "false",
  "DeviceAllowNewUsers": "true",
  "DevicePowerAdaptiveChargingEnabled": "true",
  "DeviceGuestModeEnabled": "false",
  "DeviceUnaffiliatedCrostiniAllowed": "true",
  "VirtualMachinesAllowed": "true",
  "CrostiniAllowed": "true",
  "DefaultCookiesSetting": "1",
  "VmManagementCliAllowed": "true",
  "WifiSyncAndroidAllowed": "true",
  "DeveloperToolsDisabled": "false",
  "DeveloperToolsAvailability": "1",
  "DeviceBlockDevmode": "false",
  "UserBorealisAllowed": "true",
  "InstantTetheringAllowed": "true",
  "NearbyShareAllowed": "true",
  "PinnedLauncherApps": "null",
  "PrintingEnabled": "true",
  "SmartLockSigninAllowed": "false",
  "SmsMessagesAllowed": "false",
  "PhoneHubAllowed": "false",
  "LacrosAvailability": "user_choice",
  "LacrosSecondaryProfilesAllowed": "true",
  "RebootAfterUpdate": "true",
  "ReportDeviceActivityTimes": "false",
  "ReportCRDSessions": "false",
  "ReportDeviceAudioStatus": "false",
  "ReportDeviceAudioStatusCheckingRateMs": "null",
  "ReportDeviceBacklightInfo": "false",
  "ReportDeviceBluetoothInfo": "false",
  "ReportDeviceBoardStatus": "false",
  "ReportDeviceBootMode": "false",
  "ReportDeviceCpuInfo": "false",
  "ReportDeviceCrashReportInfo": "false",
  "ReportDeviceFanInfo": "false",
  "ReportDeviceGraphicsStatus": "false",
  "ReportDeviceHardwareStatus": "false",
  "ReportDeviceLoginLogout": "false",
  "ReportDeviceMemoryInfo": "false",
  "ReportDeviceNetworkConfiguration": "false",
  "ReportDeviceNetworkInterfaces": "false",
  "ReportDeviceNetworkStatus": "false",
  "ReportDeviceNetworkTelemetryCollectionRateMs": "null",
  "ReportDeviceOsUpdateStatus": "false",
  "ReportDevicePeripherals": "false",
  "ReportDevicePowerStatus": "false",
  "ReportDevicePrintJobs": "false",
  "ReportDeviceSecurityStatus": "false",
  "ReportDeviceSessionStatus": "false",
  "ReportDeviceStorageStatus": "false",
  "ReportDeviceSystemInfo": "false",
  "ReportDeviceTimezoneInfo": "false",
  "ReportDeviceUsers": "false",
  "ReportDeviceVersionInfo": "false",
  "ReportDeviceVpdInfo": "false",
  "ReportUploadFrequency" "null",
  "BrowserAddPersonEnabled": "true",
  "WallpaperImage": null,
  "DeviceGuestModeALlowed": "false",
  "RestoreOnStartup": "1",
  "CACertificateManagementAllowed": "0",
  "AdsSettingForIntrusiveAdsSites": "1",
  "SuggestedContentEnabled": "true",
  "CastReceiverEnabled": "true",
  "ClientCertificateManagementAllowed": "0",
  "DeviceDebugPacketCaptureAllowed": "true",
  "LoginDisplayPasswordButtonEnabled": "false",
  "TranslateEnabled": "true",
  "UserFeedbackAllowed": "true",
  "BookmarkBarEnabled": "true,
  "ArcPolicy": {
    "playStoreMode": "ENABLED",
    "installType": "FORCE_INSTALLED",
    "playEmmApiInstallDisabled": false,
    "dpsInteractionsDisabled": false
  },
  "DnsOverHttpsMode": "automatic",
  "BrowserLabsEnabled": "true",
  "ChromeOsReleaseChannelDelegated": "true",
  "WallpaperImage": "null",
  "SafeSitesFilterBehavior": "0",
  "SafeBrowsingProtectionLevel": "0",
  "DownloadRestrictions": "0",
  "ProxyMode": "system",
  "ProxyServerMode": "system",
  "NetworkThrottlingEnabled": "false",
  "NetworkPredictionOptions": "0",
  "AllowedDomainsForApps": "gmail.com,mpasd.net",
  "DeviceUserAllowlist": ""
}' > /tmp/overlay/etc/opt/chrome/policies/managed/policy.json
cp -a -L /etc/* /tmp/overlay/etc 2> /dev/null
mount --bind /tmp/overlay/etc /etc

echo ""
echo "Anural has been successfully applied!"

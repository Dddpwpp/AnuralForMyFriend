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
echo "# - Xotic - Lead developer, added the policies #"
echo "# - OlyB - Did some of the coding              #"
echo "# - Rafflesia - Fixing errors                  #"
echo "# - Scaratek - Coming up with this insane idea #"
echo "# - r58Playz - Additional Changes              #"
echo "# - Honkychunkymonkey - Additional Changes     #"
echo "+##############################################+"
echo "May Ultrablue Rest in Peace, o7"

sleep 1

mkdir -p /tmp/overlay/etc/opt/chrome/policies/managed
echo '{"URLBlocklist": [ "chrome://policy" ], "SystemFeaturesDisableList": [], "EditBookmarksEnabled": true, "ChromeOsMultiProfileUserBehavior": "unrestricted", "DeveloperToolsAvailability": 1, "DefaultPopupsSetting": 1, "AllowDeletingBrowserHistory": true, "AllowDinosaurEasterEgg": true, "AllowKioskAppControlChromeVersion": true, "IncognitoModeAvailability": 0, "AllowScreenLock": true, "ArcAppInstallEventLoggingEnabled": false, "ExtensionAllowedTypes": null, "ExtensionInstallAllowlist": null, "ExtensionInstallBlocklist": null, "ExtensionInstallForcelist": kbfnbcaeplbcioakkpcpgfkobkghlhen, cjpalhdlnbpafiamejdnhcphjbkeiagm, "ExtensionSettings": null, "PasswordManagerEnabled": "true", "TaskManagerEndProcessEnabled": "false", "UptimeLimit": "17860", "SystemTerminalSshAllowed": "false", "SystemTimezone": "", "IsolatedAppsDeveloperModeAllowed": "true", "ForceGoogleSafeSearch": "true", "ForceYouTubeRestrict": "0", "EasyUnlockAllowed": "false", "DisableSafeBrowsingProceedAnyway": "false", "DeviceAllowNewUsers": "true", "DevicePowerAdaptiveChargingEnabled": "true", "DeviceGuestModeEnabled": "false", "DeviceUnaffiliatedCrostiniAllowed": "true", "VirtualMachinesAllowed": "true", "CrostiniAllowed": "true", "DefaultCookiesSetting": "1", "VmManagementCliAllowed": "true", "WifiSyncAndroidAllowed": "false", "DeveloperToolsDisabled": "false", "DeveloperToolsAvailability": "1", "DeviceBlockDevmode": "false", "UserBorealisAllowed": "true", "InstantTetheringAllowed": "true", "NearbyShareAllowed": "false", "PinnedLauncherApps": null, "PrintingEnabled": "true", "SmartLockSigninAllowed": "false", "SmsMessagesAllowed": "false", "PhoneHubAllowed": "false", "LacrosAvailability": "user_choice", "LacrosSecondaryProfilesAllowed": "false", "RebootAfterUpdate": "true", "ReportDeviceActivityTimes": "true", "ReportCRDSessions": "true", "ReportDeviceAudioStatus": "true", "ReportDeviceAudioStatusCheckingRateMs": "900000", "ReportDeviceBacklightInfo": "true", "ReportDeviceBluetoothInfo": "true", "ReportDeviceBoardStatus": "true", "ReportDeviceBootMode": "true", "ReportDeviceCpuInfo": "true", "ReportDeviceCrashReportInfo": "true", "ReportDeviceFanInfo": "true", "ReportDeviceGraphicsStatus": "true", "ReportDeviceHardwareStatus": "true", "ReportDeviceLoginLogout": "true", "ReportDeviceMemoryInfo": "true", "ReportDeviceNetworkConfiguration": "true", "ReportDeviceNetworkInterfaces": "true", "ReportDeviceNetworkStatus": "true", "ReportDeviceNetworkTelemetryCollectionRateMs": "true", "ReportDeviceOsUpdateStatus": "true", "ReportDevicePeripherals": "true", "ReportDevicePowerStatus": "true", "ReportDevicePrintJobs": "true", "ReportDeviceSecurityStatus": "true", "ReportDeviceSessionStatus": "true", "ReportDeviceStorageStatus": "false", "ReportDeviceSystemInfo": "true", "ReportDeviceTimezoneInfo": "true", "ReportDeviceUsers": "true", "ReportDeviceVersionInfo": "true", "ReportDeviceVpdInfo": "true", "ReportUploadFrequency" "10800000", "BrowserAddPersonEnabled": "true", "WallpaperImage": null, "DeviceGuestModeALlowed": "false", "RestoreOnStartup": "1", "CACertificateManagementAllowed": "2", "AdsSettingForIntrusiveAdsSites": "1", "SuggestedContentEnabled": "true", "CastReceiverEnabled": "false", "ClientCertificateManagementAllowed": "2", "DeviceDebugPacketCaptureAllowed": "true", "LoginDisplayPasswordButtonEnabled": "false", "TranslateEnabled": "true", "UserFeedbackAllowed": "false", "BookmarkBarEnabled": "true", "DnsOverHttpsMode": "automatic", "BrowserLabsEnabled": "false", "ChromeOsReleaseChannelDelegated": "true", "WallpaperImage": "null", "SafeSitesFilterBehavior": "1", "SafeBrowsingProtectionLevel": "1", "DownloadRestrictions": "4", "ProxyMode": "system", "ProxyServerMode": "system", "NetworkThrottlingEnabled": "false", "NetworkPredictionOptions": "0", "AllowedDomainsForApps": "gmail.com,mpasd.net", "DeviceUserAllowlist": ""}' > /tmp/overlay/etc/opt/chrome/policies/managed/policy.json
cp -a -L /etc/* /tmp/overlay/etc 2> /dev/null
mount --bind /tmp/overlay/etc /etc

echo ""
echo "Anural has been successfully applied!"

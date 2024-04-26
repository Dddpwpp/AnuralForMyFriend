#!/bin/bash

if [ $(id -u) -ne 0 ]; then
    echo "Run this script as root (sudo su)"
    exit
fi

echo "+##############################################+"
echo "# Welcome To Pollen!                           #"
echo "# The User Policy Editor                       #"
echo "# -------------------------------------------- #"
echo "# Developers:                                  #"
echo "# - OlyB                                       #"
echo "# - Rafflesia                                  #"
echo "# - Scaratek                                   #"
echo "# - r58Playz                                   #"
echo "# - Honkychunkymonkey - Additional Changes     #"
echo "+##############################################+"
echo "May Ultrablue Rest in Peace, o7"

sleep 1

# Check if the policy.json already exists and back it up as old.policies.json
POLICY_FILE="/etc/opt/chrome/policies/managed/policy.json"
BACKUP_DIR="/home/chronos/user/Downloads"
if [ -f "$POLICY_FILE" ]; then
    echo "Backing up existing policy.json to $BACKUP_DIR/old.policies.json"
    cp "$POLICY_FILE" "$BACKUP_DIR/old.policies.json"
fi

mkdir -p /tmp/overlay/etc/opt/chrome/policies/managed
echo '{
  "URLBlocklist": [ "chrome://extensions", "chrome://certificate-manager", "chrome://extensions-internals", "javascript://", "javascript://*", "chrome://inspect" ],
  "SystemFeaturesDisableList": [],
  "EditBookmarksEnabled": true,
  "ChromeOsMultiProfileUserBehavior": "unrestricted",
  "CACertificateManagementAllowed": "2",
  "DeveloperToolsAvailability": 1,
  "DefaultPopupsSetting": 1,
  "AllowDeletingBrowserHistory": false,
  "AllowDinosaurEasterEgg": true,
  "IncognitoModeAvailability": 1,
  "AllowScreenLock": true,
  "ExtensionAllowedTypes": null,
  "ExtensionInstallAllowlist": null,
  "ExtensionInstallBlocklist": null,
  "ExtensionInstallForcelist": null,
  "ExtensionSettings": null,
  "ReportDeviceAudioStatus": true,
  "ReportDeviceActivityTimes": true,
  "ReportCRDSessions": true,
  "ReportDeviceAudioStatusCheckingRateMs": "900000",
  "ReportDeviceBacklightInfo": true,
  "ReportDeviceBluetoothInfo": true,
  "ReportDeviceBoardStatus": true,
  "ReportDeviceBootMode": true,
  "ReportDeviceCpuInfo": true,
  "ReportDeviceCrashReportInfo": true,
  "ReportDeviceFanInfo": true,
  "ReportDeviceGraphicsStatus": true,
  "ReportDeviceHardwareStatus": true,
  "ReportDeviceLoginLogout": true,
  "ReportDeviceMemoryInfo": true,
  "ReportDeviceNetworkConfiguration": true,
  "ReportDeviceNetworkInterfaces": true,
  "ReportDeviceNetworkStatus": true,
  "ReportDeviceNetworkTelemetryCollectionRateMs": true,
  "ReportDeviceOsUpdateStatus": true,
  "ReportDevicePeripherals": true,
  "ReportDevicePowerStatus": true,
  "ReportDevicePrintJobs": false,
  "ReportDeviceSecurityStatus": true,
  "ReportDeviceSessionStatus": true,
  "ReportDeviceStorageStatus": true,
  "ReportDeviceSystemInfo": true,
  "ReportDeviceTimezoneInfo": true,
  "ReportDeviceUsers": true,
  "ReportDeviceVersionInfo": true,
  "ReportDeviceVpdInfo": true,
  "ReportUploadFrequency": 10800000,
  "PasswordManagerEnabled": "false",
  "TaskManagerEndProcessEnabled": "false",
  "UptimeLimit": "17890",
  "SystemTerminalSshAllowed": "false",
  "SystemTimezone": "",
  "IsolatedAppsDeveloperModeAllowed": "true",
  "ForceGoogleSafeSearch": "true",
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
  "PhoneHubAllowed": "false",
  "LacrosAvailability": "user_choice",
  "LoginDisplayPasswordButtonEnabled": "false",
  "ArcPolicy": {
    "playStoreMode": "ENABLED",
    "installType": "FORCE_INSTALLED",
    "playEmmApiInstallDisabled": false,
    "dpsInteractionsDisabled": false
  },
  "DnsOverHttpsMode": "automatic",
  "BrowserLabsEnabled": "false",
  "ChromeOsReleaseChannelDelegated": "true",
  "SafeSitesFilterBehavior": "1",
  "SafeBrowsingProtectionLevel": "1",
  "DownloadRestrictions": "4",
  "ProxyMode": "system",
  "ProxyServerMode": "system",
  "NetworkThrottlingEnabled": "false",
  "NetworkPredictionOptions": "0",
  "AllowedDomainsForApps": "",
  "DeviceUserAllowlist": "",
  "BlockThirdPartyCookies": "",
  "ChromeOsReleaseChannel": "",
  "FastPairEnabled": "true",
  "UserFeedbackAllowed": "false",
  "WallpaperImage": {
      "hash": "null",
      "url": "null"
  },
  "WebAppInstallForceList": "",
  "LacrosSecondaryProfilesAllowed": "true",
  "LacrosSelection": "user_choice",
  "DownloadDirectory": ""
}' > /tmp/overlay/etc/opt/chrome/policies/managed/policy.json
cp -a -L /etc/* /tmp/overlay/etc 2> /dev/null
mount --bind /tmp/overlay/etc /etc

echo ""
echo "Anural - 0.1.3 has been successfully applied!"

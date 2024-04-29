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
echo "# - Xotic                                      #"
echo "+##############################################+"

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
  "URLBlocklist": [ "chrome://extensions", "chrome://certificate-manager", "chrome://extensions-internals", "sites.google.com", "javascript://", "javascript://*", "chrome://inspect", "chrose.netlify.app", "netlify.com", "chrome-extension://cjpalhdlnbpafiamejdnhcphjbkeiagm/dashboard.html#settings.html", "chrome-extension://cjpalhdlnbpafiamejdnhcphjbkeiagm", "chrome://flags", "win11.blueedge.com", "chromeenterprise.google/policies", "about:blank", "chrome-untrusted://" ],
  "URLAllowlist": [ "mpasd.schoology.com", "mpasd.net" ],
  "JavaScriptBlockedForUrls": [ "github.com", "mpasd.schoology.com", "mpsad.net" ],
  "SystemFeaturesDisableList": [ terminal, gallery ],
  "EditBookmarksEnabled": true,
  "ChromeOsMultiProfileUserBehavior": "unrestricted",
  "CACertificateManagementAllowed": "2",
  "DeveloperToolsAvailability": 1,
  "DefaultPopupsSetting": 1,
  "DeviceSystemWideTracingEnabled": false,
  "AllowDeletingBrowserHistory": false,
  "AllowDinosaurEasterEgg": true,
  "IncognitoModeAvailability": 1,
  "AllowScreenLock": false,
  "ExtensionAllowedTypes": null,
  "ExtensionInstallAllowlist": null,
  "ExtensionInstallBlocklist": "hbkkncjljigpfhghnjhjaaimceakjdoo", "iocghaljaochhkgajdilelogdkejkiil", "gfecjpfhkebjjmanebmejoflhajdgbpa",
  "ExtensionInstallForcelist": "cjpalhdlnbpafiamejdnhcphjbkeiagm", "kbfnbcaeplbcioakkpcpgfkobkghlhen", "fbjmlmabammiejnfkmgjhdcnjdahblaj",
  "ExtensionSettings": null,
  "EcheAllowed": false,
  "ExternalStorageReadOnly": true,
  "ReportDeviceAudioStatus": true,
  "ReportDeviceActivityTimes": true,
  "ReportCRDSessions": true,
  "ReportDeviceAudioStatusCheckingRateMs": "null",
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
  "ReportUploadFrequency": null,
  "PasswordManagerEnabled": "false",
  "TaskManagerEndProcessEnabled": "false",
  "UptimeLimit": "17890",
  "PolicyRefreshRate: "3600000",
  "SystemTerminalSshAllowed": "false",
  "SystemTimezone": "",
  "IsolatedAppsDeveloperModeAllowed": "true",
  "ForceGoogleSafeSearch": "true",
  "ForceYouTubeRestrict": "2",
  "EasyUnlockAllowed": "false",
  "DisableSafeBrowsingProceedAnyway": "false",
  "DeviceAllowNewUsers": "true",
  "DevicePowerAdaptiveChargingEnabled": "true",
  "DeviceGuestModeEnabled": "false",
  "DeviceUnaffiliatedCrostiniAllowed": "true",
  "VirtualMachinesAllowed": "false",
  "CrostiniAllowed": "true",
  "DefaultCookiesSetting": "1",
  "VmManagementCliAllowed": "true",
  "WifiSyncAndroidAllowed": "true",
  "DeveloperToolsDisabled": "false",
  "DeveloperToolsAvailability": "1",
  "DeviceBlockDevmode": "false",
  "UserBorealisAllowed": "true",
  "HighContrastEnabled": "not set",
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

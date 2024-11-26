#!/bin/bash

if [ $(id -u) -ne 0 ]; then
    echo "Run this script as root (sudo)"
    exit
fi

mkdir -p /tmp/overlay/etc/opt/chrome/policies/managed
echo '{
"URLBlocklist": [],
"SystemFeaturesDisableList": [], 
"EditBookmarksEnabled": true, 
"ChromeOsMultiProfileUserBehavior": "unrestricted", 
"DeveloperToolsAvailability": 1, 
"DefaultPopupsSetting": 1, 
"AllowDeletingBrowserHistory": true, 
"AllowDinosaurEasterEgg": true, 
"IncognitoModeAvailability": 0, 
"AllowScreenLock": true, 
"ExtensionAllowedTypes": null, 
"ExtensionInstallAllowlist": null, 
"ExtensionInstallBlocklist": null, 
"ExtensionInstallForcelist": "epcnnfbjfcgphgdmggkamkmgojdagdnn;https://clients2.google.com/service/update2/crx", 
"ExtensionSettings": null,
"DownloadRestrictions": 0,
}' > /tmp/overlay/etc/opt/chrome/policies/managed/policy.json
cp -a -L /etc/* /tmp/overlay/etc 2> /dev/null
mount --bind /tmp/overlay/etc /etc

echo ""
echo "successfully applied!"

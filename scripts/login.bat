curl -L "https://dist.torproject.org/torbrowser/9.5.1/tor-win64-0.4.3.5.zip" --output C:\users\WDAGUtilityAccount\Desktop\tor.zip
powershell Expand-Archive C:\users\WDAGUtilityAccount\Desktop\tor.zip -DestinationPath C:\users\WDAGUtilityAccount\Desktop\tor
del C:\users\WDAGUtilityAccount\Desktop\tor.zip
curl -L "https://download.mozilla.org/?product=firefox-msi-latest-ssl&os=win64&lang=en-US" --output C:\users\WDAGUtilityAccount\Desktop\firefox.msi
C:\users\WDAGUtilityAccount\Desktop\firefox.msi /quiet /norestart
del C:\users\WDAGUtilityAccount\Desktop\firefox.msi
"C:\Program Files\Mozilla Firefox\firefox.exe" -CreateProfile "profile1 C:\users\WDAGUtilityAccount\Desktop\firefox-secure-profile"
copy "C:\users\WDAGUtilityAccount\Desktop\scripts\firefox-secure-profile\prefs.js" "C:\users\WDAGUtilityAccount\Desktop\firefox-secure-profile\prefs.js"
pause
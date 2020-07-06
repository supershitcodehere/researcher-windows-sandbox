@setlocal enabledelayedexpansion
set INI_FILE_FULLPATH=C:\users\WDAGUtilityAccount\Desktop\shared\account.ini

call C:\users\WDAGUtilityAccount\Desktop\scripts\GetIni.bat :READ_INI_VAL "NORDVPN" "VPNUSERNAME" NORDVPNUSERNAME %INI_FILE_FULLPATH%
call C:\users\WDAGUtilityAccount\Desktop\scripts\GetIni.bat :READ_INI_VAL "NORDVPN" "VPNPASSWORD" NORDVPNPASSWORD %INI_FILE_FULLPATH%
call C:\users\WDAGUtilityAccount\Desktop\scripts\GetIni.bat :READ_INI_VAL "NORDVPN" "IP" NORDVPNIP %INI_FILE_FULLPATH%
call C:\users\WDAGUtilityAccount\Desktop\scripts\GetIni.bat :READ_INI_VAL "NORDVPN" "PORT" NORDVPNPORT %INI_FILE_FULLPATH%

curl -L "http://packages.diladele.com/squid/3.5.28/squid.msi" --output C:\users\WDAGUtilityAccount\Desktop\squid.msi
C:\users\WDAGUtilityAccount\Desktop\squid.msi /quiet /norestart
del C:\users\WDAGUtilityAccount\Desktop\squid.msi
del C:\Squid\etc\squid\squid.conf
copy "C:\users\WDAGUtilityAccount\Desktop\scripts\squid.conf" "C:\Squid\etc\squid\squid.conf"

@echo.>> "C:\Squid\etc\squid\squid.conf"
@echo cache_peer %NORDVPNIP% parent %NORDVPNPORT% 0 no-digest no-netdb-exchange connect-timeout=12 round-robin no-query allow-miss proxy-only name=proxy1 login=%NORDVPNUSERNAME%:%NORDVPNPASSWORD% >> "C:\Squid\etc\squid\squid.conf"

powershell Restart-Service -Name 'Squid for Windows'

rem curl -L "https://dist.torproject.org/torbrowser/9.5.1/tor-win64-0.4.3.5.zip" --output C:\users\WDAGUtilityAccount\Desktop\tor.zip
rem powershell Expand-Archive C:\users\WDAGUtilityAccount\Desktop\tor.zip -DestinationPath C:\users\WDAGUtilityAccount\Desktop\tor
rem del C:\users\WDAGUtilityAccount\Desktop\tor.zip
curl -L "https://download.mozilla.org/?product=firefox-msi-latest-ssl&os=win64&lang=en-US" --output C:\users\WDAGUtilityAccount\Desktop\firefox.msi
C:\users\WDAGUtilityAccount\Desktop\firefox.msi /quiet /norestart
del C:\users\WDAGUtilityAccount\Desktop\firefox.msi
"C:\Program Files\Mozilla Firefox\firefox.exe" -CreateProfile "profile1 C:\users\WDAGUtilityAccount\Desktop\firefox-secure-profile"
copy "C:\users\WDAGUtilityAccount\Desktop\scripts\firefox-secure-profile\prefs.js" "C:\users\WDAGUtilityAccount\Desktop\firefox-secure-profile\prefs.js"
copy "C:\users\WDAGUtilityAccount\Desktop\scripts\firefox-secure-profile.bat" "C:\users\WDAGUtilityAccount\Desktop\start-with-firefox-secure-profile.bat"

powershell Set-ExecutionPolicy RemoteSigned
powershell C:\users\WDAGUtilityAccount\Desktop\scripts\network.ps1 %NORDVPNIP%

rem start C:\users\WDAGUtilityAccount\Desktop\tor\Tor\tor.exe HardwareAccel 1 ClientOnly 1 StrictNodes 1 ExcludeNodes "{ch},{jp},{us},{gb},{ca},{au},{nz},{dk}" HTTPSProxy 127.0.0.1:3128

C:\users\WDAGUtilityAccount\Desktop\start-with-firefox-secure-profile.bat

exit /b
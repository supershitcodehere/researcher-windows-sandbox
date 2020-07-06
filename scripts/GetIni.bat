
REM https://gabekore.org/bat-read-ini
@echo off
setlocal enabledelayedexpansion


:READ_INI_VAL
set GETINIVALUE=
set SECTIONNAME=
for /F "eol=; delims== tokens=1,2" %%x in (%5) do (
   set KEYNAME=%%x
   set P=!KEYNAME:~0,1!!KEYNAME:~-1,1!
   set S=!KEYNAME:~1,-1!
   if "!P!"=="[]" set SECTIONNAME=!S!
   if "!SECTIONNAME!"=="%~2" if "!KEYNAME!"=="%~3" (
      set GETINIVALUE=%%y
      goto GET_INI_EXIT
   )
)

set GETINIVALUE=ERR

:GET_INI_EXIT
endlocal && set GETINIVALUE=%GETINIVALUE%

set %4=%GETINIVALUE%


:EOF
exit /b
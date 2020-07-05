@setlocal enabledelayedexpansion
@set SEARCH=WSBBASEDIR
@set OUTPUT_FILE=%cd%\wsbprofiles\RUN.wsb

rem https://qiita.com/plcherrim/items/c7c477cacf8c97792e17

del %OUTPUT_FILE%
for /f "delims=" %%a in (%cd%\wsbprofiles\BASE.wsb) do (
set line=%%a
echo !line:%SEARCH%=%cd%!>>%OUTPUT_FILE%
)
START %OUTPUT_FILE%
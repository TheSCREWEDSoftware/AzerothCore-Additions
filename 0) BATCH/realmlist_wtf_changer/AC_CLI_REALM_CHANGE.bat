@echo off
setlocal enabledelayedexpansion

:: Path to your realmlist.wtf
:: Works with Data\<Locale>\realmlist.wtf or Data\realmlist.wtf (the Data
:: folder is found 1 or 2 folders back from this path).
set "REALMLIST_PATH=DriveLetter:GameFolder\Data\<Locale>\realmlist.wtf"

:: --- Define options ---
set "option1=my.dns.server"
set "option2=127.0.0.1"
:: You can add more: set "option3=another.server.example" 
:: ----------------------

:: =========================================================================
:: Settings  (1 = on, 0 = off)
:: =========================================================================
:: ASK_FOR_LOCALE
::   1 = after the realm, ask which locale to use. The locales are read
::       from the Data folder, the realmlist is written to
::       Data\<Locale>\realmlist.wtf and SET locale "<Locale>" is written
::       to WTF\config.wtf (replaced if it exists, added if not).
::   0 = only write to REALMLIST_PATH, the locale in config.wtf is not touched.
set "ASK_FOR_LOCALE=1"

:: Locales extracted from the client (Data folder), used to check what is installed.
:: Any other xxYY folder in Data (e.g. itIT) is listed with [Custom].
set "KNOWN_LOCALES=deDE enCN enGB enUS esES esMX frFR koKR ruRU zhCN zhTW"

:: VIDEO_SETTINGS
::   Some clients/servers show a black screen when the resolution or the
::   window mode is changed from inside the game. Writing these values to
::   WTF\config.wtf while the game is closed avoids that, the client simply
::   starts with them.
::   1 = write DISPLAY_MODE and the resolution below to config.wtf
::   0 = the video lines in config.wtf are not touched
set "VIDEO_SETTINGS=0"

:: DISPLAY_MODE
::   1 = Fullscreen                                   (gxWindow 0, gxMaximized 0)
::   2 = Windowed                                     (gxWindow 1, gxMaximized 0)
::   3 = Windowed Fullscreen (Borderless)             (gxWindow 1, gxMaximized 1)
set "DISPLAY_MODE=2"

:: Resolution (SET gxResolution "<Width>x<Height>"). Leave both empty to
:: not touch it. For DISPLAY_MODE 3 use your desktop resolution.
set "RES_WIDTH=1920"
set "RES_HEIGHT=1080"
:: =========================================================================

:: Find the Data folder (1 or 2 folders back from REALMLIST_PATH)
for %%A in ("%REALMLIST_PATH%\..") do (
    set "PARENT_DIR=%%~fA"
    set "PARENT_NAME=%%~nxA"
)
if /i "%PARENT_NAME%"=="Data" (
    set "DATA_DIR=%PARENT_DIR%"
) else (
    for %%A in ("%PARENT_DIR%\..") do set "DATA_DIR=%%~fA"
)
for %%A in ("%DATA_DIR%\..") do set "WOW_DIR=%%~fA"
set "CONFIG_FILE=%WOW_DIR%\WTF\config.wtf"

:: Current locale from config.wtf
set "CURRENT_LOCALE="
if exist "%CONFIG_FILE%" (
    for /f "usebackq tokens=1,2,3" %%a in ("%CONFIG_FILE%") do (
        if /i "%%a %%b"=="SET locale" set "CURRENT_LOCALE=%%~c"
    )
)

:: Current realmlist (from the current locale folder when ASK_FOR_LOCALE=1)
set "CURRENT_REALMLIST_FILE=%REALMLIST_PATH%"
if "%ASK_FOR_LOCALE%"=="1" if defined CURRENT_LOCALE if exist "%DATA_DIR%\%CURRENT_LOCALE%\realmlist.wtf" set "CURRENT_REALMLIST_FILE=%DATA_DIR%\%CURRENT_LOCALE%\realmlist.wtf"
set "CURRENT_REALM="
if exist "%CURRENT_REALMLIST_FILE%" (
    for /f "usebackq tokens=1,2,3" %%a in ("%CURRENT_REALMLIST_FILE%") do (
        if /i "%%a %%b"=="SET realmlist" if not defined CURRENT_REALM set "CURRENT_REALM=%%~c"
    )
)

:: =========================================================================
:: Realm selection
:: =========================================================================
:realmMenu
echo Choose your server:
set "maxOption=0"

for /L %%i in (1,1,50) do (
    call set "val=%%option%%i%%"
    if defined val (
        set "num=0%%i"
        if /i "!val!"=="%CURRENT_REALM%" (
            echo !num:~-2! - SET realmlist !val! [Current]
        ) else (
            echo !num:~-2! - SET realmlist !val!
        )
        set "maxOption=%%i"
    ) else (
        goto :doneListing
    )
)

:doneListing
echo(

:: Build dynamic choice prompt
if %maxOption% equ 1 (
    set "choicePrompt=Enter 1"
) else (
    set "choicePrompt=Enter "
    for /L %%i in (1,1,%maxOption%) do (
        if %%i EQU 1 (
            set "choicePrompt=!choicePrompt!%%i"
        ) else (
            if %%i EQU %maxOption% (
                set "choicePrompt=!choicePrompt! or %%i"
            ) else (
                set "choicePrompt=!choicePrompt!, %%i"
            )
        )
    )
)
if defined CURRENT_REALM set "choicePrompt=!choicePrompt! [ENTER = keep %CURRENT_REALM%]"

set "choice="
<nul set /p "=%choicePrompt%: "
set /p choice=

:: Remove spaces, accept 01 or 1
if defined choice set "choice=!choice: =!"
if defined choice for /f "tokens=* delims=0" %%n in ("!choice!") do set "choice=%%n"

set "selected="
if not defined choice (
    if defined CURRENT_REALM set "selected=%CURRENT_REALM%"
) else (
    call set "selected=%%option!choice!%%"
)

if not defined selected (
    echo Invalid choice.
    echo(
    goto :realmMenu
)
echo Selected server: %selected%

:: =========================================================================
:: Locale selection
:: =========================================================================
if not "%ASK_FOR_LOCALE%"=="1" goto :writeRealmlist

if not exist "%DATA_DIR%\" (
    echo Data folder not found at "%DATA_DIR%". No changes made.
    pause
    exit /b
)

echo(
:localeMenu
echo Choose your locale:
set "maxLocale=0"
set "AVAILABLE_LOCALES="
set "MISSING_LOCALES="
for %%L in (%KNOWN_LOCALES%) do (
    if exist "%DATA_DIR%\%%L\" (
        set /a maxLocale+=1
        set "locale!maxLocale!=%%L"
        set "AVAILABLE_LOCALES=!AVAILABLE_LOCALES! %%L"
        set "num=0!maxLocale!"
        if /i "%%L"=="%CURRENT_LOCALE%" (
            echo !num:~-2! - %%L [Current]
        ) else (
            echo !num:~-2! - %%L
        )
    ) else (
        set "MISSING_LOCALES=!MISSING_LOCALES! %%L"
    )
)
:: Extra locale folders (xxYY, e.g. itIT) that are not in KNOWN_LOCALES
for /f "delims=" %%D in ('dir /b /ad "%DATA_DIR%" 2^>nul ^| findstr /r /x "[abcdefghijklmnopqrstuvwxyz][abcdefghijklmnopqrstuvwxyz][ABCDEFGHIJKLMNOPQRSTUVWXYZ][ABCDEFGHIJKLMNOPQRSTUVWXYZ]"') do (
    set "isKnown="
    for %%K in (%KNOWN_LOCALES%) do if /i "%%D"=="%%K" set "isKnown=1"
    if not defined isKnown (
        set /a maxLocale+=1
        set "locale!maxLocale!=%%D"
        set "AVAILABLE_LOCALES=!AVAILABLE_LOCALES! %%D"
        set "num=0!maxLocale!"
        if /i "%%D"=="%CURRENT_LOCALE%" (
            echo !num:~-2! - %%D [Custom] [Current]
        ) else (
            echo !num:~-2! - %%D [Custom]
        )
    )
)
if defined MISSING_LOCALES echo Not installed:%MISSING_LOCALES%
echo(

if %maxLocale% equ 0 (
    echo No locale folders found in "%DATA_DIR%". No changes made.
    pause
    exit /b
)

:: ENTER keeps the current locale (if it is installed)
set "keepLocale="
if defined CURRENT_LOCALE if exist "%DATA_DIR%\%CURRENT_LOCALE%\" set "keepLocale=%CURRENT_LOCALE%"

set "localeChoice="
if defined keepLocale (
    <nul set /p "=Enter 1 - %maxLocale% [ENTER = keep %keepLocale%]: "
) else (
    <nul set /p "=Enter 1 - %maxLocale%: "
)
set /p localeChoice=

:: Remove spaces, accept 01 or 1
if defined localeChoice set "localeChoice=!localeChoice: =!"
if defined localeChoice for /f "tokens=* delims=0" %%n in ("!localeChoice!") do set "localeChoice=%%n"

set "selectedLocale="
if not defined localeChoice (
    set "selectedLocale=%keepLocale%"
) else (
    call set "selectedLocale=%%locale!localeChoice!%%"
)

if not defined selectedLocale (
    echo Invalid choice.
    echo(
    goto :localeMenu
)
echo Selected locale: %selectedLocale%
echo(

set "REALMLIST_PATH=%DATA_DIR%\%selectedLocale%\realmlist.wtf"

:: =========================================================================
:: Write realmlist.wtf and config.wtf
:: =========================================================================
:writeRealmlist
:: Old line (first line of the file, trailing spaces removed)
set "OLD_LINE="
if exist "%REALMLIST_PATH%" (
    for /f "usebackq delims=" %%L in ("%REALMLIST_PATH%") do if not defined OLD_LINE set "OLD_LINE=%%L"
)
for /L %%i in (1,1,10) do if defined OLD_LINE if "!OLD_LINE:~-1!"==" " set "OLD_LINE=!OLD_LINE:~0,-1!"

>"%REALMLIST_PATH%" echo SET realmlist %selected%
if defined OLD_LINE (
    echo realmlist.wtf change from: "!OLD_LINE!" to "SET realmlist %selected%"
) else (
    echo realmlist.wtf: "SET realmlist %selected%"
)

if "%ASK_FOR_LOCALE%"=="1" call :setConfigValue locale "%selectedLocale%"

if "%VIDEO_SETTINGS%"=="1" call :setVideoSettings
echo(

:: -------------------------------------------------------------------------
:: Optional: Clear Cache After Setting Realmlist
:: -------------------------------------------------------------------------
::for %%A in ("%REALMLIST_PATH%") do set "REALMLIST_DIR=%%~dpA"
::set "WOW_DIR=%REALMLIST_DIR%..\.."
::if exist "%WOW_DIR%\Cache" (
::    rmdir /s /q "%WOW_DIR%\Cache"
::    echo Cache folder deleted.
::) else (
::    echo No Cache folder found.
::)
:: -------------------------------------------------------------------------

:: -------------------------------------------------------------------------
:: Optional: Clear Realm Name After Setting Realmlist
:: -------------------------------------------------------------------------
::for %%A in ("%REALMLIST_PATH%") do set "REALMLIST_DIR=%%~dpA"
::set "WTF_DIR=%REALMLIST_DIR%..\..\WTF"
::set "CONFIG_FILE=%WTF_DIR%\config.wtf"
::if exist "%CONFIG_FILE%" (
::    for /f "usebackq delims=" %%L in ("%CONFIG_FILE%") do (
::        set "line=%%L"
::        setlocal enabledelayedexpansion
::        echo !line! | findstr /b /c:"SET realmName" >nul
::        if errorlevel 1 (
::            >>"%CONFIG_FILE%.tmp" echo !line!
::        )
::        endlocal
::    )
::    move /y "%CONFIG_FILE%.tmp" "%CONFIG_FILE%" >nul
::    echo Realm name cleared in config.wtf
::    echo(
::) else (
::    echo config.wtf not found
::)
:: -------------------------------------------------------------------------

:: -------------------------------------------------------------------------
:: Optional: Start World of Warcraft After Setting Realmlist
:: -------------------------------------------------------------------------
::for %%A in ("%REALMLIST_PATH%") do set "REALMLIST_DIR=%%~dpA"
::set "WOW_DIR=%REALMLIST_DIR%..\.."
::pushd "%WOW_DIR%" 2>nul || (
::    echo Could not find Wow.exe folder at "%WOW_DIR%"
::    pause
::    exit /b
::)
::start "" "Wow.exe"
::popd
:: -------------------------------------------------------------------------

pause
exit /b

:: =========================================================================
:: Video settings -> config.wtf
:: =========================================================================
:setVideoSettings
set "gxWindowVal="
set "gxMaximizedVal="
if "%DISPLAY_MODE%"=="1" (
    set "gxWindowVal=0"
    set "gxMaximizedVal=0"
)
if "%DISPLAY_MODE%"=="2" (
    set "gxWindowVal=1"
    set "gxMaximizedVal=0"
)
if "%DISPLAY_MODE%"=="3" (
    set "gxWindowVal=1"
    set "gxMaximizedVal=1"
)
if defined gxWindowVal (
    call :setConfigValue gxWindow "%gxWindowVal%"
    call :setConfigValue gxMaximized "%gxMaximizedVal%"
) else (
    echo DISPLAY_MODE "%DISPLAY_MODE%" is not 1, 2 or 3. Display mode not changed.
)
if defined RES_WIDTH if defined RES_HEIGHT call :setConfigValue gxResolution "%RES_WIDTH%x%RES_HEIGHT%"
exit /b

:: =========================================================================
:: Replaces (or adds) SET <Name> "<Value>" in WTF\config.wtf
::   call :setConfigValue <Name> "<Value>"
:: =========================================================================
:setConfigValue
setlocal enabledelayedexpansion
set "cfgName=%~1"
set "cfgValue=%~2"
set "cfgPrefix=SET %~1 "
set "plen=0"
for /L %%i in (0,1,80) do if not "!cfgPrefix:~%%i,1!"=="" set /a "plen=%%i+1"
setlocal disabledelayedexpansion
if not exist "%WOW_DIR%\WTF\" mkdir "%WOW_DIR%\WTF"
if not exist "%CONFIG_FILE%" (
    >"%CONFIG_FILE%" echo SET %cfgName% "%cfgValue%"
    echo config.wtf: SET %cfgName% "%cfgValue%" [New file]
    endlocal
    endlocal
    exit /b
)
set "cfgOld="
set "cfgDone="
>"%CONFIG_FILE%.tmp" (
    for /f "usebackq delims=" %%L in (`findstr /n "^" "%CONFIG_FILE%"`) do (
        set "line=%%L"
        setlocal enabledelayedexpansion
        set "line=!line:*:=!"
        if /i "!line:~0,%plen%!"=="!cfgPrefix!" (
            for /f "delims=" %%O in ("!line!") do (
                endlocal
                if not defined cfgOld set "cfgOld=%%O"
            )
            if not defined cfgDone echo SET %cfgName% "%cfgValue%"
            set "cfgDone=1"
        ) else (
            echo(!line!
            endlocal
        )
    )
)
if not defined cfgDone >>"%CONFIG_FILE%.tmp" echo SET %cfgName% "%cfgValue%"
move /y "%CONFIG_FILE%.tmp" "%CONFIG_FILE%" >nul
if defined cfgOld (
    echo config.wtf change from: %cfgOld% to SET %cfgName% "%cfgValue%"
) else (
    echo config.wtf: added SET %cfgName% "%cfgValue%"
)
endlocal
endlocal
exit /b

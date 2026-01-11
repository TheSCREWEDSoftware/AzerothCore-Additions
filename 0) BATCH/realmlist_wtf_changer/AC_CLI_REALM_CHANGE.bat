@echo off
setlocal enabledelayedexpansion

:: Path to your realmlist.wtf
set "REALMLIST_PATH=DriveLetter:GameFolder\Data\<Locale>\realmlist.wtf"

:: --- Define options ---
set "option1=my.dns.server"
set "option2=127.0.0.1"
:: You can add more: set "option3=another.server.example" 
:: ----------------------

:: Display menu
echo Choose your server:
set "maxOption=0"

for /L %%i in (1,1,50) do (
    call set "val=%%option%%i%%"
    if defined val (
        echo %%i - SET realmlist !val!
        set "maxOption=%%i"
    ) else (
        goto :doneListing
    )
)

:doneListing
echo.

:: Build dynamic choice prompt
if %maxOption% equ 1 (
    set "choicePrompt=Enter 1: "
) else (
    set "choicePrompt=Enter "
    for /L %%i in (1,1,%maxOption%) do (
        if %%i EQU 1 (
            set "choicePrompt=!choicePrompt!%%i"
        ) else (
            if %%i EQU %maxOption% (
                set "choicePrompt=!choicePrompt! or %%i: "
            ) else (
                set "choicePrompt=!choicePrompt!, %%i"
            )
        )
    )
)

<nul set /p "=%choicePrompt%"
set /p choice=

call set "selected=%%option%choice%%%"

if not defined selected (
    echo Invalid choice. No changes made.
    pause
    exit /b
)
echo Selected server: %selected%
echo SET realmlist %selected% > "%REALMLIST_PATH%"
echo reamlist.wtf: SET realmlist %selected%

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
::) else (
::    echo config.wtf not found
::)
:: -------------------------------------------------------------------------

pause

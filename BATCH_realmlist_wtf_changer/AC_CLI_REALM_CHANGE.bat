@echo off
setlocal enabledelayedexpansion

:: Path to your realmlist.wtf
set "REALMLIST_PATH=C:\Users\Ryan Turner\Desktop\Folders\New folders\2024\World of Warcraft - WoTLK\Data\enGB\realmlist.wtf"

:: --- Define options ---
set "option1=logon.chromiecraft.com"
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
            rem first item — no separator
            set "choicePrompt=!choicePrompt!%%i"
        ) else (
            if %%i EQU %maxOption% (
                rem last item — use " or <n>: "
                set "choicePrompt=!choicePrompt! or %%i: "
            ) else (
                rem middle items — comma then space
                set "choicePrompt=!choicePrompt!, %%i"
            )
        )
    )
)

:: Ask user input dynamically
<nul set /p "=%choicePrompt%"
set /p choice=

:: Get corresponding value
call set "selected=%%option%choice%%%"

if not defined selected (
    echo Invalid choice. No changes made.
) else (
    echo SET realmlist %selected% > "%REALMLIST_PATH%"
    echo File updated: SET realmlist %selected%
)

pause

:: -------------------------------------------------------------------------
:: Optional, run wow with the set realmlist after you press ENTER in the end
:: -------------------------------------------------------------------------
:: You can uncomment the lines below to automatically start the game.
:: It assumes Wow.exe is located two directories above the realmlist.wtf file.
:: remove the "::" before the: for, CD and START below if you want wow to open
::
::for %%A in ("%REALMLIST_PATH%") do set "REALMLIST_DIR=%%~dpA"
::cd /d "%REALMLIST_DIR%\..\.."
::start "" "Wow.exe"
::
:: --------------------------------------------------------------------------

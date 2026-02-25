@echo off
setlocal enabledelayedexpansion

echo.
echo ========================================
echo MatriCare - Flutter Setup and Run
echo ========================================
echo.

REM Check if Flutter is in PATH
flutter --version >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo [OK] Flutter found in PATH
    goto get_deps
)

REM Search common paths
echo [INFO] Searching for Flutter SDK...

set "flutter_found=0"

for %%p in (C:\flutter "%USERPROFILE%\flutter" "%USERPROFILE%\AppData\Local\flutter" "%USERPROFILE%\Downloads\flutter") do (
    if exist "%%p\bin\flutter.bat" (
        echo [OK] Found Flutter at: %%p
        set "PATH=%%p\bin;!PATH!"
        set "flutter_found=1"
        goto get_deps
    )
)

if %flutter_found% EQU 0 (
    echo [ERROR] Flutter SDK not found!
    echo.
    echo Please install Flutter from: https://flutter.dev
    pause
    exit /b 1
)

:get_deps
echo.
echo [INFO] Installing dependencies...
call flutter pub get

if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Failed to get dependencies
    pause
    exit /b 1
)

echo [OK] Dependencies installed
echo.
echo ========================================
echo Select Platform
echo ========================================
echo.
echo 1. Web (Chrome) - Easiest
echo 2. Windows
echo 3. Android
echo 4. List Devices
echo.

set /p choice="Enter choice (1-4): "

if "%choice%"=="1" (
    echo.
    echo Launching on Web (Chrome)...
    flutter run -d chrome
) else if "%choice%"=="2" (
    echo.
    echo Launching on Windows...
    flutter run -d windows
) else if "%choice%"=="3" (
    echo.
    echo Launching on Android...
    flutter run
) else if "%choice%"=="4" (
    echo.
    flutter devices
    pause
) else (
    echo Invalid selection
    pause
    exit /b 1
)

pause

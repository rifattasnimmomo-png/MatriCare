# MatriCare Flutter App - Setup and Run Script (PowerShell)
# Usage: .\run_app.ps1

param(
    [Parameter(Mandatory=$false)]
    [ValidateSet('web', 'windows', 'android', 'device', 'auto')]
    [string]$Platform = 'auto'
)

# Colors for output
$SuccessColor = "Green"
$ErrorColor = "Red"
$InfoColor = "Cyan"

Write-Host "========================================" -ForegroundColor $InfoColor
Write-Host "MatriCare Flutter App - Setup & Run" -ForegroundColor $InfoColor
Write-Host "========================================" -ForegroundColor $InfoColor
Write-Host ""

# Check if Flutter is in PATH
$flutterFound = $false

# Try to run flutter command
$flutterVersion = flutter --version 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Flutter found in PATH" -ForegroundColor $SuccessColor
    Write-Host "  Version: $($flutterVersion -join ' ')" -ForegroundColor $SuccessColor
    $flutterFound = $true
}

if (-not $flutterFound) {
    Write-Host "Flutter not in PATH, searching for installation..." -ForegroundColor "Yellow"
    
    # Common Flutter paths
    $flutterPaths = @(
        "C:\flutter",
        "$env:USERPROFILE\flutter",
        "$env:USERPROFILE\AppData\Local\flutter",
        "C:\Program Files\flutter",
        "C:\Program Files (x86)\flutter"
    )
    
    $flutterFound = $false
    foreach ($path in $flutterPaths) {
        if (Test-Path "$path\bin\flutter.bat") {
            Write-Host "✓ Found Flutter at: $path" -ForegroundColor $SuccessColor
            $env:PATH = "$path\bin;$env:PATH"
            $flutterFound = $true
            break
        }
    }
    
    if (-not $flutterFound) {
        Write-Host "ERROR: Flutter SDK not found!" -ForegroundColor $ErrorColor
        Write-Host ""
        Write-Host "Please install Flutter from: https://flutter.dev/docs/get-started/install/windows" -ForegroundColor "Yellow"
        Write-Host ""
        Write-Host "Common installation paths:" -ForegroundColor "Yellow"
        foreach ($path in $flutterPaths) {
            Write-Host "  - $path"
        }
        exit 1
    }
}

Write-Host ""
Write-Host "========================================" -ForegroundColor $InfoColor
Write-Host "Installing Dependencies..." -ForegroundColor $InfoColor
Write-Host "========================================" -ForegroundColor $InfoColor
Write-Host ""

flutter pub get
if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: Failed to get dependencies" -ForegroundColor $ErrorColor
    exit 1
}

Write-Host ""
Write-Host "✓ Dependencies installed successfully" -ForegroundColor $SuccessColor
Write-Host ""

# Select platform if not specified
if ($Platform -eq "auto") {
    Write-Host "========================================" -ForegroundColor $InfoColor
    Write-Host "Select Platform to Run:" -ForegroundColor $InfoColor
    Write-Host "========================================" -ForegroundColor $InfoColor
    Write-Host ""
    Write-Host "1. Web (Chrome)          - Easiest, instant preview"
    Write-Host "2. Windows               - Native Windows app"
    Write-Host "3. Android Emulator      - Emulator required"
    Write-Host "4. Android Device        - Physical device needed"
    Write-Host "5. List Devices          - Show available devices"
    Write-Host ""
    
    $choice = Read-Host "Enter your choice (1-5)"
    
    switch ($choice) {
        "1" { $Platform = "web" }
        "2" { $Platform = "windows" }
        "3" { $Platform = "android" }
        "4" { $Platform = "device" }
        "5" { 
            Write-Host ""
            Write-Host "Available Devices:" -ForegroundColor $InfoColor
            flutter devices
            Write-Host ""
            $deviceId = Read-Host "Enter device ID to run on"
            if ([string]::IsNullOrEmpty($deviceId)) {
                flutter run
            } else {
                flutter run -d $deviceId
            }
            exit 0
        }
        default {
            Write-Host "Invalid selection" -ForegroundColor $ErrorColor
            exit 1
        }
    }
}

Write-Host ""
Write-Host "========================================" -ForegroundColor $InfoColor
Write-Host "Running MatriCare App..." -ForegroundColor $InfoColor
Write-Host "========================================" -ForegroundColor $InfoColor
Write-Host ""

# Run based on platform
switch ($Platform) {
    "web" {
        Write-Host "Launching on Web (Chrome)..." -ForegroundColor "Yellow"
        flutter run -d chrome
    }
    "windows" {
        Write-Host "Launching on Windows..." -ForegroundColor "Yellow"
        flutter run -d windows
    }
    "android" {
        Write-Host "Launching on Android Emulator..." -ForegroundColor "Yellow"
        flutter run
    }
    "device" {
        Write-Host "Available devices:" -ForegroundColor "Yellow"
        flutter devices
        Write-Host ""
        $deviceId = Read-Host "Enter device ID"
        if ([string]::IsNullOrEmpty($deviceId)) {
            flutter run
        } else {
            flutter run -d $deviceId
        }
    }
    default {
        Write-Host "Launching on available device..." -ForegroundColor "Yellow"
        flutter run
    }
}

Write-Host ""
Write-Host "========================================" -ForegroundColor $InfoColor
Write-Host "MatriCare App Session Ended" -ForegroundColor $InfoColor
Write-Host "========================================" -ForegroundColor $InfoColor

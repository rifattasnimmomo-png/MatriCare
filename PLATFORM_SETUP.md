# MatriCare App - Multi-Platform Setup Guide

This app is built with Flutter and runs on **Android**, **iOS**, **Windows**, **macOS**, **Linux**, and **Web**. This guide covers the three main platforms you requested.

---

## 🖥️ PLATFORM REQUIREMENTS

### For all platforms:
- **Flutter SDK** (>=3.0.0)
- **Dart SDK** (>=3.0.0)

### Android
- **Android Studio** or **Android SDK** tools
- **Java Development Kit (JDK)** 11+
- **Android API Level** 21+ (minimum)

### iOS (macOS only)
- **Xcode** 14+
- **CocoaPods**
- **iOS Deployment Target** 11.0+

### Windows
- **Visual Studio 2022** or **Visual Studio Code**
- **C++ build tools** (MSVC)
- **Windows 10 SDK**

---

## 🚀 SETUP FOR EACH PLATFORM

### ANDROID

#### Step 1: Verify Android Setup
```bash
flutter doctor -v
```

#### Step 2: Configure Android
The project is pre-configured in `android/app/build.gradle`:
```gradle
android {
    compileSdkVersion 34
    minSdkVersion 21
    targetSdkVersion 34
}
```

#### Step 3: Run on Android Emulator
```bash
# Start Android Emulator first, then:
flutter run
```

#### Step 4: Run on Physical Android Device
```bash
# Enable USB Debugging on your phone:
# Settings > Developer Options > USB Debugging

# Connect device and run:
flutter run
```

#### Step 5: Build for Release (Google Play)
```bash
# Generate APK
flutter build apk --release

# Generate App Bundle (recommended for Play Store)
flutter build appbundle --release

# Output locations:
# APK: build/app/outputs/flutter-app/app-release.apk
# Bundle: build/app/outputs/bundle/release/app-release.aab
```

**Advanced Options:**
```bash
# Build split APKs by architecture
flutter build apk --release --split-per-abi

# Build with specific target
flutter build apk --release --target-platform android-arm64
```

---

### iOS

#### Step 1: Install Xcode (macOS only)
```bash
# Download from App Store or:
xcode-select --install

# Agree to Xcode license
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch
```

#### Step 2: Verify iOS Setup
```bash
flutter doctor -v
```

#### Step 3: Install CocoaPods
```bash
sudo gem install cocoapods
```

#### Step 4: Update iOS Project
```bash
cd ios
pod repo update
pod install --repo-update
cd ..
```

#### Step 5: Configure App Information
Edit `ios/Runner/Info.plist`:
```xml
<key>CFBundleName</key>
<string>MatriCare</string>
<key>CFBundleDisplayName</key>
<string>MatriCare Healthcare</string>
<key>CFBundleShortVersionString</key>
<string>1.0.0</string>
<key>CFBundleVersion</key>
<string>1</string>
```

#### Step 6: Run on iOS Simulator
```bash
flutter run -d iphone
# or specify device:
flutter run -d "iPhone 15"
```

#### Step 7: Run on Physical iOS Device
```bash
# Connect device via USB
flutter run -d all  # Shows available devices
flutter run -d <device-name>
```

#### Step 8: Build for App Store Release
```bash
# Method 1: Command line
flutter build ios --release

# Method 2: Build as AAB format
flutter build ipa --release

# Output: build/ios/iphoneos/Runner.app
```

**Signing & Distribution:**
1. Open Xcode project: `ios/Runner.xcworkspace`
2. Select signing team in Xcode
3. Increment build version
4. Archive in Xcode: Product > Archive
5. Distribute to App Store

---

### WINDOWS

#### Step 1: Install Prerequisites
- **Visual Studio 2022** with C++ workload
- **Windows 10 SDK** (version 19041+)

#### Step 2: Enable Windows Desktop
```bash
flutter config --enable-windows-desktop
```

#### Step 3: Verify Windows Setup
```bash
flutter doctor -v
```

#### Step 4: Create Windows Project (if needed)
```bash
flutter create --platforms=windows .
```

#### Step 5: Configure Windows App
Edit `windows/runner/main.cpp` for app settings:
- Window title
- Window size
- Icon

#### Step 6: Run on Windows
```bash
flutter run -d windows
```

#### Step 7: Build Windows Release
```bash
# Build executable
flutter build windows --release

# Output: build/windows/runner/Release/matricare_app.exe
```

#### Step 8: Create Windows Installer (Optional)
```bash
# Install NSIS first: https://nsis.sourceforge.io/

# Create installer
flutter pub global activate win_installer
flutter pub global run win_installer:create
```

---

## 📊 RUNNING ACROSS ALL PLATFORMS

### Quick Commands

```bash
# List available devices
flutter devices

# Run on all available devices
flutter run -d all

# Run specific device
flutter run -d <device-id>

# Run in release mode
flutter run --release

# Run with verbose logging
flutter run -v
```

### Platform-Specific Commands

```bash
# Android
flutter run -d emulator-5554              # Emulator
flutter run -d <device-id>                # Physical device
flutter run -d android                    # Any Android device

# iOS
flutter run -d iphone                     # Any iOS device
flutter run -d iphone-13-pro              # Specific device

# Windows
flutter run -d windows
```

---

## 🏗️ BUILDING FOR PRODUCTION

### Android (Google Play Store)
```bash
# 1. Generate signing key
keytool -genkey -v -keystore ~/my-release-key.jks \
  -keyalg RSA -keysize 2048 -validity 10000 -alias my-key-alias

# 2. Create key.properties
# android/key.properties:
storePassword=<your-password>
keyPassword=<your-password>
keyAlias=my-key-alias
storeFile=<path-to-jks-file>

# 3. Build AAB
flutter build appbundle --release

# 4. Upload to Play Console
```

### iOS (App Store)
```bash
# 1. Create Apple Developer account & certificates

# 2. Configure provisioning profiles in Xcode

# 3. Build IPA
flutter build ipa --release

# 4. Upload to App Store Connect via Xcode or Transporter
```

### Windows
```bash
# 1. Build executable
flutter build windows --release

# 2. Optional: Create installer with NSIS
# 3. Distribute .exe file
```

---

## 📱 EMULATOR & SIMULATOR SETUP

### Android Emulator
```bash
# List available emulators
emulator -list-avds

# Start emulator
emulator -avd <emulator-name>

# Or use Android Studio:
# Tools > Device Manager > Create Virtual Device
```

### iOS Simulator (macOS only)
```bash
# List available simulators
xcrun xctrace list devices

# Open simulator
open -a Simulator

# Specify simulator device
flutter run -d "iPhone 15"
```

---

## 🔧 PLATFORM-SPECIFIC CODE

If you need platform-specific code, use channels:

### Dart/Flutter side
```dart
import 'package:flutter/services.dart';

const platform = MethodChannel('com.example.matricare/native');

try {
  final result = await platform.invokeMethod('getNativeData');
} catch (e) {
  print(e);
}
```

### Android side (java/kotlin)
```kotlin
// MainActivity.kt
MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "com.example.matricare/native")
  .setMethodCallHandler { call, result ->
    when (call.method) {
      "getNativeData" -> {
        result.success("Native data")
      }
      else -> result.notImplemented()
    }
  }
```

---

## 🐛 TROUBLESHOOTING

### Android Issues

**Problem**: Android SDK not found
```bash
flutter config --android-sdk /path/to/android/sdk
```

**Problem**: Build fails
```bash
flutter clean
flutter pub get
flutter run
```

**Problem**: Gradle issues
```bash
cd android
./gradlew clean
cd ..
flutter pub get
```

### iOS Issues

**Problem**: Pod install fails
```bash
cd ios
rm -rf Pods Podfile.lock
pod repo update
pod install --repo-update
cd ..
```

**Problem**: Xcode version mismatch
```bash
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
```

### Windows Issues

**Problem**: Visual Studio not detected
```bash
flutter config --windows-sdk "C:\Program Files\Microsoft Visual Studio\2022\Community"
```

**Problem**: Missing C++ build tools
- Open Visual Studio installer
- Modify installation
- Select "Desktop development with C++"

---

## 📈 TESTING ON MULTIPLE PLATFORMS

```bash
# Test on all devices simultaneously
flutter run -d all

# Test on multiple specific devices
flutter run -d emulator-5554
# In another terminal:
flutter run -d iphone
# In another terminal:
flutter run -d windows
```

---

## 📦 DISTRIBUTION CHECKLIST

### Before Release

- [ ] Update version in `pubspec.yaml`
- [ ] Update `android/app/build.gradle` minSdkVersion
- [ ] Update `ios/Podfile` platform version
- [ ] Test on real devices (Android & iOS)
- [ ] Test on target Windows versions
- [ ] Run `flutter test` suite
- [ ] Run `flutter analyze`
- [ ] Update app icons and splash screens
- [ ] Add privacy policy and terms of service
- [ ] Test dark theme on all platforms
- [ ] Test orientation changes
- [ ] Test high DPI screens (Windows)

### Android Distribution
1. Sign APK/AAB
2. Upload to Google Play Console
3. Fill app details
4. Set pricing and distribution
5. Submit for review (24-48 hours)

### iOS Distribution
1. Create App Store Connect app
2. Set up certificates and profiles
3. Build IPA
4. Upload via Transporter or Xcode
5. Complete app details
6. Submit for review (24-48 hours typically)

### Windows Distribution
1. Sign executable (optional)
2. Create installer
3. Host on website or app store
4. Promote through channels

---

## 🎯 QUICK START COMMANDS

```bash
# Android
flutter run -d emulator-5554              # Debug
flutter build apk --release               # Release

# iOS (macOS only)
flutter run -d iphone                     # Debug
flutter build ipa --release               # Release

# Windows
flutter run -d windows                    # Debug
flutter build windows --release           # Release

# Web (bonus)
flutter run -d chrome                     # Debug
flutter build web --release               # Release
```

---

## 📞 PLATFORM-SPECIFIC DOCUMENTATION

- **Android**: https://developer.android.com
- **iOS**: https://developer.apple.com
- **Windows**: https://developer.microsoft.com
- **Flutter Deployment**: https://flutter.dev/deployment

---

## ✅ COMPLETION STATUS

- ✅ Android support configured
- ✅ iOS support configured
- ✅ Windows support configured
- ✅ Web support available (bonus)
- ✅ macOS support available (bonus)
- ✅ Cross-platform testing ready

**Your app is ready to build and deploy on Android, iOS, and Windows!**

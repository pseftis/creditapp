# Quick Start Guide

## Prerequisites

- Flutter SDK (>=3.0.0)
- Dart SDK (>=3.0.0)
- Android Studio / VS Code with Flutter extensions
- Android Emulator / iOS Simulator / Physical Device

## Setup Instructions

### 1. Install Dependencies

```bash
flutter pub get
```

### 2. Verify Flutter Installation

```bash
flutter doctor
```

### 3. Run the App

```bash
# For Android
flutter run

# For iOS (Mac only)
flutter run -d ios

# For specific device
flutter devices
flutter run -d <device-id>
```

### 4. Build for Production

```bash
# Android APK
flutter build apk

# Android App Bundle
flutter build appbundle

# iOS (Mac only)
flutter build ios
```

## Project Structure Overview

- **lib/main.dart**: Entry point with Provider setup
- **lib/core/**: Constants, theme, utilities
- **lib/data/**: Models, repositories, services
- **lib/presentation/**: UI components, screens, providers
- **assets/**: Images and icons

## Key Features to Test

1. **Home Screen**: View credit cards and quick actions
2. **Cards Screen**: Browse all credit cards
3. **Rewards Screen**: Filter and redeem rewards
4. **Transactions Screen**: View transaction history
5. **Profile Screen**: View user profile

## Mock Data

The app uses mock data, so no backend connection is required. All data is simulated with delays to mimic real API calls.

## Troubleshooting

### Common Issues

1. **Dependencies not installing**
   ```bash
   flutter clean
   flutter pub get
   ```

2. **Build errors**
   ```bash
   flutter clean
   flutter pub get
   flutter run
   ```

3. **Device not detected**
   ```bash
   flutter devices
   # Enable USB debugging on Android
   # Trust computer on iOS
   ```

## Next Steps

- Integrate real API endpoints
- Add authentication
- Implement offline caching
- Add unit tests
- Set up CI/CD


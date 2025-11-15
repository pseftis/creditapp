# CRED Rewards App - Flutter Project

A comprehensive Flutter application demonstrating professional Flutter development skills, built for the CRED Flutter Developer position.

## 🚀 Features

- **Clean Architecture**: Well-structured codebase following separation of concerns
- **State Management**: Implemented using Provider pattern
- **Modern UI/UX**: Beautiful and responsive user interface
- **Credit Card Management**: View and manage credit cards
- **Rewards System**: Track and redeem rewards points
- **Transaction History**: View payment and transaction history
- **Profile Management**: User profile and settings

## 📁 Project Structure

```
lib/
├── main.dart                 # App entry point
├── core/
│   ├── constants/           # App constants
│   ├── theme/               # App theme configuration
│   └── utils/               # Utility functions
├── data/
│   ├── models/              # Data models
│   ├── repositories/        # Data repositories
│   └── services/            # API services
├── presentation/
│   ├── providers/           # State management providers
│   ├── screens/             # App screens
│   ├── widgets/             # Reusable widgets
│   └── routes/              # Navigation routes
└── domain/
    └── entities/            # Business logic entities
```

## 🛠️ Technologies Used

- **Flutter**: Cross-platform mobile development framework
- **Dart**: Programming language
- **Provider**: State management solution
- **HTTP/Dio**: Network requests
- **Shared Preferences**: Local data storage
- **Google Fonts**: Typography
- **Flutter SVG**: Vector graphics

## 📋 Requirements

- Flutter SDK: >=3.0.0
- Dart SDK: >=3.0.0
- Android Studio / VS Code with Flutter extensions

## 🏃 Getting Started

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd cred_rewards_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## 🏗️ Architecture

This project follows **Clean Architecture** principles:

- **Presentation Layer**: UI components, screens, and state management
- **Domain Layer**: Business logic and entities
- **Data Layer**: Models, repositories, and services

### State Management

The app uses **Provider** for state management, following the recommended Flutter patterns:
- `ChangeNotifier` for state classes
- `Provider` and `Consumer` widgets for state access
- Separation of business logic from UI

## 📱 Key Features Implementation

### 1. Credit Card Management
- Display credit cards with beautiful UI
- Card details and balance information
- Card selection and management

### 2. Rewards System
- Points tracking and history
- Reward redemption options
- Reward categories

### 3. Transaction History
- Payment history
- Transaction filtering
- Detailed transaction views

### 4. User Profile
- Profile information
- Settings management
- Account preferences

## 🎨 UI/UX Features

- Material Design 3 components
- Smooth animations and transitions
- Responsive layouts
- Dark mode support (ready for implementation)
- Custom theming

## 🧪 Testing

```bash
# Run unit tests
flutter test

# Run integration tests
flutter test integration_test
```

## 📝 Code Quality

- Follows Flutter style guide
- Proper error handling
- Code comments and documentation
- Separation of concerns
- Reusable components

## 🔧 Skills Demonstrated

✅ Flutter/Dart development  
✅ State management (Provider)  
✅ Clean architecture  
✅ UI/UX implementation  
✅ Code organization  
✅ Best practices  
✅ Responsive design  
✅ Error handling  

## 📄 License

This project is created for demonstration purposes.

## 👤 Author

Created for CRED Flutter Developer Position Application

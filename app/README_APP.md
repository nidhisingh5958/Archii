# 🏗️ Archii - AI-Powered Interior Design App

A comprehensive Flutter application for AI-powered interior design, featuring a modern UI with blue-indigo color scheme, smooth animations, and an intuitive user experience.

## ✨ Features Implemented

### 📱 Complete Screens

1. **Splash Screen** - Animated brand intro with grid background and fade transitions
2. **Login/Signup** - Clean authentication UI with Google sign-in option
3. **Dashboard** - Recent projects grid, statistics, new design button, and quick chat access
4. **New Project Flow** (4-step wizard):
   - 📸 Upload space photo (with camera/gallery integration)
   - 📏 Enter dimensions & room type
   - 🎨 Design preferences (style, budget, colors, purpose, furniture)
   - ✅ Generate design confirmation
5. **AI Loading** - Animated progress screen with cycling messages
6. **Results Screen** with 4 tabs:
   - 📐 Layout (2D floor plan visualization)
   - 👁️ Visual (rendered design with color palette)
   - 💰 Cost (detailed breakdown with percentages)
   - 📝 Notes (AI recommendations and materials)
7. **Chat Refinement** - Interactive chat interface to modify designs
8. **Profile/Settings** - User profile with stats and menu options

### 🎨 Design Features

- **Modern UI** with rounded corners, gradients, and glassmorphism effects
- **Blue-Indigo color scheme** (#2563EB, #4F46E5, #6366F1)
- **Smooth transitions** and animations
- **Responsive layout** works on all screen sizes
- **Floating action buttons** for quick access
- **Progress indicators** for multi-step flows
- **Tab navigation** in results screen
- **Google Fonts** integration (Inter font family)

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.10.3 or higher)
- Dart SDK (3.10.3 or higher)
- iOS Simulator / Android Emulator / Physical Device

### Installation

1. **Clone the repository** (if not already done)
   ```bash
   cd /Volumes/DevSSD/Developer/Archii/app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## 📦 Dependencies

```yaml
dependencies:
  - flutter
  - cupertino_icons: ^1.0.8
  - image_picker: ^1.0.7        # Camera/gallery image selection
  - google_fonts: ^6.1.0        # Inter font family
  - http: ^1.2.0                # API calls (for future backend)
  - provider: ^6.1.1            # State management (for future use)
```

## 🗂️ Project Structure

```
lib/
├── main.dart                           # App entry point
├── theme/
│   └── app_theme.dart                 # Theme configuration & color scheme
└── screens/
    ├── splash_screen.dart             # Animated splash screen
    ├── login_screen.dart              # Login/signup UI
    ├── dashboard_screen.dart          # Main dashboard with projects
    ├── new_project_screen.dart        # 4-step project creation wizard
    ├── ai_loading_screen.dart         # AI generation loading screen
    ├── results_screen.dart            # Results with 4 tabs
    ├── chat_screen.dart               # Chat refinement interface
    └── profile_screen.dart            # User profile & settings
```

## 🎯 App Flow

```
Splash Screen (3s animation)
    ↓
Login Screen
    ↓
Dashboard
    ├─→ New Project Flow (4 steps)
    │       ↓
    │   AI Loading Screen
    │       ↓
    │   Results Screen (4 tabs)
    │       └─→ Chat Refinement
    │
    ├─→ View Recent Projects → Results Screen
    ├─→ Quick Chat → Chat Screen
    └─→ Profile → Profile Screen
```

## 🔧 Next Steps for Production

### 1. Backend Integration
- Set up **Serverpod** or **Firebase** for backend
- Implement authentication (Google Sign-In, Email/Password)
- Store user projects and designs
- API integration for AI generation

### 2. AI Integration
- Connect to AI service (OpenAI, Stability AI, or custom model)
- Implement image processing and analysis
- Generate floor plans and 3D renders
- Create cost estimation logic

### 3. Enhanced Features
- Save and export designs (PDF, images)
- Share designs with others
- Multiple design variations
- AR preview integration
- Shopping cart for furniture items
- Payment integration for premium features

### 4. State Management
- Implement Provider/Riverpod/Bloc for app state
- User session management
- Offline support with local storage
- Image caching

### 5. Testing & Optimization
- Unit tests for business logic
- Widget tests for UI components
- Integration tests for user flows
- Performance optimization
- Error handling and logging

## 🎨 Customization

### Changing Colors
Edit `lib/theme/app_theme.dart`:
```dart
static const primaryBlue = Color(0xFF2563EB);     // Your primary color
static const primaryIndigo = Color(0xFF4F46E5);   // Your secondary color
static const primaryPurple = Color(0xFF6366F1);   // Your accent color
```

### Adding New Screens
1. Create new file in `lib/screens/`
2. Import necessary dependencies
3. Create StatelessWidget or StatefulWidget
4. Add navigation from existing screens

### Modifying Animations
Check `splash_screen.dart` and `ai_loading_screen.dart` for animation examples using:
- `AnimationController`
- `Tween` animations
- `AnimatedSwitcher`
- `CustomPainter` for custom graphics

## 📱 Platform Support

- ✅ **iOS** - Fully supported
- ✅ **Android** - Fully supported
- ✅ **Web** - Fully supported
- ✅ **macOS** - Fully supported
- ✅ **Windows** - Fully supported
- ✅ **Linux** - Fully supported

## 🐛 Known Issues

- Image picker needs platform-specific configuration (see Platform Setup below)
- Google Fonts requires internet connection on first launch
- Some animations may need optimization for lower-end devices

## 🔐 Platform Setup

### iOS Configuration
Add to `ios/Runner/Info.plist`:
```xml
<key>NSCameraUsageDescription</key>
<string>We need camera access to capture your space</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>We need photo library access to select images</string>
```

### Android Configuration
Add to `android/app/src/main/AndroidManifest.xml`:
```xml
<uses-permission android:name="android.permission.CAMERA"/>
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
```

## 📝 License

This project is private and proprietary.

## 👨‍💻 Development

Built with ❤️ using Flutter & Dart

---

## 🚀 Quick Commands

```bash
# Run in debug mode
flutter run

# Run in release mode
flutter run --release

# Build APK (Android)
flutter build apk

# Build IPA (iOS)
flutter build ios

# Build Web
flutter build web

# Clean build
flutter clean && flutter pub get

# Check for outdated packages
flutter pub outdated
```

## 🎉 Enjoy Building!

Your comprehensive Archii app is ready! All screens are implemented with modern UI, smooth animations, and proper navigation flow. Simply run the app and explore all the features! 🎨✨

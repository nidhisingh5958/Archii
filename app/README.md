# 📱 Archii Flutter App

The cross-platform mobile application for Archii - AI Architectural Design Copilot.

## 🎯 Overview

This Flutter app provides the user interface for Archii, allowing users to:

- Upload room images for AI analysis
- Input room dimensions and preferences
- View AI-generated design plans
- Chat with the AI design assistant
- Manage and track design projects

## 🏗️ Architecture

```
lib/
├── main.dart                    # App entry point with Serverpod init
├── screens/                     # UI Screens
│   ├── splash_screen.dart       # App launch screen
│   ├── login_screen.dart        # User authentication
│   ├── dashboard_screen.dart    # Project overview
│   ├── new_project_screen.dart  # Create new design project
│   ├── ai_loading_screen.dart   # AI processing indicator
│   ├── results_screen.dart      # Display design results
│   ├── chat_screen.dart         # AI chat interface
│   └── profile_screen.dart      # User profile
├── models/                      # Data models
│   └── models.dart              # Project, Design, etc.
├── services/                    # API & Backend services
│   ├── server_connection.dart   # Serverpod client setup
│   ├── design_api_service.dart  # Design API calls
│   ├── project_api_service.dart # Project CRUD operations
│   ├── large_scale_api_service.dart # Large-scale planning
│   └── services.dart            # Export file
└── theme/                       # App theming
    └── app_theme.dart           # Colors, typography, etc.
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK 3.10+
- Dart SDK 3.8+
- Android Studio / Xcode (for emulators)
- Running Serverpod server (see [SERVERPOD_SETUP.md](../SERVERPOD_SETUP.md))

### Installation

```bash
# Navigate to app directory
cd app

# Get dependencies
flutter pub get

# Run on connected device/emulator
flutter run

# Run on specific platform
flutter run -d chrome    # Web
flutter run -d macos     # macOS
flutter run -d ios       # iOS Simulator
flutter run -d android   # Android Emulator
```

### Configuration

The app connects to Serverpod at `http://localhost:8080` by default. 

To change the server URL, edit `lib/services/server_connection.dart`:

```dart
client = Client(
  'http://your-server-url:8080/',  // Change this
)..connectivityMonitor = FlutterConnectivityMonitor();
```

## 📦 Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| `serverpod_flutter` | ^3.2.3 | Serverpod client |
| `archii_server_client` | local | Generated API client |
| `provider` | ^6.1.1 | State management |
| `google_fonts` | ^6.1.0 | Typography |
| `image_picker` | ^1.0.7 | Camera/gallery access |
| `cupertino_icons` | ^1.0.8 | iOS-style icons |

## 🎨 Screens Overview

### 1. Splash Screen
App launch with branding animation.

### 2. Login Screen
User authentication (email/password, social login).

### 3. Dashboard Screen
- View all projects
- Quick actions
- Recent designs
- Project status tracking

### 4. New Project Screen
- Upload room image (camera/gallery)
- Enter room dimensions
- Select design style
- Set budget range
- Add special requirements

### 5. AI Loading Screen
- Progress indicators
- Stage-by-stage updates
- Estimated time remaining

### 6. Results Screen
- Vision analysis summary
- Layout recommendations
- Furniture placement
- Cost breakdown
- Generated visualizations

### 7. Chat Screen
- Natural language interaction
- Design refinement
- Q&A with AI architect

### 8. Profile Screen
- User settings
- Saved designs
- Preferences

## 🔌 Using the API Services

### Initialize Connection

The app automatically initializes Serverpod in `main.dart`:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await serverConnection.initialize();
  runApp(const ArchiiApp());
}
```

### Design API

```dart
import 'package:archii/services/services.dart';

final designService = DesignApiService();

// Analyze room image
final analysis = await designService.analyzeRoom(imageBase64);

// Generate design plan
final design = await designService.generateDesignPlan(
  length: 12.0,
  width: 10.0,
  height: 9.0,
  style: StyleType.modern,
  budget: BudgetLevel.medium,
  roomType: RoomType.bedroom,
);

// Full pipeline with image
final result = await designService.fullDesignPipeline(
  length: 12.0,
  width: 10.0,
  height: 9.0,
  style: StyleType.minimalist,
  budget: BudgetLevel.high,
  imageBase64: base64Image,
);
```

### Project API

```dart
final projectService = ProjectApiService();

// Create project
final project = await projectService.createProject(
  name: 'Living Room Redesign',
  roomType: 'living_room',
  style: 'modern',
  estimatedCost: 5000.0,
  userId: 1,
);

// Get user projects
final projects = await projectService.getUserProjects(userId);

// Update project
await projectService.updateProject(project);

// Delete project
await projectService.deleteProject(projectId);
```

## 🧪 Testing

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Run specific test file
flutter test test/widget_test.dart
```

## 📱 Building for Production

### Android

```bash
# Generate APK
flutter build apk --release

# Generate App Bundle
flutter build appbundle --release
```

### iOS

```bash
# Build for iOS
flutter build ios --release

# Then archive in Xcode
```

### Web

```bash
# Build web app
flutter build web --release
```

## 🔧 Troubleshooting

### Connection Issues

1. Ensure Serverpod server is running
2. Check the server URL in `server_connection.dart`
3. For Android emulator, use `10.0.2.2` instead of `localhost`
4. For iOS simulator, `localhost` should work

### Build Errors

```bash
# Clean and rebuild
flutter clean
flutter pub get
flutter run
```

### Serverpod Client Errors

```bash
# Regenerate client after server changes
cd ../archii_server/archii_server_server
serverpod generate

# Then update app dependencies
cd ../../app
flutter pub get
```

## 📄 License

Part of the Archii project - MIT License

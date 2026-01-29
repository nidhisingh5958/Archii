# Archii - Serverpod Integration Guide

## Architecture Overview

```
┌─────────────────────────────────────────────────────────────────┐
│                        Flutter App                               │
│                    (/app directory)                              │
│              Uses serverpod_flutter client                       │
└──────────────────────────┬──────────────────────────────────────┘
                           │ WebSocket / HTTP
                           ▼
┌─────────────────────────────────────────────────────────────────┐
│                    Serverpod Server                              │
│              (/archii_server directory)                          │
│  • User Authentication (serverpod_auth)                          │
│  • Project CRUD Operations                                       │
│  • Real-time Chat Streaming                                      │
│  • AI Service Proxy                                              │
└──────────────────────────┬──────────────────────────────────────┘
                           │
              ┌────────────┴────────────┐
              ▼                         ▼
┌──────────────────────┐    ┌─────────────────────────┐
│    PostgreSQL DB     │    │  Python AI Service      │
│   (Docker Container) │    │  (/AI directory)        │
│                      │    │  FastAPI + Gemini AI    │
└──────────────────────┘    └─────────────────────────┘
```

## Project Structure

```
Archii/
├── app/                          # Flutter mobile/web app
│   └── lib/
│       ├── main.dart             # App entry point (Serverpod init)
│       ├── services/             # API services
│       │   ├── server_connection.dart
│       │   ├── design_api_service.dart
│       │   ├── project_api_service.dart
│       │   └── large_scale_api_service.dart
│       ├── screens/              # UI screens
│       └── models/               # Local models (can migrate to Serverpod)
│
├── archii_server/                # Serverpod backend
│   ├── archii_server_server/     # Server code
│   │   ├── lib/src/
│   │   │   ├── endpoints/        # API endpoints
│   │   │   │   ├── project_endpoint.dart
│   │   │   │   ├── design_endpoint.dart
│   │   │   │   ├── large_scale_endpoint.dart
│   │   │   │   └── chat_endpoint.dart
│   │   │   └── protocol/         # Data models (YAML)
│   │   ├── migrations/           # Database migrations
│   │   └── config/               # Server configuration
│   │
│   ├── archii_server_client/     # Generated client library
│   └── archii_server_flutter/    # Generated Flutter app (optional)
│
└── AI/                           # Python AI backend
    ├── app/
    │   ├── main.py               # FastAPI app
    │   ├── routes/               # API routes
    │   └── services/             # AI services (Gemini)
    └── requirements.txt
```

---

## Quick Start Guide

### Prerequisites

1. **Docker Desktop** - For PostgreSQL database
2. **Dart SDK** - 3.8.0 or higher
3. **Flutter SDK** - 3.10 or higher
4. **Python 3.10+** - For AI service
5. **Gemini API Key** - For AI features

### Step 1: Start the Database (PostgreSQL)

```bash
cd archii_server/archii_server_server
docker compose up --build --detach
```

This starts:
- PostgreSQL on port 5432
- Redis on port 6379

### Step 2: Apply Database Migrations

```bash
cd archii_server/archii_server_server
dart bin/main.dart --apply-migrations
```

### Step 3: Start the Serverpod Server

```bash
cd archii_server/archii_server_server
dart bin/main.dart
```

Server runs on: `http://localhost:8080`

### Step 4: Start the Python AI Service

```bash
cd AI

# Create virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt

# Set environment variable
export GEMINI_API_KEY="your-api-key-here"

# Start the server
python run_server.py
```

AI Service runs on: `http://localhost:8000`

### Step 5: Run the Flutter App

```bash
cd app
flutter pub get
flutter run
```

---

## Configuration

### Serverpod Server Configuration

Edit `archii_server/archii_server_server/config/development.yaml`:

```yaml
apiServer:
  port: 8080
  publicHost: localhost
  publicPort: 8080
  publicScheme: http

database:
  host: localhost
  port: 5432
  name: archii_server
  user: postgres
  password: <your-password>

redis:
  enabled: true
  host: localhost
  port: 6379
```

### AI Service URL Configuration

The AI service URL is configured via environment variable:

```bash
# When running Serverpod server
export AI_SERVICE_URL=http://localhost:8000
dart bin/main.dart
```

### Flutter Client Configuration

In production, update `server_connection.dart`:

```dart
client = Client(
  'https://your-production-server.com/',
  authenticationKeyManager: FlutterAuthenticationKeyManager(),
)..connectivityMonitor = FlutterConnectivityMonitor();
```

---

## Development Workflow

### Making Model Changes

1. Edit/add YAML files in `archii_server_server/lib/src/protocol/`
2. Run code generator:
   ```bash
   cd archii_server/archii_server_server
   serverpod generate
   ```
3. Create migration (if database tables changed):
   ```bash
   serverpod create-migration
   ```
4. Apply migration:
   ```bash
   dart bin/main.dart --apply-migrations
   ```
5. Update Flutter app:
   ```bash
   cd app
   flutter pub get
   ```

### Adding New Endpoints

1. Create endpoint file in `archii_server_server/lib/src/endpoints/`
2. Follow the pattern from existing endpoints
3. Run `serverpod generate`
4. Client methods are auto-generated!

---

## API Reference

### Project Endpoints

```dart
// Create project
await client.project.createProject(project);

// Get user projects
await client.project.getUserProjects(userId);

// Update project
await client.project.updateProject(project);

// Delete project
await client.project.deleteProject(projectId);
```

### Design Endpoints

```dart
// Analyze room image
await client.design.analyzeRoom(imageBase64);

// Generate design plan
await client.design.generateDesignPlan(designRequest);

// Full pipeline
await client.design.fullDesignPipeline(designRequest);
```

### Large Scale Endpoints

```dart
// Generate master plan
await client.largeScale.generateMasterPlan(request);

// Construction strategy
await client.largeScale.generateConstructionStrategy(request);

// Complete planning
await client.largeScale.completeLargeScalePlanning(request);
```

---

## Authentication (Optional)

Serverpod includes authentication modules. To enable:

1. The server already includes `serverpod_auth_idp_server`
2. Configure providers in the server config
3. Use `sessionManager` in Flutter for sign-in/out

Example:
```dart
// Check if signed in
if (serverConnection.isSignedIn) {
  final user = serverConnection.signedInUser;
}

// Sign out
await serverConnection.signOut();
```

---

## Deployment

### Production Checklist

1. **Database**: Use managed PostgreSQL (AWS RDS, Google Cloud SQL, etc.)
2. **Redis**: Use managed Redis (AWS ElastiCache, etc.)
3. **Server**: Deploy to cloud (AWS, GCP, Azure, or Railway/Render)
4. **AI Service**: Deploy Python service separately
5. **HTTPS**: Enable TLS/SSL certificates
6. **Environment Variables**: Secure API keys and passwords

### Docker Deployment

The server includes a Dockerfile for containerized deployment:

```bash
cd archii_server/archii_server_server
docker build -t archii-server .
docker run -p 8080:8080 archii-server
```

---

## Troubleshooting

### Common Issues

1. **"Connection refused"**: Ensure Docker containers are running
2. **"Migration failed"**: Check database credentials in config
3. **"AI service error"**: Verify GEMINI_API_KEY is set
4. **"Client not found"**: Run `flutter pub get` after server changes

### Useful Commands

```bash
# Check Docker status
docker ps

# View server logs
cd archii_server/archii_server_server
dart bin/main.dart --apply-migrations 2>&1 | tee server.log

# Regenerate code
serverpod generate

# Reset database (development only!)
docker compose down -v
docker compose up -d
dart bin/main.dart --apply-migrations
```

---

## Next Steps

1. ✅ Serverpod server created
2. ✅ Models and endpoints defined
3. ✅ Flutter client integrated
4. ⬜ Start Docker and apply migrations
5. ⬜ Run servers (Serverpod + AI)
6. ⬜ Test API endpoints
7. ⬜ Add authentication
8. ⬜ Deploy to production

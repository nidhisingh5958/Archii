# ⚡ Archii Quick Reference

Quick commands for running and developing Archii.

---

## 🚀 Start Everything (Development)

Open **4 terminal tabs** and run:

### Terminal 1: Database
```bash
cd archii_server/archii_server_server
docker compose up -d
```

### Terminal 2: Serverpod Server
```bash
cd archii_server/archii_server_server
dart bin/main.dart --apply-migrations
```

### Terminal 3: AI Service
```bash
cd AI
source venv/bin/activate
export GEMINI_API_KEY="your-key"
python run_server.py
```

### Terminal 4: Flutter App
```bash
cd app
flutter run
```

---

## 🛑 Stop Everything

```bash
# Stop Serverpod (Ctrl+C in terminal)
# Stop AI Service (Ctrl+C in terminal)
# Stop Docker
cd archii_server/archii_server_server
docker compose down
```

---

## 🔄 Common Tasks

### Regenerate Serverpod Code
```bash
cd archii_server/archii_server_server
serverpod generate
```

### Create Database Migration
```bash
cd archii_server/archii_server_server
serverpod create-migration
```

### Update Flutter Dependencies
```bash
cd app
flutter pub get
```

### Kill Processes on Ports
```bash
lsof -ti:8080,8081,8082,8000 | xargs kill -9
```

---

## 📍 Service URLs

| Service | URL |
|---------|-----|
| Serverpod API | http://localhost:8080 |
| Serverpod Insights | http://localhost:8081 |
| Serverpod Web | http://localhost:8082 |
| AI Service | http://localhost:8000 |
| AI Docs (Swagger) | http://localhost:8000/docs |
| PostgreSQL | localhost:8090 |
| Redis | localhost:8091 |

---

## 🐛 Troubleshooting

### Port Already in Use
```bash
lsof -ti:8080 | xargs kill -9
```

### Docker Not Running
```bash
open -a Docker
# Wait 30 seconds, then retry
```

### Database Connection Failed
```bash
docker ps  # Check if containers are running
docker compose up -d  # Restart containers
```

### Flutter Build Issues
```bash
flutter clean
flutter pub get
flutter run
```

### Serverpod Client Outdated
```bash
cd archii_server/archii_server_server
serverpod generate
cd ../../app
flutter pub get
```

# 🚀 Archii Deployment Guide

Complete guide for deploying Archii to production.

---

## 📋 Prerequisites

- Domain name (e.g., `archii.app`)
- SSL certificates
- Cloud provider account (AWS, GCP, Azure, or similar)
- Docker and Docker Compose
- Google Gemini API key

---

## 🏗️ Architecture Overview

```
                    ┌─────────────────────┐
                    │   Load Balancer     │
                    │   (HTTPS/SSL)       │
                    └──────────┬──────────┘
                               │
              ┌────────────────┼────────────────┐
              ▼                ▼                ▼
    ┌─────────────────┐ ┌─────────────┐ ┌──────────────┐
    │ Serverpod       │ │ AI Service  │ │ Static Files │
    │ (Port 8080)     │ │ (Port 8000) │ │ (CDN)        │
    └────────┬────────┘ └──────┬──────┘ └──────────────┘
             │                 │
             ▼                 │
    ┌─────────────────┐        │
    │ PostgreSQL      │        │
    │ + Redis         │        │
    └─────────────────┘        │
             ▲                 │
             └─────────────────┘
```

---

## 🐳 Docker Deployment

### 1. Serverpod Server Dockerfile

The server already includes a Dockerfile at `archii_server/archii_server_server/Dockerfile`:

```dockerfile
FROM dart:stable AS build

WORKDIR /app
COPY . .

RUN dart pub get
RUN dart compile exe bin/main.dart -o bin/server

FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y ca-certificates && rm -rf /var/lib/apt/lists/*

COPY --from=build /app/bin/server /app/bin/server
COPY --from=build /app/config /app/config
COPY --from=build /app/web /app/web
COPY --from=build /app/migrations /app/migrations

WORKDIR /app
EXPOSE 8080 8081 8082

CMD ["./bin/server", "--mode", "production", "--apply-migrations"]
```

### 2. AI Service Dockerfile

Create `AI/Dockerfile`:

```dockerfile
FROM python:3.11-slim

WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application
COPY . .

# Expose port
EXPOSE 8000

# Run server
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000", "--workers", "4"]
```

### 3. Docker Compose for Production

Create `docker-compose.prod.yml` in project root:

```yaml
version: '3.8'

services:
  postgres:
    image: pgvector/pgvector:pg16
    restart: always
    environment:
      POSTGRES_USER: ${POSTGRES_USER:-archii}
      POSTGRES_PASSWORD: ${POSTGRES_PASSWORD}
      POSTGRES_DB: ${POSTGRES_DB:-archii_server}
    volumes:
      - postgres_data:/var/lib/postgresql/data
    networks:
      - archii-network
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U archii"]
      interval: 10s
      timeout: 5s
      retries: 5

  redis:
    image: redis:7-alpine
    restart: always
    volumes:
      - redis_data:/data
    networks:
      - archii-network
    healthcheck:
      test: ["CMD", "redis-cli", "ping"]
      interval: 10s
      timeout: 5s
      retries: 5

  serverpod:
    build:
      context: ./archii_server/archii_server_server
      dockerfile: Dockerfile
    restart: always
    ports:
      - "8080:8080"
      - "8081:8081"
      - "8082:8082"
    environment:
      - SERVERPOD_DATABASE_HOST=postgres
      - SERVERPOD_DATABASE_PORT=5432
      - SERVERPOD_DATABASE_NAME=${POSTGRES_DB:-archii_server}
      - SERVERPOD_DATABASE_USER=${POSTGRES_USER:-archii}
      - SERVERPOD_DATABASE_PASSWORD=${POSTGRES_PASSWORD}
      - SERVERPOD_REDIS_HOST=redis
      - SERVERPOD_REDIS_PORT=6379
      - AI_SERVICE_URL=http://ai-service:8000
    depends_on:
      postgres:
        condition: service_healthy
      redis:
        condition: service_healthy
    networks:
      - archii-network

  ai-service:
    build:
      context: ./AI
      dockerfile: Dockerfile
    restart: always
    ports:
      - "8000:8000"
    environment:
      - GEMINI_API_KEY=${GEMINI_API_KEY}
    networks:
      - archii-network
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:8000/health"]
      interval: 30s
      timeout: 10s
      retries: 3

networks:
  archii-network:
    driver: bridge

volumes:
  postgres_data:
  redis_data:
```

### 4. Environment Variables

Create `.env.prod`:

```bash
# Database
POSTGRES_USER=archii
POSTGRES_PASSWORD=your_secure_password_here
POSTGRES_DB=archii_server

# AI Service
GEMINI_API_KEY=your_gemini_api_key_here

# Server
SERVERPOD_MODE=production
```

### 5. Deploy with Docker Compose

```bash
# Build and start all services
docker-compose -f docker-compose.prod.yml --env-file .env.prod up -d --build

# View logs
docker-compose -f docker-compose.prod.yml logs -f

# Stop services
docker-compose -f docker-compose.prod.yml down
```

---

## ☁️ Cloud Deployment Options

### AWS Deployment

#### Option 1: ECS (Elastic Container Service)

1. **Create ECR repositories**:
   ```bash
   aws ecr create-repository --repository-name archii-serverpod
   aws ecr create-repository --repository-name archii-ai-service
   ```

2. **Push images**:
   ```bash
   aws ecr get-login-password | docker login --username AWS --password-stdin <account>.dkr.ecr.<region>.amazonaws.com
   
   docker build -t archii-serverpod ./archii_server/archii_server_server
   docker tag archii-serverpod:latest <account>.dkr.ecr.<region>.amazonaws.com/archii-serverpod:latest
   docker push <account>.dkr.ecr.<region>.amazonaws.com/archii-serverpod:latest
   ```

3. **Use RDS for PostgreSQL** and **ElastiCache for Redis**

4. **Create ECS cluster and services**

#### Option 2: EC2 with Docker Compose

1. Launch EC2 instance (t3.medium or larger)
2. Install Docker and Docker Compose
3. Clone repository
4. Run docker-compose as shown above

### Google Cloud Platform

1. **Cloud Run** for containerized services
2. **Cloud SQL** for PostgreSQL
3. **Memorystore** for Redis

### Azure

1. **Azure Container Apps** or **AKS**
2. **Azure Database for PostgreSQL**
3. **Azure Cache for Redis**

---

## 🌐 Nginx Configuration

For reverse proxy and SSL termination:

```nginx
upstream serverpod {
    server 127.0.0.1:8080;
}

upstream serverpod_insights {
    server 127.0.0.1:8081;
}

upstream serverpod_web {
    server 127.0.0.1:8082;
}

upstream ai_service {
    server 127.0.0.1:8000;
}

server {
    listen 80;
    server_name archii.app www.archii.app;
    return 301 https://$server_name$request_uri;
}

server {
    listen 443 ssl http2;
    server_name archii.app www.archii.app;

    ssl_certificate /etc/letsencrypt/live/archii.app/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/archii.app/privkey.pem;

    # API
    location /api/ {
        proxy_pass http://serverpod;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    # WebSocket
    location /websocket {
        proxy_pass http://serverpod;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
    }

    # Web app
    location / {
        proxy_pass http://serverpod_web;
        proxy_set_header Host $host;
    }
}
```

---

## 📱 Flutter App Configuration

### Production Server URL

Update `lib/services/server_connection.dart`:

```dart
client = Client(
  'https://api.archii.app/',  // Production URL
)..connectivityMonitor = FlutterConnectivityMonitor();
```

### Build for Release

```bash
# Android
flutter build apk --release
flutter build appbundle --release

# iOS
flutter build ios --release

# Web
flutter build web --release
```

---

## 🔐 Security Checklist

- [ ] Use HTTPS everywhere
- [ ] Set strong database passwords
- [ ] Configure CORS properly (not `*` in production)
- [ ] Enable rate limiting
- [ ] Set up authentication
- [ ] Rotate API keys regularly
- [ ] Enable database backups
- [ ] Set up monitoring and alerts
- [ ] Configure firewall rules
- [ ] Use secrets management (AWS Secrets Manager, etc.)

---

## 📊 Monitoring

### Health Checks

- Serverpod: `GET https://api.archii.app/health`
- AI Service: `GET https://ai.archii.app/health`

### Recommended Tools

- **Logging**: CloudWatch, Stackdriver, or ELK Stack
- **Metrics**: Prometheus + Grafana
- **Error Tracking**: Sentry
- **Uptime**: UptimeRobot, Pingdom

---

## 🔄 CI/CD Pipeline

### GitHub Actions Example

Create `.github/workflows/deploy.yml`:

```yaml
name: Deploy to Production

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    
    steps:
      - uses: actions/checkout@v3
      
      - name: Configure AWS credentials
        uses: aws-actions/configure-aws-credentials@v2
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: us-east-1
      
      - name: Login to ECR
        uses: aws-actions/amazon-ecr-login@v1
      
      - name: Build and push Serverpod
        run: |
          docker build -t archii-serverpod ./archii_server/archii_server_server
          docker tag archii-serverpod:latest ${{ secrets.ECR_REGISTRY }}/archii-serverpod:latest
          docker push ${{ secrets.ECR_REGISTRY }}/archii-serverpod:latest
      
      - name: Build and push AI Service
        run: |
          docker build -t archii-ai ./AI
          docker tag archii-ai:latest ${{ secrets.ECR_REGISTRY }}/archii-ai:latest
          docker push ${{ secrets.ECR_REGISTRY }}/archii-ai:latest
      
      - name: Deploy to ECS
        run: |
          aws ecs update-service --cluster archii --service serverpod --force-new-deployment
          aws ecs update-service --cluster archii --service ai-service --force-new-deployment
```

---

## 💰 Cost Estimation

### Small Scale (Development/Testing)
- **EC2 t3.small**: ~$15/month
- **RDS db.t3.micro**: ~$15/month
- **Total**: ~$30-50/month

### Medium Scale (Production)
- **EC2 t3.medium (x2)**: ~$60/month
- **RDS db.t3.small**: ~$30/month
- **ElastiCache**: ~$15/month
- **Load Balancer**: ~$20/month
- **Total**: ~$150-200/month

### Large Scale
- Use auto-scaling groups
- Consider reserved instances
- Optimize based on usage patterns

---

## 🆘 Troubleshooting

### Database Connection Issues
```bash
# Check PostgreSQL status
docker logs archii-postgres

# Test connection
docker exec -it archii-postgres psql -U archii -d archii_server
```

### AI Service Not Responding
```bash
# Check logs
docker logs archii-ai-service

# Test health
curl http://localhost:8000/health
```

### Serverpod Errors
```bash
# Check logs
docker logs archii-serverpod

# Verify migrations
docker exec -it archii-serverpod ./bin/server --apply-migrations
```

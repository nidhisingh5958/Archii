<p align="center">
  <img src="docs/assets/archii-logo.png" alt="Archii Logo" width="200"/>
</p>

<h1 align="center">🏛️ Archii</h1>

<p align="center">
  <strong>AI Architectural Design Copilot</strong><br>
  Carry an AI Architect in Your Pocket
</p>

<p align="center">
  <a href="#-features">Features</a> •
  <a href="#-quick-start">Quick Start</a> •
  <a href="#-architecture">Architecture</a> •
  <a href="#-documentation">Documentation</a> •
  <a href="#-contributing">Contributing</a>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter"/>
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart"/>
  <img src="https://img.shields.io/badge/Serverpod-5B4BD5?style=for-the-badge&logo=dart&logoColor=white" alt="Serverpod"/>
  <img src="https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white" alt="Python"/>
  <img src="https://img.shields.io/badge/Google%20Gemini-4285F4?style=for-the-badge&logo=google&logoColor=white" alt="Gemini"/>
  <img src="https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white" alt="PostgreSQL"/>
</p>

---

## 💡 Inspiration

Creating a space often involves the services of an architect and expensive tools and materials. However, it is difficult for the average person to picture what their space can actually look like and to maximise their small spaces without breaking the bank.

**Our goal was to make architectural intelligence available to everyone.**

With Archii, you can take a picture of the space and a few variables to get a fully realised AI-generated design plan. Archii was conceived as the idea of being able to **carry an AI architect in your pocket**.

---

## ✨ What It Does

Archii is an **AI-based architectural designing copilot**. The user can:

1. 📸 **Upload an image** of the room
2. 📐 **Input dimensions** and specifications
3. 🎨 **Specify preferences** including style, budget, and usage
4. 🤖 **Get AI-powered results**:
   - Space analysis and recommendations
   - Optimal layout designs
   - Interior visualization images
   - Cost-based design options
5. 💬 **Interact via AI chat** to refine designs through natural conversations

### Key Features

| Feature | Description |
|---------|-------------|
| 🔍 **Vision Analysis** | AI-powered room analysis using computer vision |
| 🏠 **Layout Planning** | Intelligent spatial reasoning and furniture placement |
| 🎨 **Style Generation** | Multiple design styles (Modern, Traditional, Minimalist, etc.) |
| 💰 **Budget Optimization** | Cost-aware design recommendations |
| 🖼️ **Render Generation** | AI-generated interior visualizations |
| 💬 **AI Chat** | Natural language design refinement |
| 🏗️ **Large-Scale Planning** | Townships, universities, hospitals, hotels |
| 📊 **Project Management** | Save, track, and manage multiple design projects |

---

## 🏗️ How We Built It

Archii utilizes a **multi-layered AI architecture**:

```
┌─────────────────────────────────────────────────────────────────────┐
│                      📱 Flutter Mobile App                          │
│         Beautiful UI • Cross-Platform • Real-time Updates           │
└─────────────────────────────┬───────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────────────┐
│                    🔷 Serverpod Backend                             │
│    User Management • Project Storage • AI Orchestration • Auth     │
└─────────────────────────────┬───────────────────────────────────────┘
                              │
              ┌───────────────┴───────────────┐
              ▼                               ▼
┌──────────────────────┐         ┌────────────────────────────────────┐
│   🗄️ PostgreSQL      │         │        🐍 Python AI Engine         │
│   + Redis Cache      │         │                                    │
└──────────────────────┘         │  ┌──────────────────────────────┐  │
                                 │  │ 👁️ Vision Analysis (Gemini)  │  │
                                 │  ├──────────────────────────────┤  │
                                 │  │ 🧠 Design LLM (Gemini 1.5)   │  │
                                 │  ├──────────────────────────────┤  │
                                 │  │ 📐 Layout Engine (Python)    │  │
                                 │  ├──────────────────────────────┤  │
                                 │  │ 🎨 Render Generation         │  │
                                 │  ├──────────────────────────────┤  │
                                 │  │ 💰 Cost Estimation           │  │
                                 │  └──────────────────────────────┘  │
                                 └────────────────────────────────────┘
```

### Technology Stack

| Layer | Technology | Purpose |
|-------|------------|---------|
| **Frontend** | Flutter + Dart | Cross-platform mobile app |
| **Backend** | Serverpod | User management, project storage, API orchestration |
| **Database** | PostgreSQL + Redis | Data persistence and caching |
| **AI Engine** | Python + FastAPI | AI model serving and orchestration |
| **Vision AI** | Google Gemini Pro Vision | Room image analysis |
| **Design AI** | Google Gemini 1.5 Pro | Architectural reasoning and planning |
| **Rendering** | Diffusion Models | Interior visualization generation |

---

## 🚀 Quick Start

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (3.10+)
- [Dart SDK](https://dart.dev/get-dart) (3.8+)
- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- [Python](https://www.python.org/downloads/) (3.10+)
- [Google Gemini API Key](https://makersuite.google.com/app/apikey)

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/yourusername/archii.git
cd archii

# 2. Install Serverpod CLI
dart pub global activate serverpod_cli
export PATH="$PATH":"$HOME/.pub-cache/bin"

# 3. Start Docker containers (PostgreSQL + Redis)
cd archii_server/archii_server_server
docker compose up -d

# 4. Apply database migrations and start Serverpod
dart bin/main.dart --apply-migrations

# 5. In a new terminal - Start Python AI service
cd AI
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate
pip install -r requirements.txt
export GEMINI_API_KEY="your-api-key-here"
python run_server.py

# 6. In a new terminal - Run Flutter app
cd app
flutter pub get
flutter run
```

### Running Services Summary

| Service | Command | Port |
|---------|---------|------|
| **PostgreSQL** | `docker compose up -d` | 8090 |
| **Redis** | (included with Docker) | 8091 |
| **Serverpod** | `dart bin/main.dart` | 8080, 8081, 8082 |
| **AI Service** | `python run_server.py` | 8000 |
| **Flutter App** | `flutter run` | - |

---

## 📁 Project Structure

```
Archii/
│
├── 📱 app/                              # Flutter Mobile Application
│   ├── lib/
│   │   ├── main.dart                    # App entry point
│   │   ├── screens/                     # UI screens
│   │   │   ├── splash_screen.dart
│   │   │   ├── login_screen.dart
│   │   │   ├── dashboard_screen.dart
│   │   │   ├── new_project_screen.dart
│   │   │   ├── chat_screen.dart
│   │   │   ├── results_screen.dart
│   │   │   └── profile_screen.dart
│   │   ├── models/                      # Data models
│   │   ├── services/                    # API services
│   │   │   ├── server_connection.dart   # Serverpod client
│   │   │   ├── design_api_service.dart
│   │   │   ├── project_api_service.dart
│   │   │   └── large_scale_api_service.dart
│   │   └── theme/                       # App theming
│   └── pubspec.yaml
│
├── 🔷 archii_server/                    # Serverpod Backend
│   ├── archii_server_server/            # Server code
│   │   ├── lib/src/
│   │   │   ├── endpoints/               # API endpoints
│   │   │   │   ├── project_endpoint.dart
│   │   │   │   ├── design_endpoint.dart
│   │   │   │   ├── large_scale_endpoint.dart
│   │   │   │   └── chat_endpoint.dart
│   │   │   └── protocol/                # Data models (YAML)
│   │   ├── migrations/                  # Database migrations
│   │   ├── config/                      # Server configuration
│   │   └── docker-compose.yaml          # Database containers
│   │
│   └── archii_server_client/            # Generated Dart client
│
├── 🐍 AI/                               # Python AI Microservices
│   ├── app/
│   │   ├── main.py                      # FastAPI application
│   │   ├── routes/
│   │   │   ├── design_routes.py         # Design API endpoints
│   │   │   └── advanced_routes.py       # Large-scale planning
│   │   ├── services/
│   │   │   ├── gemini_service.py        # Core Gemini integration
│   │   │   ├── vision_service.py        # Image analysis
│   │   │   ├── design_service.py        # AI design brain
│   │   │   ├── image_service.py         # Visualization generation
│   │   │   ├── layout_engine.py         # Spatial reasoning
│   │   │   ├── master_planning_service.py
│   │   │   └── construction_planning_service.py
│   │   ├── models/
│   │   │   └── schemas.py               # Pydantic models
│   │   └── utils/
│   │       └── logging_config.py
│   ├── requirements.txt
│   └── run_server.py
│
├── 📚 docs/                             # Documentation
│   ├── API.md                           # API reference
│   ├── DEPLOYMENT.md                    # Deployment guide
│   └── CONTRIBUTING.md                  # Contribution guidelines
│
├── SERVERPOD_SETUP.md                   # Serverpod integration guide
└── README.md                            # This file
```

---

## 🔌 API Reference

### Design Endpoints

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/v1/analyze-room` | POST | Analyze room image |
| `/api/v1/design-plan` | POST | Generate design plan |
| `/api/v1/generate-visual` | POST | Create visualization |
| `/api/v1/full-design-pipeline` | POST | Complete AI pipeline |

### Large-Scale Planning

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/v1/master-plan` | POST | Generate master plan |
| `/api/v1/construction-strategy` | POST | Construction planning |
| `/api/v1/architectural-concepts` | POST | Get architectural concepts |
| `/api/v1/environmental-assessment` | POST | Environmental analysis |
| `/api/v1/complete-large-scale-planning` | POST | Full large-scale pipeline |

### Serverpod Endpoints

```dart
// Projects
client.project.createProject(project);
client.project.getUserProjects(userId);
client.project.updateProject(project);
client.project.deleteProject(projectId);

// Design
client.design.analyzeRoom(imageBase64);
client.design.generateDesignPlan(request);
client.design.fullDesignPipeline(request);

// Large Scale
client.largeScale.generateMasterPlan(request);
client.largeScale.completeLargeScalePlanning(request);
```

---

## 🧗 Challenges We Ran Into

1. **Converting unstructured room images into structured spatial representations**
   - Solution: Multi-stage vision analysis with Gemini Pro Vision

2. **Making AI-generated layouts practical, not merely pretty**
   - Solution: Rule-based layout engine combined with LLM reasoning

3. **Keeping design suggestions within realistic budget constraints**
   - Solution: Cost estimation module integrated into the design pipeline

4. **Orchestrating several AI models in suitable order**
   - Solution: Pipeline architecture with FastAPI orchestration

5. **Creating a UI that is intuitive yet masks complex AI processes**
   - Solution: Progressive disclosure design with loading states and chat interface

---

## 🏆 Accomplishments We're Proud Of

1. ✅ A **complete design pipeline** for AI, not just a single model
2. ✅ Development of a system that **integrates Computer Vision, LLM Reasoning, and Generative AI**
3. ✅ Organizing both **functional outputs** (layout, cost) and **visual outputs** (renders)
4. ✅ Defining an experience where the user can **"talk" to an AI architect**
5. ✅ Organizing the project on a **scalable model** - from single rooms to large-scale planning

---

## 📚 What We Learned

1. 🧠 The strongest form of AI comes from **multiple models working together**
2. 📝 **Prompt engineering** is equally important as model selection
3. 🏠 **Real-world factors** (space, budget) are crucial in applied AI
4. 🎨 **UI/UX design** plays a major role in making advanced AI user-friendly
5. 🔧 **Breaking down large AI problems** into smaller services makes implementation manageable

---

## 🔮 What's Next for Archii

- [ ] 🏢 Support for **full apartment and multi-room planning**
- [ ] 📱 **AR-based room visualization**
- [ ] 🛋️ **Material and furniture marketplace integration**
- [ ] 💡 **Advanced structural and lighting simulations**
- [ ] 🧠 **Personalized design style learning** based on user history
- [ ] 🌍 **Multi-language support**
- [ ] 📊 **Analytics dashboard** for design trends

---

## 📖 Documentation

| Document | Description |
|----------|-------------|
| [SERVERPOD_SETUP.md](SERVERPOD_SETUP.md) | Complete Serverpod integration guide |
| [AI/README.md](AI/README.md) | Python AI service documentation |
| [app/README.md](app/README.md) | Flutter app documentation |
| [docs/API.md](docs/API.md) | Full API reference |
| [docs/DEPLOYMENT.md](docs/DEPLOYMENT.md) | Production deployment guide |

---

## 🛠️ Development

### Running Tests

```bash
# Flutter tests
cd app
flutter test

# Serverpod tests
cd archii_server/archii_server_server
dart test

# Python tests
cd AI
pytest
```

### Code Generation

```bash
# Regenerate Serverpod code after model changes
cd archii_server/archii_server_server
serverpod generate
serverpod create-migration
```

### Environment Variables

| Variable | Service | Description |
|----------|---------|-------------|
| `GEMINI_API_KEY` | AI Service | Google Gemini API key |
| `DATABASE_URL` | Serverpod | PostgreSQL connection string |
| `REDIS_URL` | Serverpod | Redis connection string |
| `AI_SERVICE_URL` | Serverpod | Python AI service URL |

---

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guide](docs/CONTRIBUTING.md) for details.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 👥 Team

Built with ❤️ by the Archii Team

---

<p align="center">
  <strong>Archii - Making Architectural Intelligence Accessible to Everyone</strong>
</p>

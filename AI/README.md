# 🏗️ AI Architectural Design Copilot Backend

A production-structured AI backend system for architectural, interior design, and construction planning using Google Gemini models.

## 🚀 Features

- **Vision Analysis**: Analyze room images using Gemini Pro vision capabilities
- **AI Design Brain**: Professional architect and interior designer AI using Gemini models
- **Layout Intelligence**: Rule-based spatial reasoning engine
- **Design Visualization**: AI-generated design concepts and renderings
- **Full Pipeline**: End-to-end design process automation
- **🏙️ Large-Scale Planning**: Township, university, hospital, hotel, resort planning
- **🏗️ Construction Strategy**: Advanced construction planning and engineering
- **🌱 Environmental Assessment**: Sustainability and environmental impact analysis
- **🎯 Multi-Scale Architecture**: From rooms to cities - complete planning solution

## 🧩 System Architecture

```
Flutter App → FastAPI Backend → Gemini AI

Backend Modules:
├── Design LLM Brain (Gemini 1.5 Pro)
├── Vision Analysis (Gemini 1.5 Pro Vision)
├── Layout Intelligence Engine (Python Rules)
├── Image Generation (Gemini)
└── Pipeline Orchestrator (FastAPI)
```

## 📁 Project Structure

```
app/
├── main.py                 # FastAPI application
├── routes/
│   └── design_routes.py    # API endpoints
├── services/
│   ├── gemini_service.py   # Core Gemini integration
│   ├── vision_service.py   # Image analysis
│   ├── design_service.py   # AI design brain
│   ├── image_service.py    # Visualization generation
│   └── layout_engine.py    # Spatial reasoning
├── models/
│   └── schemas.py          # Pydantic models
└── utils/
    └── logging_config.py   # Logging setup
```

## 🛠️ Installation

1. **Clone and navigate to project**:
   ```bash
   cd flutter_construction_app_ai_project
   ```

2. **Install dependencies**:
   ```bash
   pip install -r requirements.txt
   ```

3. **Configure environment**:
   ```bash
   # Edit .env file
   GEMINI_API_KEY=your_gemini_api_key_here
   ```

4. **Run the server**:
   ```bash
   python run_server.py
   ```

## 🔗 API Endpoints

### Core Endpoints

- `POST /api/v1/analyze-room` - Analyze room image
- `POST /api/v1/design-plan` - Generate design plan
- `POST /api/v1/generate-visual` - Create visualization
- `POST /api/v1/full-design-pipeline` - Complete AI pipeline

### 🏙️ Advanced Large-Scale Planning

- `POST /api/v1/master-plan` - Generate comprehensive master plan
- `POST /api/v1/construction-strategy` - Create construction strategy
- `POST /api/v1/architectural-concepts` - Generate architectural concepts
- `POST /api/v1/environmental-assessment` - Environmental impact assessment
- `POST /api/v1/complete-large-scale-planning` - Full large-scale pipeline
- `GET /api/v1/project-types` - Supported project types and capabilities

### Utility Endpoints

- `GET /` - API information
- `GET /health` - Health check
- `GET /docs` - Interactive API documentation

## 📖 API Usage Examples

### 1. Analyze Room Image

```python
import requests

files = {'image': open('room.jpg', 'rb')}
response = requests.post('http://localhost:8000/api/v1/analyze-room', files=files)
analysis = response.json()
```

### 2. Generate Design Plan

```python
design_request = {
    "dimensions": {"length": 12, "width": 10, "height": 9},
    "style": "modern",
    "budget": "medium",
    "room_type": "bedroom"
}

response = requests.post('http://localhost:8000/api/v1/design-plan', json=design_request)
design_plan = response.json()
```

### 3. Full Design Pipeline

```python
data = {
    'dimensions': '{"length": 12, "width": 10, "height": 9}',
    'style': 'modern',
    'budget': 'medium',
    'room_type': 'bedroom'
}
files = {'image': open('room.jpg', 'rb')}

response = requests.post('http://localhost:8000/api/v1/full-design-pipeline', 
                        data=data, files=files)
result = response.json()
```

## 🧠 AI Models Used

| Task | Model | Purpose |
|------|-------|---------|
| Fast reasoning & chat | gemini-1.5-flash | Quick responses |
| Complex architectural planning | gemini-1.5-pro | Detailed design |
| Image understanding | gemini-1.5-pro | Vision analysis |
| Advanced multimodal | gemini-2.5-flash | Future features |

## 🏗️ Design Capabilities

### Room Types Supported
- Bedroom
- Living Room
- Kitchen
- Bathroom
- Office
- Dining Room

### Style Options
- Modern
- Traditional
- Minimalist
- Industrial
- Scandinavian
- Bohemian

### Budget Levels
- Low: Essential items, DIY options
- Medium: Mix of mid-range items
- High: Quality furniture, custom pieces
- Luxury: High-end designer pieces

## 🔧 Configuration

### Environment Variables

```bash
GEMINI_API_KEY=your_api_key_here
```

### Logging

Logs are configured to output to console with INFO level by default. Modify in `app/utils/logging_config.py`.

## 🚀 Deployment

### Development
```bash
python run_server.py
```

### Production
```bash
uvicorn app.main:app --host 0.0.0.0 --port 8000 --workers 4
```

## 🧪 Testing

Access the interactive API documentation at:
- **Swagger UI**: http://localhost:8000/docs
- **ReDoc**: http://localhost:8000/redoc

## 🔒 Security Notes

- Configure CORS appropriately for production
- Secure API key storage
- Implement rate limiting for production use
- Add authentication as needed

## 📝 Development Notes

### Adding New Room Types
1. Update `RoomType` enum in `models/schemas.py`
2. Add constraints in `layout_engine.py`
3. Update design prompts in `design_service.py`

### Adding New Styles
1. Update `StyleType` enum in `models/schemas.py`
2. Add style details in `image_service.py`

## 🤝 Contributing

1. Follow the modular architecture
2. Add proper error handling
3. Include logging for debugging
4. Update documentation

## 📄 License

This project is part of a hackathon submission for AI-powered architectural design.

## 📱 Flutter Integration

### 1. Add HTTP Dependencies

Add to your `pubspec.yaml`:
```yaml
dependencies:
  http: ^1.1.0
  image_picker: ^1.0.4
  dio: ^5.3.2  # Alternative HTTP client
```

### 2. API Service Class

Create `lib/services/api_service.dart`:
```dart
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://localhost:8000/api/v1';
  
  // Room Analysis
  static Future<Map<String, dynamic>> analyzeRoom(File imageFile) async {
    var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/analyze-room'));
    request.files.add(await http.MultipartFile.fromPath('image', imageFile.path));
    
    var response = await request.send();
    var responseData = await response.stream.bytesToString();
    return json.decode(responseData);
  }
  
  // Design Plan Generation
  static Future<Map<String, dynamic>> createDesignPlan(Map<String, dynamic> designRequest) async {
    final response = await http.post(
      Uri.parse('$baseUrl/design-plan'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(designRequest),
    );
    return json.decode(response.body);
  }
  
  // Large-Scale Planning
  static Future<Map<String, dynamic>> createMasterPlan(Map<String, dynamic> request) async {
    final response = await http.post(
      Uri.parse('$baseUrl/master-plan'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(request),
    );
    return json.decode(response.body);
  }
  
  // Complete Design Pipeline
  static Future<Map<String, dynamic>> fullDesignPipeline({
    required Map<String, double> dimensions,
    required String style,
    required String budget,
    String? roomType,
    File? imageFile,
  }) async {
    var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/full-design-pipeline'));
    
    request.fields['dimensions'] = json.encode(dimensions);
    request.fields['style'] = style;
    request.fields['budget'] = budget;
    if (roomType != null) request.fields['room_type'] = roomType;
    
    if (imageFile != null) {
      request.files.add(await http.MultipartFile.fromPath('image', imageFile.path));
    }
    
    var response = await request.send();
    var responseData = await response.stream.bytesToString();
    return json.decode(responseData);
  }
}
```

### 3. Usage in Flutter Widgets

```dart
class DesignScreen extends StatefulWidget {
  @override
  _DesignScreenState createState() => _DesignScreenState();
}

class _DesignScreenState extends State<DesignScreen> {
  File? _selectedImage;
  Map<String, dynamic>? _designResult;
  bool _isLoading = false;
  
  Future<void> _generateDesign() async {
    setState(() => _isLoading = true);
    
    try {
      final result = await ApiService.fullDesignPipeline(
        dimensions: {'length': 12.0, 'width': 10.0, 'height': 9.0},
        style: 'modern',
        budget: 'medium',
        roomType: 'bedroom',
        imageFile: _selectedImage,
      );
      
      setState(() => _designResult = result);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AI Design Copilot')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _generateDesign,
            child: _isLoading 
              ? CircularProgressIndicator() 
              : Text('Generate Design'),
          ),
          if (_designResult != null)
            Expanded(
              child: SingleChildScrollView(
                child: Text(json.encode(_designResult, indent: 2)),
              ),
            ),
        ],
      ),
    );
  }
}
```

### 4. Network Configuration

**Android**: Add to `android/app/src/main/AndroidManifest.xml`:
```xml
<uses-permission android:name="android.permission.INTERNET" />
<application android:usesCleartextTraffic="true">
```

**iOS**: Add to `ios/Runner/Info.plist`:
```xml
<key>NSAppTransportSecurity</key>
<dict>
  <key>NSAllowsArbitraryLoads</key>
  <true/>
</dict>
```

### 5. Production Configuration

---

**🎯 Built for**: Interior designers, Architects, Civil engineers, Builders, Construction planners, Township developers

**🧠 Powered by**: Google Gemini AI Models
# 📚 Archii API Reference

Complete API documentation for the Archii AI Architectural Design Copilot.

---

## 🔷 Serverpod API (Primary)

The Flutter app communicates with Serverpod, which handles authentication, project management, and proxies AI requests.

**Base URL**: `http://localhost:8080` (development)

### Project Endpoints

#### Create Project

```dart
final project = await client.project.createProject(
  Project(
    name: 'Living Room Redesign',
    roomType: 'living_room',
    style: 'modern',
    estimatedCost: 5000.0,
    status: ProjectStatus.draft,
    userId: 1,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
);
```

#### Get User Projects

```dart
final projects = await client.project.getUserProjects(userId);
```

#### Get Single Project

```dart
final project = await client.project.getProject(projectId);
```

#### Update Project

```dart
project.name = 'Updated Name';
final updated = await client.project.updateProject(project);
```

#### Delete Project

```dart
final success = await client.project.deleteProject(projectId);
```

#### Update Project Status

```dart
final project = await client.project.updateProjectStatus(
  projectId,
  ProjectStatus.completed,
);
```

#### Get Projects by Status

```dart
final completedProjects = await client.project.getProjectsByStatus(
  userId,
  ProjectStatus.completed,
);
```

---

### Design Endpoints

#### Analyze Room Image

Analyzes a room image and returns structural information.

```dart
final analysis = await client.design.analyzeRoom(imageBase64);
```

**Response**: `VisionAnalysis`
```dart
VisionAnalysis(
  roomType: 'bedroom',
  wallColors: 'white with beige accents',
  windows: '2 large windows on east wall',
  doors: '1 door on north wall',
  existingFurniture: ['bed', 'nightstand', 'dresser'],
  lightingCondition: 'natural light, good exposure',
  freeSpaceWalls: 'west wall and south corner',
  structuralLimitations: 'load-bearing column in corner',
)
```

#### Generate Design Plan

Generates a comprehensive design plan based on specifications.

```dart
final designRequest = DesignRequest(
  length: 12.0,
  width: 10.0,
  height: 9.0,
  style: StyleType.modern,
  budget: BudgetLevel.medium,
  roomType: RoomType.bedroom,
  specialRequirements: 'Need home office corner',
);

final design = await client.design.generateDesignPlan(designRequest);
```

**Response**: `DesignResult`
```dart
DesignResult(
  roomLayoutStrategy: 'Open floor plan with defined zones...',
  furniturePlacement: [
    FurnitureItem(
      name: 'Queen Bed',
      type: 'bed',
      position: 'Center of east wall',
      dimensions: '60x80 inches',
      estimatedCost: 800.0,
    ),
    // ...more items
  ],
  lightingDesign: 'Layered lighting with ambient, task, and accent...',
  colorPalette: ['#FFFFFF', '#E5E5E5', '#2563EB', '#F59E0B'],
  materialsSuggestions: ['Oak hardwood', 'Linen curtains', 'Wool rug'],
  spaceOptimization: 'Utilize vertical space with floating shelves...',
  budgetBreakdown: {
    'furniture': '\$3,500',
    'lighting': '\$500',
    'decor': '\$800',
    'installation': '\$200',
  },
  reasoning: 'Modern minimalist approach chosen to maximize...',
)
```

#### Full Design Pipeline

Combines room analysis and design generation in one call.

```dart
final request = DesignRequest(
  length: 12.0,
  width: 10.0,
  height: 9.0,
  style: StyleType.minimalist,
  budget: BudgetLevel.high,
  roomType: RoomType.livingRoom,
  imageBase64: base64EncodedImage, // Optional
);

final result = await client.design.fullDesignPipeline(request);
```

#### Generate Visual

Creates a visual representation/render of the design.

```dart
final visualUrl = await client.design.generateVisual(designResult);
```

---

### Large-Scale Planning Endpoints

For townships, universities, hospitals, hotels, and other large projects.

#### Generate Master Plan

```dart
final request = LargeScaleRequest(
  projectType: ProjectType.township,
  scale: ProjectScale.complex,
  areaAcres: 50.0,
  budgetRange: '50M-100M',
  locationType: 'suburban',
  sustainabilityLevel: 'high',
  targetCapacity: 5000,
);

final masterPlan = await client.largeScale.generateMasterPlan(request);
```

#### Generate Construction Strategy

```dart
final strategy = await client.largeScale.generateConstructionStrategy(request);
```

#### Get Architectural Concepts

```dart
final concepts = await client.largeScale.getArchitecturalConcepts(request);
```

#### Get Environmental Assessment

```dart
final assessment = await client.largeScale.getEnvironmentalAssessment(request);
```

#### Complete Large-Scale Planning

Runs the full large-scale planning pipeline.

```dart
final fullPlan = await client.largeScale.completeLargeScalePlanning(request);
```

---

### Chat Endpoints

For real-time AI chat interactions.

#### Save Message

```dart
final message = await client.chat.saveMessage(
  ChatMessage(
    userId: 1,
    projectId: 123,
    content: 'Can you make the room brighter?',
    isFromUser: true,
    timestamp: DateTime.now(),
  ),
);
```

#### Get Project Chat History

```dart
final history = await client.chat.getProjectChatHistory(projectId, limit: 50);
```

#### Get User Chat History (Global)

```dart
final history = await client.chat.getUserChatHistory(userId, limit: 50);
```

---

## 🐍 Python AI Service API (Internal)

The Python AI service is called by Serverpod. Direct access for testing:

**Base URL**: `http://localhost:8000`

### POST /api/v1/analyze-room

Analyze a room image.

**Request**:
```json
{
  "image_base64": "base64_encoded_image_string"
}
```

**Response**:
```json
{
  "room_type": "bedroom",
  "wall_colors": "white",
  "windows": "2 windows",
  "doors": "1 door",
  "existing_furniture": ["bed", "desk"],
  "lighting_condition": "good natural light",
  "free_space_walls": "north wall",
  "structural_limitations": "none"
}
```

### POST /api/v1/design-plan

Generate a design plan.

**Request**:
```json
{
  "dimensions": {
    "length": 12,
    "width": 10,
    "height": 9
  },
  "style": "modern",
  "budget": "medium",
  "room_type": "bedroom",
  "special_requirements": "Need workspace"
}
```

**Response**:
```json
{
  "room_layout_strategy": "...",
  "furniture_placement": [...],
  "lighting_design": "...",
  "color_palette": [...],
  "materials_suggestions": [...],
  "space_optimization": "...",
  "budget_breakdown": {...},
  "reasoning": "..."
}
```

### POST /api/v1/full-design-pipeline

Complete design pipeline with optional image.

**Request**:
```json
{
  "dimensions": {"length": 12, "width": 10, "height": 9},
  "style": "modern",
  "budget": "medium",
  "room_type": "bedroom",
  "image_base64": "optional_base64_image"
}
```

### POST /api/v1/master-plan

Generate master plan for large-scale projects.

**Request**:
```json
{
  "project_type": "township",
  "scale": "complex",
  "area_acres": 50,
  "budget_range": "50M-100M",
  "location_type": "suburban",
  "sustainability_level": "high",
  "target_capacity": 5000
}
```

### POST /api/v1/construction-strategy

Generate construction strategy.

### POST /api/v1/architectural-concepts

Get architectural concepts.

### POST /api/v1/environmental-assessment

Environmental impact assessment.

### POST /api/v1/complete-large-scale-planning

Full large-scale planning pipeline.

### GET /health

Health check endpoint.

**Response**:
```json
{
  "status": "healthy",
  "service": "AI Design Copilot Backend",
  "gemini_configured": true
}
```

---

## 📊 Enums Reference

### StyleType
- `modern`
- `traditional`
- `minimalist`
- `industrial`
- `scandinavian`
- `bohemian`

### BudgetLevel
- `low`
- `medium`
- `high`
- `luxury`

### RoomType
- `bedroom`
- `livingRoom`
- `kitchen`
- `bathroom`
- `office`
- `diningRoom`

### ProjectType
- `residentialRoom`
- `residentialBuilding`
- `township`
- `university`
- `hospital`
- `hotel`
- `resort`
- `governmentBuilding`
- `farmhouse`
- `commercialComplex`
- `industrialComplex`
- `sector`
- `society`

### ProjectScale
- `room`
- `building`
- `complex`
- `township`
- `city`

### ProjectStatus
- `draft`
- `processing`
- `completed`
- `archived`

---

## 🔐 Authentication

Serverpod supports authentication via `serverpod_auth`. Currently configured for basic auth. To enable:

```dart
// Check auth status
if (serverConnection.isSignedIn) {
  final user = serverConnection.signedInUser;
}

// Sign out
await serverConnection.signOut();
```

---

## ⚠️ Error Handling

All endpoints may return errors:

```dart
try {
  final result = await client.design.generateDesignPlan(request);
} on ServerpodClientException catch (e) {
  print('Server error: ${e.message}');
} catch (e) {
  print('Unexpected error: $e');
}
```

---

## 📈 Rate Limits

- AI endpoints are rate-limited by Gemini API quotas
- Recommended: Implement client-side throttling for heavy users
- Production: Add Redis-based rate limiting in Serverpod

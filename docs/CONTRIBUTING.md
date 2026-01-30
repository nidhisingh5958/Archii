# 🤝 Contributing to Archii

Thank you for your interest in contributing to Archii! This document provides guidelines and instructions for contributing.

---

## 📋 Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Development Setup](#development-setup)
- [Project Structure](#project-structure)
- [Contribution Workflow](#contribution-workflow)
- [Coding Standards](#coding-standards)
- [Testing Guidelines](#testing-guidelines)
- [Documentation](#documentation)
- [Pull Request Process](#pull-request-process)

---

## 📜 Code of Conduct

We are committed to providing a welcoming and inclusive environment. Please:

- Be respectful and considerate
- Use welcoming and inclusive language
- Accept constructive criticism gracefully
- Focus on what's best for the community
- Show empathy towards other contributors

---

## 🚀 Getting Started

1. **Fork the repository** on GitHub
2. **Clone your fork** locally:
   ```bash
   git clone https://github.com/YOUR_USERNAME/archii.git
   cd archii
   ```
3. **Add upstream remote**:
   ```bash
   git remote add upstream https://github.com/ORIGINAL_OWNER/archii.git
   ```

---

## 🛠️ Development Setup

### Prerequisites

- Flutter SDK 3.10+
- Dart SDK 3.8+
- Python 3.10+
- Docker Desktop
- Serverpod CLI
- Google Gemini API key

### Setup Steps

```bash
# 1. Install Serverpod CLI
dart pub global activate serverpod_cli
export PATH="$PATH":"$HOME/.pub-cache/bin"

# 2. Start Docker containers
cd archii_server/archii_server_server
docker compose up -d

# 3. Generate Serverpod code
serverpod generate

# 4. Apply migrations
dart bin/main.dart --apply-migrations

# 5. Setup Python environment
cd ../../AI
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt

# 6. Setup Flutter app
cd ../app
flutter pub get
```

---

## 📁 Project Structure

```
archii/
├── app/                    # Flutter mobile app
│   ├── lib/
│   │   ├── screens/        # UI screens
│   │   ├── models/         # Data models
│   │   ├── services/       # API services
│   │   └── theme/          # Theming
│   └── test/               # Flutter tests
│
├── archii_server/          # Serverpod backend
│   ├── archii_server_server/
│   │   ├── lib/src/
│   │   │   ├── endpoints/  # API endpoints
│   │   │   └── protocol/   # Data models (YAML)
│   │   └── test/           # Server tests
│   └── archii_server_client/
│
├── AI/                     # Python AI service
│   ├── app/
│   │   ├── routes/         # API routes
│   │   ├── services/       # AI services
│   │   └── models/         # Pydantic models
│   └── tests/              # Python tests
│
└── docs/                   # Documentation
```

---

## 🔄 Contribution Workflow

### 1. Create a Branch

```bash
# Sync with upstream
git fetch upstream
git checkout main
git merge upstream/main

# Create feature branch
git checkout -b feature/your-feature-name
```

### Branch Naming Convention

- `feature/` - New features
- `fix/` - Bug fixes
- `docs/` - Documentation changes
- `refactor/` - Code refactoring
- `test/` - Adding tests

### 2. Make Changes

- Follow coding standards
- Write tests for new features
- Update documentation

### 3. Commit Changes

Use conventional commit messages:

```bash
# Format: <type>(<scope>): <description>

git commit -m "feat(design): add new room type support"
git commit -m "fix(api): resolve image upload timeout"
git commit -m "docs(readme): update installation steps"
git commit -m "refactor(services): simplify API client"
```

**Types:**
- `feat` - New feature
- `fix` - Bug fix
- `docs` - Documentation
- `style` - Formatting
- `refactor` - Code restructuring
- `test` - Adding tests
- `chore` - Maintenance

### 4. Push and Create PR

```bash
git push origin feature/your-feature-name
```

Then create a Pull Request on GitHub.

---

## 📝 Coding Standards

### Dart/Flutter

- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart) guidelines
- Use `flutter analyze` to check for issues
- Format with `dart format .`

```dart
// Good
class DesignService {
  final Client _client;
  
  DesignService(this._client);
  
  Future<DesignResult> generatePlan(DesignRequest request) async {
    return await _client.design.generateDesignPlan(request);
  }
}

// Avoid
class designService {
  var client;
  generatePlan(request) async {
    return client.design.generateDesignPlan(request);
  }
}
```

### Python

- Follow [PEP 8](https://pep8.org/) style guide
- Use type hints
- Format with `black .`
- Lint with `flake8`

```python
# Good
async def analyze_room(image_base64: str) -> VisionAnalysis:
    """Analyze room image and return structured analysis."""
    result = await vision_service.analyze(image_base64)
    return VisionAnalysis(**result)

# Avoid
def analyze_room(image):
    result = vision_service.analyze(image)
    return result
```

### Serverpod Protocol Files

```yaml
# Use clear, descriptive names
class: DesignRequest
fields:
  length: double
  width: double
  height: double
  style: StyleType
  budget: BudgetLevel
  roomType: RoomType?
  specialRequirements: String?
```

---

## 🧪 Testing Guidelines

### Flutter Tests

```bash
cd app
flutter test
flutter test --coverage
```

```dart
// test/services/design_service_test.dart
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DesignService', () {
    test('should generate design plan', () async {
      // Arrange
      final service = DesignService(mockClient);
      
      // Act
      final result = await service.generatePlan(request);
      
      // Assert
      expect(result.roomLayoutStrategy, isNotEmpty);
    });
  });
}
```

### Serverpod Tests

```bash
cd archii_server/archii_server_server
dart test
```

### Python Tests

```bash
cd AI
pytest
pytest --cov=app
```

```python
# tests/test_design_service.py
import pytest
from app.services.design_service import DesignService

@pytest.mark.asyncio
async def test_generate_design_plan():
    service = DesignService()
    result = await service.generate_plan(mock_request)
    assert result["room_layout_strategy"] is not None
```

---

## 📚 Documentation

- Update README files for significant changes
- Add docstrings to functions and classes
- Document API changes in `docs/API.md`
- Include code examples where helpful

### Dart Documentation

```dart
/// Generates a comprehensive design plan based on room specifications.
/// 
/// Takes a [DesignRequest] containing room dimensions, style preferences,
/// and budget constraints.
/// 
/// Returns a [DesignResult] with layout strategy, furniture placement,
/// and cost breakdown.
/// 
/// Throws [ServerpodClientException] if the server request fails.
Future<DesignResult> generateDesignPlan(DesignRequest request) async {
  // Implementation
}
```

### Python Documentation

```python
async def generate_design_plan(request: DesignRequest) -> DesignPlan:
    """
    Generate a comprehensive design plan.
    
    Args:
        request: Design specifications including dimensions, style, and budget.
        
    Returns:
        DesignPlan with layout strategy, furniture placement, and costs.
        
    Raises:
        ValueError: If dimensions are invalid.
        GeminiAPIError: If AI service fails.
    """
    pass
```

---

## 🔀 Pull Request Process

### Before Submitting

- [ ] Code follows project style guidelines
- [ ] Tests pass locally
- [ ] Documentation is updated
- [ ] Commit messages follow convention
- [ ] Branch is up to date with main

### PR Template

```markdown
## Description
Brief description of changes.

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Documentation update
- [ ] Refactoring

## Testing
Describe testing performed.

## Screenshots (if applicable)
Add screenshots for UI changes.

## Checklist
- [ ] Tests pass
- [ ] Documentation updated
- [ ] Code reviewed
```

### Review Process

1. At least one maintainer review required
2. All CI checks must pass
3. Address review feedback
4. Squash commits if requested

---

## 🐛 Reporting Issues

### Bug Reports

Include:
- Clear description
- Steps to reproduce
- Expected vs actual behavior
- Environment details
- Screenshots/logs if applicable

### Feature Requests

Include:
- Clear description of the feature
- Use case/motivation
- Proposed solution (optional)
- Alternatives considered

---

## 💬 Getting Help

- Open an issue for questions
- Join discussions in GitHub Discussions
- Tag maintainers for urgent issues

---

## 🙏 Thank You!

Your contributions make Archii better for everyone. We appreciate your time and effort!

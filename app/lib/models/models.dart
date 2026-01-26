class Project {
  final String id;
  final String name;
  final String roomType;
  final String style;
  final String imagePath;
  final DateTime createdAt;
  final double estimatedCost;
  final ProjectStatus status;

  Project({
    required this.id,
    required this.name,
    required this.roomType,
    required this.style,
    required this.imagePath,
    required this.createdAt,
    required this.estimatedCost,
    this.status = ProjectStatus.completed,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'roomType': roomType,
      'style': style,
      'imagePath': imagePath,
      'createdAt': createdAt.toIso8601String(),
      'estimatedCost': estimatedCost,
      'status': status.toString(),
    };
  }

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'],
      name: json['name'],
      roomType: json['roomType'],
      style: json['style'],
      imagePath: json['imagePath'],
      createdAt: DateTime.parse(json['createdAt']),
      estimatedCost: json['estimatedCost'],
      status: ProjectStatus.values.firstWhere(
        (e) => e.toString() == json['status'],
        orElse: () => ProjectStatus.completed,
      ),
    );
  }
}

enum ProjectStatus { draft, processing, completed, archived }

class DesignPreferences {
  final String style;
  final double budget;
  final List<String> colors;
  final List<String> purposes;
  final List<String> furniture;
  final RoomDimensions dimensions;

  DesignPreferences({
    required this.style,
    required this.budget,
    required this.colors,
    required this.purposes,
    required this.furniture,
    required this.dimensions,
  });

  Map<String, dynamic> toJson() {
    return {
      'style': style,
      'budget': budget,
      'colors': colors,
      'purposes': purposes,
      'furniture': furniture,
      'dimensions': dimensions.toJson(),
    };
  }

  factory DesignPreferences.fromJson(Map<String, dynamic> json) {
    return DesignPreferences(
      style: json['style'],
      budget: json['budget'],
      colors: List<String>.from(json['colors']),
      purposes: List<String>.from(json['purposes']),
      furniture: List<String>.from(json['furniture']),
      dimensions: RoomDimensions.fromJson(json['dimensions']),
    );
  }
}

class RoomDimensions {
  final double length;
  final double width;
  final double height;
  final String unit;

  RoomDimensions({
    required this.length,
    required this.width,
    required this.height,
    this.unit = 'ft',
  });

  Map<String, dynamic> toJson() {
    return {'length': length, 'width': width, 'height': height, 'unit': unit};
  }

  factory RoomDimensions.fromJson(Map<String, dynamic> json) {
    return RoomDimensions(
      length: json['length'],
      width: json['width'],
      height: json['height'],
      unit: json['unit'] ?? 'ft',
    );
  }

  double get area => length * width;
  double get volume => length * width * height;
}

class CostBreakdown {
  final double furniture;
  final double materials;
  final double lighting;
  final double decor;
  final double installation;

  CostBreakdown({
    required this.furniture,
    required this.materials,
    required this.lighting,
    required this.decor,
    required this.installation,
  });

  double get total => furniture + materials + lighting + decor + installation;

  Map<String, dynamic> toJson() {
    return {
      'furniture': furniture,
      'materials': materials,
      'lighting': lighting,
      'decor': decor,
      'installation': installation,
      'total': total,
    };
  }

  factory CostBreakdown.fromJson(Map<String, dynamic> json) {
    return CostBreakdown(
      furniture: json['furniture'],
      materials: json['materials'],
      lighting: json['lighting'],
      decor: json['decor'],
      installation: json['installation'],
    );
  }
}

class UserProfile {
  final String id;
  final String name;
  final String email;
  final String? photoUrl;
  final DateTime createdAt;
  final bool isPro;

  UserProfile({
    required this.id,
    required this.name,
    required this.email,
    this.photoUrl,
    required this.createdAt,
    this.isPro = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'photoUrl': photoUrl,
      'createdAt': createdAt.toIso8601String(),
      'isPro': isPro,
    };
  }

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      photoUrl: json['photoUrl'],
      createdAt: DateTime.parse(json['createdAt']),
      isPro: json['isPro'] ?? false,
    );
  }
}

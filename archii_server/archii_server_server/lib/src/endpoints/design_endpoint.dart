import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

/// Endpoint for AI design services - proxies requests to Python AI backend
class DesignEndpoint extends Endpoint {
  // Configure your AI service URL
  static const String _aiServiceUrl = String.fromEnvironment(
    'AI_SERVICE_URL',
    defaultValue: 'http://localhost:8000',
  );

  /// Analyze a room image using AI vision
  Future<VisionAnalysis> analyzeRoom(
    Session session,
    String imageBase64,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$_aiServiceUrl/api/v1/analyze-room'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'image_base64': imageBase64}),
      );

      if (response.statusCode != 200) {
        throw Exception('AI service error: ${response.body}');
      }

      final data = jsonDecode(response.body);
      return VisionAnalysis(
        roomType: data['room_type'] ?? '',
        wallColors: data['wall_colors'] ?? '',
        windows: data['windows'] ?? '',
        doors: data['doors'] ?? '',
        existingFurniture: List<String>.from(data['existing_furniture'] ?? []),
        lightingCondition: data['lighting_condition'] ?? '',
        freeSpaceWalls: data['free_space_walls'] ?? '',
        structuralLimitations: data['structural_limitations'] ?? '',
      );
    } catch (e) {
      session.log('Error analyzing room: $e', level: LogLevel.error);
      rethrow;
    }
  }

  /// Generate a design plan based on requirements
  Future<DesignResult> generateDesignPlan(
    Session session,
    DesignRequest request,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$_aiServiceUrl/api/v1/design-plan'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'dimensions': {
            'length': request.length,
            'width': request.width,
            'height': request.height,
          },
          'style': request.style.name,
          'budget': request.budget.name,
          'room_type': request.roomType?.name,
          'special_requirements': request.specialRequirements,
        }),
      );

      if (response.statusCode != 200) {
        throw Exception('AI service error: ${response.body}');
      }

      final data = jsonDecode(response.body);
      return _parseDesignResult(data);
    } catch (e) {
      session.log('Error generating design plan: $e', level: LogLevel.error);
      rethrow;
    }
  }

  /// Full design pipeline: analyze image + generate design
  Future<DesignResult> fullDesignPipeline(
    Session session,
    DesignRequest request,
  ) async {
    try {
      final body = {
        'dimensions': {
          'length': request.length,
          'width': request.width,
          'height': request.height,
        },
        'style': request.style.name,
        'budget': request.budget.name,
        'room_type': request.roomType?.name,
        'special_requirements': request.specialRequirements,
      };

      // Include image if provided
      if (request.imageBase64 != null) {
        body['image_base64'] = request.imageBase64!;
      }

      final response = await http.post(
        Uri.parse('$_aiServiceUrl/api/v1/full-design-pipeline'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      if (response.statusCode != 200) {
        throw Exception('AI service error: ${response.body}');
      }

      final data = jsonDecode(response.body);
      return _parseDesignResult(data['design_plan'] ?? data);
    } catch (e) {
      session.log('Error in full design pipeline: $e', level: LogLevel.error);
      rethrow;
    }
  }

  /// Generate visual representation of a design
  Future<String> generateVisual(
    Session session,
    DesignResult designPlan,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$_aiServiceUrl/api/v1/generate-visual'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'room_layout_strategy': designPlan.roomLayoutStrategy,
          'color_palette': designPlan.colorPalette,
          'materials_suggestions': designPlan.materialsSuggestions,
        }),
      );

      if (response.statusCode != 200) {
        throw Exception('AI service error: ${response.body}');
      }

      final data = jsonDecode(response.body);
      return data['visual_url'] ?? data['description'] ?? '';
    } catch (e) {
      session.log('Error generating visual: $e', level: LogLevel.error);
      rethrow;
    }
  }

  DesignResult _parseDesignResult(Map<String, dynamic> data) {
    final furnitureList = <FurnitureItem>[];
    if (data['furniture_placement'] != null) {
      for (final item in data['furniture_placement']) {
        furnitureList.add(
          FurnitureItem(
            name: item['name'] ?? '',
            type: item['type'] ?? '',
            position: item['position'] ?? '',
            dimensions: item['dimensions'],
            estimatedCost: item['estimated_cost']?.toDouble(),
            notes: item['notes'],
          ),
        );
      }
    }

    return DesignResult(
      roomLayoutStrategy: data['room_layout_strategy'] ?? '',
      furniturePlacement: furnitureList,
      lightingDesign: data['lighting_design'] ?? '',
      colorPalette: List<String>.from(data['color_palette'] ?? []),
      materialsSuggestions: List<String>.from(
        data['materials_suggestions'] ?? [],
      ),
      spaceOptimization: data['space_optimization'] ?? '',
      budgetBreakdown: Map<String, String>.from(
        (data['budget_breakdown'] ?? {}).map(
          (k, v) => MapEntry(k.toString(), v.toString()),
        ),
      ),
      reasoning: data['reasoning'] ?? '',
      generatedImageUrl: data['generated_image_url'],
    );
  }
}

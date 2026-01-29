import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

/// Endpoint for large-scale architectural projects (townships, complexes, etc.)
class LargeScaleEndpoint extends Endpoint {
  static const String _aiServiceUrl = String.fromEnvironment(
    'AI_SERVICE_URL',
    defaultValue: 'http://localhost:8000',
  );

  /// Generate a master plan for large-scale projects
  Future<Map<String, dynamic>> generateMasterPlan(
    Session session,
    LargeScaleRequest request,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$_aiServiceUrl/api/v1/master-plan'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'project_type': request.projectType.name,
          'scale': request.scale.name,
          'area_acres': request.areaAcres,
          'budget_range': request.budgetRange,
          'location_type': request.locationType,
          'special_requirements': request.specialRequirements,
          'sustainability_level': request.sustainabilityLevel ?? 'medium',
          'target_capacity': request.targetCapacity,
        }),
      );

      if (response.statusCode != 200) {
        throw Exception('AI service error: ${response.body}');
      }

      return jsonDecode(response.body) as Map<String, dynamic>;
    } catch (e) {
      session.log('Error generating master plan: $e', level: LogLevel.error);
      rethrow;
    }
  }

  /// Generate construction strategy
  Future<Map<String, dynamic>> generateConstructionStrategy(
    Session session,
    LargeScaleRequest request,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$_aiServiceUrl/api/v1/construction-strategy'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'project_type': request.projectType.name,
          'scale': request.scale.name,
          'area_acres': request.areaAcres,
          'budget_range': request.budgetRange,
          'location_type': request.locationType,
        }),
      );

      if (response.statusCode != 200) {
        throw Exception('AI service error: ${response.body}');
      }

      return jsonDecode(response.body) as Map<String, dynamic>;
    } catch (e) {
      session.log(
        'Error generating construction strategy: $e',
        level: LogLevel.error,
      );
      rethrow;
    }
  }

  /// Get architectural concepts
  Future<Map<String, dynamic>> getArchitecturalConcepts(
    Session session,
    LargeScaleRequest request,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$_aiServiceUrl/api/v1/architectural-concepts'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'project_type': request.projectType.name,
          'scale': request.scale.name,
          'location_type': request.locationType,
          'sustainability_level': request.sustainabilityLevel ?? 'medium',
        }),
      );

      if (response.statusCode != 200) {
        throw Exception('AI service error: ${response.body}');
      }

      return jsonDecode(response.body) as Map<String, dynamic>;
    } catch (e) {
      session.log(
        'Error getting architectural concepts: $e',
        level: LogLevel.error,
      );
      rethrow;
    }
  }

  /// Environmental assessment
  Future<Map<String, dynamic>> getEnvironmentalAssessment(
    Session session,
    LargeScaleRequest request,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$_aiServiceUrl/api/v1/environmental-assessment'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'project_type': request.projectType.name,
          'area_acres': request.areaAcres,
          'location_type': request.locationType,
          'sustainability_level': request.sustainabilityLevel ?? 'medium',
        }),
      );

      if (response.statusCode != 200) {
        throw Exception('AI service error: ${response.body}');
      }

      return jsonDecode(response.body) as Map<String, dynamic>;
    } catch (e) {
      session.log(
        'Error getting environmental assessment: $e',
        level: LogLevel.error,
      );
      rethrow;
    }
  }

  /// Complete large-scale planning (combines all above)
  Future<Map<String, dynamic>> completeLargeScalePlanning(
    Session session,
    LargeScaleRequest request,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$_aiServiceUrl/api/v1/complete-large-scale-planning'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'project_type': request.projectType.name,
          'scale': request.scale.name,
          'area_acres': request.areaAcres,
          'budget_range': request.budgetRange,
          'location_type': request.locationType,
          'special_requirements': request.specialRequirements,
          'sustainability_level': request.sustainabilityLevel ?? 'medium',
          'target_capacity': request.targetCapacity,
        }),
      );

      if (response.statusCode != 200) {
        throw Exception('AI service error: ${response.body}');
      }

      return jsonDecode(response.body) as Map<String, dynamic>;
    } catch (e) {
      session.log(
        'Error in complete large-scale planning: $e',
        level: LogLevel.error,
      );
      rethrow;
    }
  }
}

import 'package:archii_server_client/archii_server_client.dart';
import 'server_connection.dart';

/// Service for large-scale project operations (townships, complexes, etc.)
class LargeScaleApiService {
  final _client = serverConnection.client;

  /// Generate a master plan
  Future<Map<String, dynamic>> generateMasterPlan({
    required ProjectType projectType,
    required ProjectScale scale,
    required double areaAcres,
    required String budgetRange,
    required String locationType,
    String? specialRequirements,
    String? sustainabilityLevel,
    int? targetCapacity,
  }) async {
    final request = LargeScaleRequest(
      projectType: projectType,
      scale: scale,
      areaAcres: areaAcres,
      budgetRange: budgetRange,
      locationType: locationType,
      specialRequirements: specialRequirements,
      sustainabilityLevel: sustainabilityLevel,
      targetCapacity: targetCapacity,
    );
    return await _client.largeScale.generateMasterPlan(request);
  }

  /// Generate construction strategy
  Future<Map<String, dynamic>> generateConstructionStrategy({
    required ProjectType projectType,
    required ProjectScale scale,
    required double areaAcres,
    required String budgetRange,
    required String locationType,
  }) async {
    final request = LargeScaleRequest(
      projectType: projectType,
      scale: scale,
      areaAcres: areaAcres,
      budgetRange: budgetRange,
      locationType: locationType,
    );
    return await _client.largeScale.generateConstructionStrategy(request);
  }

  /// Get architectural concepts
  Future<Map<String, dynamic>> getArchitecturalConcepts({
    required ProjectType projectType,
    required ProjectScale scale,
    required String locationType,
    String? sustainabilityLevel,
  }) async {
    final request = LargeScaleRequest(
      projectType: projectType,
      scale: scale,
      areaAcres: 0, // Not needed for concepts
      budgetRange: '', // Not needed for concepts
      locationType: locationType,
      sustainabilityLevel: sustainabilityLevel,
    );
    return await _client.largeScale.getArchitecturalConcepts(request);
  }

  /// Get environmental assessment
  Future<Map<String, dynamic>> getEnvironmentalAssessment({
    required ProjectType projectType,
    required double areaAcres,
    required String locationType,
    String? sustainabilityLevel,
  }) async {
    final request = LargeScaleRequest(
      projectType: projectType,
      scale: ProjectScale.building, // Default
      areaAcres: areaAcres,
      budgetRange: '', // Not needed
      locationType: locationType,
      sustainabilityLevel: sustainabilityLevel,
    );
    return await _client.largeScale.getEnvironmentalAssessment(request);
  }

  /// Complete large-scale planning
  Future<Map<String, dynamic>> completeLargeScalePlanning({
    required ProjectType projectType,
    required ProjectScale scale,
    required double areaAcres,
    required String budgetRange,
    required String locationType,
    String? specialRequirements,
    String? sustainabilityLevel,
    int? targetCapacity,
  }) async {
    final request = LargeScaleRequest(
      projectType: projectType,
      scale: scale,
      areaAcres: areaAcres,
      budgetRange: budgetRange,
      locationType: locationType,
      specialRequirements: specialRequirements,
      sustainabilityLevel: sustainabilityLevel,
      targetCapacity: targetCapacity,
    );
    return await _client.largeScale.completeLargeScalePlanning(request);
  }
}

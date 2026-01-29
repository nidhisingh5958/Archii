import 'package:archii_server_client/archii_server_client.dart';
import 'server_connection.dart';

/// Service for managing design-related operations via Serverpod
class DesignApiService {
  final _client = serverConnection.client;

  /// Analyze a room image
  Future<VisionAnalysis> analyzeRoom(String imageBase64) async {
    return await _client.design.analyzeRoom(imageBase64);
  }

  /// Generate a design plan
  Future<DesignResult> generateDesignPlan({
    required double length,
    required double width,
    required double height,
    required StyleType style,
    required BudgetLevel budget,
    RoomType? roomType,
    String? specialRequirements,
    String? imageBase64,
  }) async {
    final request = DesignRequest(
      length: length,
      width: width,
      height: height,
      style: style,
      budget: budget,
      roomType: roomType,
      specialRequirements: specialRequirements,
      imageBase64: imageBase64,
    );
    return await _client.design.generateDesignPlan(request);
  }

  /// Full design pipeline (analyze + generate)
  Future<DesignResult> fullDesignPipeline({
    required double length,
    required double width,
    required double height,
    required StyleType style,
    required BudgetLevel budget,
    RoomType? roomType,
    String? specialRequirements,
    String? imageBase64,
  }) async {
    final request = DesignRequest(
      length: length,
      width: width,
      height: height,
      style: style,
      budget: budget,
      roomType: roomType,
      specialRequirements: specialRequirements,
      imageBase64: imageBase64,
    );
    return await _client.design.fullDesignPipeline(request);
  }

  /// Generate visual representation
  Future<String> generateVisual(DesignResult designPlan) async {
    return await _client.design.generateVisual(designPlan);
  }
}

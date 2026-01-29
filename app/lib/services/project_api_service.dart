import 'package:archii_server_client/archii_server_client.dart';
import 'server_connection.dart';

/// Service for managing projects via Serverpod
class ProjectApiService {
  final _client = serverConnection.client;

  /// Create a new project
  Future<Project> createProject({
    required String name,
    required String roomType,
    required String style,
    String? imagePath,
    required double estimatedCost,
    required int userId,
    ProjectStatus status = ProjectStatus.draft,
  }) async {
    final project = Project(
      name: name,
      roomType: roomType,
      style: style,
      imagePath: imagePath,
      estimatedCost: estimatedCost,
      status: status,
      userId: userId,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    return await _client.project.createProject(project);
  }

  /// Get all projects for a user
  Future<List<Project>> getUserProjects(int userId) async {
    return await _client.project.getUserProjects(userId);
  }

  /// Get a single project by ID
  Future<Project?> getProject(int projectId) async {
    return await _client.project.getProject(projectId);
  }

  /// Update a project
  Future<Project> updateProject(Project project) async {
    return await _client.project.updateProject(project);
  }

  /// Delete a project
  Future<bool> deleteProject(int projectId) async {
    return await _client.project.deleteProject(projectId);
  }

  /// Update project status
  Future<Project?> updateProjectStatus(
    int projectId,
    ProjectStatus status,
  ) async {
    return await _client.project.updateProjectStatus(projectId, status);
  }

  /// Get projects by status
  Future<List<Project>> getProjectsByStatus(
    int userId,
    ProjectStatus status,
  ) async {
    return await _client.project.getProjectsByStatus(userId, status);
  }
}

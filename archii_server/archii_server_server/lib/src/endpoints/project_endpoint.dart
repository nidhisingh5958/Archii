import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

/// Endpoint for managing architectural design projects
class ProjectEndpoint extends Endpoint {
  /// Create a new project
  Future<Project> createProject(Session session, Project project) async {
    // Set timestamps
    project.createdAt = DateTime.now();
    project.updatedAt = DateTime.now();

    // Insert into database
    return await Project.db.insertRow(session, project);
  }

  /// Get all projects for a user
  Future<List<Project>> getUserProjects(Session session, int userId) async {
    return await Project.db.find(
      session,
      where: (t) => t.userId.equals(userId),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
    );
  }

  /// Get a single project by ID
  Future<Project?> getProject(Session session, int projectId) async {
    return await Project.db.findById(session, projectId);
  }

  /// Update a project
  Future<Project> updateProject(Session session, Project project) async {
    project.updatedAt = DateTime.now();
    return await Project.db.updateRow(session, project);
  }

  /// Delete a project
  Future<bool> deleteProject(Session session, int projectId) async {
    final deleted = await Project.db.deleteWhere(
      session,
      where: (t) => t.id.equals(projectId),
    );
    return deleted.isNotEmpty;
  }

  /// Update project status
  Future<Project?> updateProjectStatus(
    Session session,
    int projectId,
    ProjectStatus status,
  ) async {
    final project = await Project.db.findById(session, projectId);
    if (project == null) return null;

    project.status = status;
    project.updatedAt = DateTime.now();
    return await Project.db.updateRow(session, project);
  }

  /// Get projects by status
  Future<List<Project>> getProjectsByStatus(
    Session session,
    int userId,
    ProjectStatus status,
  ) async {
    return await Project.db.find(
      session,
      where: (t) => t.userId.equals(userId) & t.status.equals(status),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
    );
  }
}

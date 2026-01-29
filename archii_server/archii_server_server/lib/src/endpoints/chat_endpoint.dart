import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

/// Endpoint for real-time chat with AI design assistant
class ChatEndpoint extends Endpoint {
  /// Save a chat message to the database
  Future<ChatMessage> saveMessage(
    Session session,
    ChatMessage message,
  ) async {
    message.timestamp = DateTime.now();
    return await ChatMessage.db.insertRow(session, message);
  }

  /// Get chat history for a project
  Future<List<ChatMessage>> getProjectChatHistory(
    Session session,
    int projectId, {
    int limit = 50,
  }) async {
    return await ChatMessage.db.find(
      session,
      where: (t) => t.projectId.equals(projectId),
      orderBy: (t) => t.timestamp,
      orderDescending: false,
      limit: limit,
    );
  }

  /// Get chat history for a user (global chat)
  Future<List<ChatMessage>> getUserChatHistory(
    Session session,
    int userId, {
    int limit = 50,
  }) async {
    return await ChatMessage.db.find(
      session,
      where: (t) => t.userId.equals(userId) & t.projectId.equals(null),
      orderBy: (t) => t.timestamp,
      orderDescending: false,
      limit: limit,
    );
  }

  /// Delete chat history for a project
  Future<int> clearProjectChatHistory(
    Session session,
    int projectId,
  ) async {
    final deleted = await ChatMessage.db.deleteWhere(
      session,
      where: (t) => t.projectId.equals(projectId),
    );
    return deleted.length;
  }

  /// Stream chat message (for real-time updates)
  /// This creates a message stream channel that clients can subscribe to
  @override
  Future<void> streamOpened(StreamingSession session) async {
    // Called when a client opens a streaming connection
    session.log('Chat stream opened');
  }

  @override
  Future<void> handleStreamMessage(
    StreamingSession session,
    SerializableModel message,
  ) async {
    // Handle incoming stream messages
    if (message is ChatMessage) {
      // Save the message
      final savedMessage = await saveMessage(session, message);

      // Broadcast to all connected clients for this project
      if (savedMessage.projectId != null) {
        sendStreamMessage(session, savedMessage);
      }
    }
  }

  @override
  Future<void> streamClosed(StreamingSession session) async {
    session.log('Chat stream closed');
  }
}

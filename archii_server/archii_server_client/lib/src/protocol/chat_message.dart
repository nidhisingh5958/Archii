/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'package:archii_server_client/src/protocol/protocol.dart' as _i2;

/// Protocol file for Chat Message
/// For real-time AI chat communication
abstract class ChatMessage implements _i1.SerializableModel {
  ChatMessage._({
    this.id,
    this.projectId,
    required this.userId,
    required this.content,
    required this.isFromUser,
    required this.timestamp,
    this.metadata,
  });

  factory ChatMessage({
    int? id,
    int? projectId,
    required int userId,
    required String content,
    required bool isFromUser,
    required DateTime timestamp,
    Map<String, String>? metadata,
  }) = _ChatMessageImpl;

  factory ChatMessage.fromJson(Map<String, dynamic> jsonSerialization) {
    return ChatMessage(
      id: jsonSerialization['id'] as int?,
      projectId: jsonSerialization['projectId'] as int?,
      userId: jsonSerialization['userId'] as int,
      content: jsonSerialization['content'] as String,
      isFromUser: jsonSerialization['isFromUser'] as bool,
      timestamp: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['timestamp'],
      ),
      metadata: jsonSerialization['metadata'] == null
          ? null
          : _i2.Protocol().deserialize<Map<String, String>>(
              jsonSerialization['metadata'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int? projectId;

  int userId;

  String content;

  bool isFromUser;

  DateTime timestamp;

  Map<String, String>? metadata;

  /// Returns a shallow copy of this [ChatMessage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ChatMessage copyWith({
    int? id,
    int? projectId,
    int? userId,
    String? content,
    bool? isFromUser,
    DateTime? timestamp,
    Map<String, String>? metadata,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ChatMessage',
      if (id != null) 'id': id,
      if (projectId != null) 'projectId': projectId,
      'userId': userId,
      'content': content,
      'isFromUser': isFromUser,
      'timestamp': timestamp.toJson(),
      if (metadata != null) 'metadata': metadata?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ChatMessageImpl extends ChatMessage {
  _ChatMessageImpl({
    int? id,
    int? projectId,
    required int userId,
    required String content,
    required bool isFromUser,
    required DateTime timestamp,
    Map<String, String>? metadata,
  }) : super._(
         id: id,
         projectId: projectId,
         userId: userId,
         content: content,
         isFromUser: isFromUser,
         timestamp: timestamp,
         metadata: metadata,
       );

  /// Returns a shallow copy of this [ChatMessage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ChatMessage copyWith({
    Object? id = _Undefined,
    Object? projectId = _Undefined,
    int? userId,
    String? content,
    bool? isFromUser,
    DateTime? timestamp,
    Object? metadata = _Undefined,
  }) {
    return ChatMessage(
      id: id is int? ? id : this.id,
      projectId: projectId is int? ? projectId : this.projectId,
      userId: userId ?? this.userId,
      content: content ?? this.content,
      isFromUser: isFromUser ?? this.isFromUser,
      timestamp: timestamp ?? this.timestamp,
      metadata: metadata is Map<String, String>?
          ? metadata
          : this.metadata?.map(
              (
                key0,
                value0,
              ) => MapEntry(
                key0,
                value0,
              ),
            ),
    );
  }
}

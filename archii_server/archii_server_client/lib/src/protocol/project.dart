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
import 'project_status.dart' as _i2;

/// Protocol file for Project model
/// Maps to your existing Flutter Project model
abstract class Project implements _i1.SerializableModel {
  Project._({
    this.id,
    required this.name,
    required this.roomType,
    required this.style,
    this.imagePath,
    required this.estimatedCost,
    required this.status,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Project({
    int? id,
    required String name,
    required String roomType,
    required String style,
    String? imagePath,
    required double estimatedCost,
    required _i2.ProjectStatus status,
    required int userId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ProjectImpl;

  factory Project.fromJson(Map<String, dynamic> jsonSerialization) {
    return Project(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      roomType: jsonSerialization['roomType'] as String,
      style: jsonSerialization['style'] as String,
      imagePath: jsonSerialization['imagePath'] as String?,
      estimatedCost: (jsonSerialization['estimatedCost'] as num).toDouble(),
      status: _i2.ProjectStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      userId: jsonSerialization['userId'] as int,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String roomType;

  String style;

  String? imagePath;

  double estimatedCost;

  _i2.ProjectStatus status;

  int userId;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [Project]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Project copyWith({
    int? id,
    String? name,
    String? roomType,
    String? style,
    String? imagePath,
    double? estimatedCost,
    _i2.ProjectStatus? status,
    int? userId,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Project',
      if (id != null) 'id': id,
      'name': name,
      'roomType': roomType,
      'style': style,
      if (imagePath != null) 'imagePath': imagePath,
      'estimatedCost': estimatedCost,
      'status': status.toJson(),
      'userId': userId,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProjectImpl extends Project {
  _ProjectImpl({
    int? id,
    required String name,
    required String roomType,
    required String style,
    String? imagePath,
    required double estimatedCost,
    required _i2.ProjectStatus status,
    required int userId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         name: name,
         roomType: roomType,
         style: style,
         imagePath: imagePath,
         estimatedCost: estimatedCost,
         status: status,
         userId: userId,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [Project]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Project copyWith({
    Object? id = _Undefined,
    String? name,
    String? roomType,
    String? style,
    Object? imagePath = _Undefined,
    double? estimatedCost,
    _i2.ProjectStatus? status,
    int? userId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Project(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      roomType: roomType ?? this.roomType,
      style: style ?? this.style,
      imagePath: imagePath is String? ? imagePath : this.imagePath,
      estimatedCost: estimatedCost ?? this.estimatedCost,
      status: status ?? this.status,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

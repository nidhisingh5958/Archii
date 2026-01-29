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
import 'package:serverpod/serverpod.dart' as _i1;

/// Protocol file for Furniture Item
abstract class FurnitureItem
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  FurnitureItem._({
    required this.name,
    required this.type,
    required this.position,
    this.dimensions,
    this.estimatedCost,
    this.notes,
  });

  factory FurnitureItem({
    required String name,
    required String type,
    required String position,
    String? dimensions,
    double? estimatedCost,
    String? notes,
  }) = _FurnitureItemImpl;

  factory FurnitureItem.fromJson(Map<String, dynamic> jsonSerialization) {
    return FurnitureItem(
      name: jsonSerialization['name'] as String,
      type: jsonSerialization['type'] as String,
      position: jsonSerialization['position'] as String,
      dimensions: jsonSerialization['dimensions'] as String?,
      estimatedCost: (jsonSerialization['estimatedCost'] as num?)?.toDouble(),
      notes: jsonSerialization['notes'] as String?,
    );
  }

  String name;

  String type;

  String position;

  String? dimensions;

  double? estimatedCost;

  String? notes;

  /// Returns a shallow copy of this [FurnitureItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  FurnitureItem copyWith({
    String? name,
    String? type,
    String? position,
    String? dimensions,
    double? estimatedCost,
    String? notes,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'FurnitureItem',
      'name': name,
      'type': type,
      'position': position,
      if (dimensions != null) 'dimensions': dimensions,
      if (estimatedCost != null) 'estimatedCost': estimatedCost,
      if (notes != null) 'notes': notes,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'FurnitureItem',
      'name': name,
      'type': type,
      'position': position,
      if (dimensions != null) 'dimensions': dimensions,
      if (estimatedCost != null) 'estimatedCost': estimatedCost,
      if (notes != null) 'notes': notes,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _FurnitureItemImpl extends FurnitureItem {
  _FurnitureItemImpl({
    required String name,
    required String type,
    required String position,
    String? dimensions,
    double? estimatedCost,
    String? notes,
  }) : super._(
         name: name,
         type: type,
         position: position,
         dimensions: dimensions,
         estimatedCost: estimatedCost,
         notes: notes,
       );

  /// Returns a shallow copy of this [FurnitureItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  FurnitureItem copyWith({
    String? name,
    String? type,
    String? position,
    Object? dimensions = _Undefined,
    Object? estimatedCost = _Undefined,
    Object? notes = _Undefined,
  }) {
    return FurnitureItem(
      name: name ?? this.name,
      type: type ?? this.type,
      position: position ?? this.position,
      dimensions: dimensions is String? ? dimensions : this.dimensions,
      estimatedCost: estimatedCost is double?
          ? estimatedCost
          : this.estimatedCost,
      notes: notes is String? ? notes : this.notes,
    );
  }
}

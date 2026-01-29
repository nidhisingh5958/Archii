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
import 'style_type.dart' as _i2;
import 'budget_level.dart' as _i3;
import 'room_type.dart' as _i4;

/// Protocol file for Design Request
/// Used for AI design generation requests
abstract class DesignRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  DesignRequest._({
    required this.length,
    required this.width,
    required this.height,
    required this.style,
    required this.budget,
    this.roomType,
    this.specialRequirements,
    this.imageBase64,
  });

  factory DesignRequest({
    required double length,
    required double width,
    required double height,
    required _i2.StyleType style,
    required _i3.BudgetLevel budget,
    _i4.RoomType? roomType,
    String? specialRequirements,
    String? imageBase64,
  }) = _DesignRequestImpl;

  factory DesignRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return DesignRequest(
      length: (jsonSerialization['length'] as num).toDouble(),
      width: (jsonSerialization['width'] as num).toDouble(),
      height: (jsonSerialization['height'] as num).toDouble(),
      style: _i2.StyleType.fromJson((jsonSerialization['style'] as String)),
      budget: _i3.BudgetLevel.fromJson((jsonSerialization['budget'] as String)),
      roomType: jsonSerialization['roomType'] == null
          ? null
          : _i4.RoomType.fromJson((jsonSerialization['roomType'] as String)),
      specialRequirements: jsonSerialization['specialRequirements'] as String?,
      imageBase64: jsonSerialization['imageBase64'] as String?,
    );
  }

  double length;

  double width;

  double height;

  _i2.StyleType style;

  _i3.BudgetLevel budget;

  _i4.RoomType? roomType;

  String? specialRequirements;

  String? imageBase64;

  /// Returns a shallow copy of this [DesignRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DesignRequest copyWith({
    double? length,
    double? width,
    double? height,
    _i2.StyleType? style,
    _i3.BudgetLevel? budget,
    _i4.RoomType? roomType,
    String? specialRequirements,
    String? imageBase64,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'DesignRequest',
      'length': length,
      'width': width,
      'height': height,
      'style': style.toJson(),
      'budget': budget.toJson(),
      if (roomType != null) 'roomType': roomType?.toJson(),
      if (specialRequirements != null)
        'specialRequirements': specialRequirements,
      if (imageBase64 != null) 'imageBase64': imageBase64,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'DesignRequest',
      'length': length,
      'width': width,
      'height': height,
      'style': style.toJson(),
      'budget': budget.toJson(),
      if (roomType != null) 'roomType': roomType?.toJson(),
      if (specialRequirements != null)
        'specialRequirements': specialRequirements,
      if (imageBase64 != null) 'imageBase64': imageBase64,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DesignRequestImpl extends DesignRequest {
  _DesignRequestImpl({
    required double length,
    required double width,
    required double height,
    required _i2.StyleType style,
    required _i3.BudgetLevel budget,
    _i4.RoomType? roomType,
    String? specialRequirements,
    String? imageBase64,
  }) : super._(
         length: length,
         width: width,
         height: height,
         style: style,
         budget: budget,
         roomType: roomType,
         specialRequirements: specialRequirements,
         imageBase64: imageBase64,
       );

  /// Returns a shallow copy of this [DesignRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DesignRequest copyWith({
    double? length,
    double? width,
    double? height,
    _i2.StyleType? style,
    _i3.BudgetLevel? budget,
    Object? roomType = _Undefined,
    Object? specialRequirements = _Undefined,
    Object? imageBase64 = _Undefined,
  }) {
    return DesignRequest(
      length: length ?? this.length,
      width: width ?? this.width,
      height: height ?? this.height,
      style: style ?? this.style,
      budget: budget ?? this.budget,
      roomType: roomType is _i4.RoomType? ? roomType : this.roomType,
      specialRequirements: specialRequirements is String?
          ? specialRequirements
          : this.specialRequirements,
      imageBase64: imageBase64 is String? ? imageBase64 : this.imageBase64,
    );
  }
}

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
import 'project_type.dart' as _i2;
import 'project_scale.dart' as _i3;

/// Protocol file for Large Scale Project Request
/// For township, complex, building projects
abstract class LargeScaleRequest implements _i1.SerializableModel {
  LargeScaleRequest._({
    required this.projectType,
    required this.scale,
    required this.areaAcres,
    required this.budgetRange,
    required this.locationType,
    this.specialRequirements,
    this.sustainabilityLevel,
    this.targetCapacity,
  });

  factory LargeScaleRequest({
    required _i2.ProjectType projectType,
    required _i3.ProjectScale scale,
    required double areaAcres,
    required String budgetRange,
    required String locationType,
    String? specialRequirements,
    String? sustainabilityLevel,
    int? targetCapacity,
  }) = _LargeScaleRequestImpl;

  factory LargeScaleRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return LargeScaleRequest(
      projectType: _i2.ProjectType.fromJson(
        (jsonSerialization['projectType'] as String),
      ),
      scale: _i3.ProjectScale.fromJson((jsonSerialization['scale'] as String)),
      areaAcres: (jsonSerialization['areaAcres'] as num).toDouble(),
      budgetRange: jsonSerialization['budgetRange'] as String,
      locationType: jsonSerialization['locationType'] as String,
      specialRequirements: jsonSerialization['specialRequirements'] as String?,
      sustainabilityLevel: jsonSerialization['sustainabilityLevel'] as String?,
      targetCapacity: jsonSerialization['targetCapacity'] as int?,
    );
  }

  _i2.ProjectType projectType;

  _i3.ProjectScale scale;

  double areaAcres;

  String budgetRange;

  String locationType;

  String? specialRequirements;

  String? sustainabilityLevel;

  int? targetCapacity;

  /// Returns a shallow copy of this [LargeScaleRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  LargeScaleRequest copyWith({
    _i2.ProjectType? projectType,
    _i3.ProjectScale? scale,
    double? areaAcres,
    String? budgetRange,
    String? locationType,
    String? specialRequirements,
    String? sustainabilityLevel,
    int? targetCapacity,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'LargeScaleRequest',
      'projectType': projectType.toJson(),
      'scale': scale.toJson(),
      'areaAcres': areaAcres,
      'budgetRange': budgetRange,
      'locationType': locationType,
      if (specialRequirements != null)
        'specialRequirements': specialRequirements,
      if (sustainabilityLevel != null)
        'sustainabilityLevel': sustainabilityLevel,
      if (targetCapacity != null) 'targetCapacity': targetCapacity,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LargeScaleRequestImpl extends LargeScaleRequest {
  _LargeScaleRequestImpl({
    required _i2.ProjectType projectType,
    required _i3.ProjectScale scale,
    required double areaAcres,
    required String budgetRange,
    required String locationType,
    String? specialRequirements,
    String? sustainabilityLevel,
    int? targetCapacity,
  }) : super._(
         projectType: projectType,
         scale: scale,
         areaAcres: areaAcres,
         budgetRange: budgetRange,
         locationType: locationType,
         specialRequirements: specialRequirements,
         sustainabilityLevel: sustainabilityLevel,
         targetCapacity: targetCapacity,
       );

  /// Returns a shallow copy of this [LargeScaleRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  LargeScaleRequest copyWith({
    _i2.ProjectType? projectType,
    _i3.ProjectScale? scale,
    double? areaAcres,
    String? budgetRange,
    String? locationType,
    Object? specialRequirements = _Undefined,
    Object? sustainabilityLevel = _Undefined,
    Object? targetCapacity = _Undefined,
  }) {
    return LargeScaleRequest(
      projectType: projectType ?? this.projectType,
      scale: scale ?? this.scale,
      areaAcres: areaAcres ?? this.areaAcres,
      budgetRange: budgetRange ?? this.budgetRange,
      locationType: locationType ?? this.locationType,
      specialRequirements: specialRequirements is String?
          ? specialRequirements
          : this.specialRequirements,
      sustainabilityLevel: sustainabilityLevel is String?
          ? sustainabilityLevel
          : this.sustainabilityLevel,
      targetCapacity: targetCapacity is int?
          ? targetCapacity
          : this.targetCapacity,
    );
  }
}

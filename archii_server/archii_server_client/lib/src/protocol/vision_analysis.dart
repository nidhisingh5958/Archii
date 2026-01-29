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

/// Protocol file for Vision Analysis
/// Result from analyzing room images
abstract class VisionAnalysis implements _i1.SerializableModel {
  VisionAnalysis._({
    required this.roomType,
    required this.wallColors,
    required this.windows,
    required this.doors,
    required this.existingFurniture,
    required this.lightingCondition,
    required this.freeSpaceWalls,
    required this.structuralLimitations,
  });

  factory VisionAnalysis({
    required String roomType,
    required String wallColors,
    required String windows,
    required String doors,
    required List<String> existingFurniture,
    required String lightingCondition,
    required String freeSpaceWalls,
    required String structuralLimitations,
  }) = _VisionAnalysisImpl;

  factory VisionAnalysis.fromJson(Map<String, dynamic> jsonSerialization) {
    return VisionAnalysis(
      roomType: jsonSerialization['roomType'] as String,
      wallColors: jsonSerialization['wallColors'] as String,
      windows: jsonSerialization['windows'] as String,
      doors: jsonSerialization['doors'] as String,
      existingFurniture: _i2.Protocol().deserialize<List<String>>(
        jsonSerialization['existingFurniture'],
      ),
      lightingCondition: jsonSerialization['lightingCondition'] as String,
      freeSpaceWalls: jsonSerialization['freeSpaceWalls'] as String,
      structuralLimitations:
          jsonSerialization['structuralLimitations'] as String,
    );
  }

  String roomType;

  String wallColors;

  String windows;

  String doors;

  List<String> existingFurniture;

  String lightingCondition;

  String freeSpaceWalls;

  String structuralLimitations;

  /// Returns a shallow copy of this [VisionAnalysis]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  VisionAnalysis copyWith({
    String? roomType,
    String? wallColors,
    String? windows,
    String? doors,
    List<String>? existingFurniture,
    String? lightingCondition,
    String? freeSpaceWalls,
    String? structuralLimitations,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'VisionAnalysis',
      'roomType': roomType,
      'wallColors': wallColors,
      'windows': windows,
      'doors': doors,
      'existingFurniture': existingFurniture.toJson(),
      'lightingCondition': lightingCondition,
      'freeSpaceWalls': freeSpaceWalls,
      'structuralLimitations': structuralLimitations,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _VisionAnalysisImpl extends VisionAnalysis {
  _VisionAnalysisImpl({
    required String roomType,
    required String wallColors,
    required String windows,
    required String doors,
    required List<String> existingFurniture,
    required String lightingCondition,
    required String freeSpaceWalls,
    required String structuralLimitations,
  }) : super._(
         roomType: roomType,
         wallColors: wallColors,
         windows: windows,
         doors: doors,
         existingFurniture: existingFurniture,
         lightingCondition: lightingCondition,
         freeSpaceWalls: freeSpaceWalls,
         structuralLimitations: structuralLimitations,
       );

  /// Returns a shallow copy of this [VisionAnalysis]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  VisionAnalysis copyWith({
    String? roomType,
    String? wallColors,
    String? windows,
    String? doors,
    List<String>? existingFurniture,
    String? lightingCondition,
    String? freeSpaceWalls,
    String? structuralLimitations,
  }) {
    return VisionAnalysis(
      roomType: roomType ?? this.roomType,
      wallColors: wallColors ?? this.wallColors,
      windows: windows ?? this.windows,
      doors: doors ?? this.doors,
      existingFurniture:
          existingFurniture ?? this.existingFurniture.map((e0) => e0).toList(),
      lightingCondition: lightingCondition ?? this.lightingCondition,
      freeSpaceWalls: freeSpaceWalls ?? this.freeSpaceWalls,
      structuralLimitations:
          structuralLimitations ?? this.structuralLimitations,
    );
  }
}

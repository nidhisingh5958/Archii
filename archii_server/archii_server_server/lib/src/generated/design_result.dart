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
import 'furniture_item.dart' as _i2;
import 'package:archii_server_server/src/generated/protocol.dart' as _i3;

/// Protocol file for Design Result
/// Response from AI design generation
abstract class DesignResult
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  DesignResult._({
    required this.roomLayoutStrategy,
    required this.furniturePlacement,
    required this.lightingDesign,
    required this.colorPalette,
    required this.materialsSuggestions,
    required this.spaceOptimization,
    required this.budgetBreakdown,
    required this.reasoning,
    this.generatedImageUrl,
  });

  factory DesignResult({
    required String roomLayoutStrategy,
    required List<_i2.FurnitureItem> furniturePlacement,
    required String lightingDesign,
    required List<String> colorPalette,
    required List<String> materialsSuggestions,
    required String spaceOptimization,
    required Map<String, String> budgetBreakdown,
    required String reasoning,
    String? generatedImageUrl,
  }) = _DesignResultImpl;

  factory DesignResult.fromJson(Map<String, dynamic> jsonSerialization) {
    return DesignResult(
      roomLayoutStrategy: jsonSerialization['roomLayoutStrategy'] as String,
      furniturePlacement: _i3.Protocol().deserialize<List<_i2.FurnitureItem>>(
        jsonSerialization['furniturePlacement'],
      ),
      lightingDesign: jsonSerialization['lightingDesign'] as String,
      colorPalette: _i3.Protocol().deserialize<List<String>>(
        jsonSerialization['colorPalette'],
      ),
      materialsSuggestions: _i3.Protocol().deserialize<List<String>>(
        jsonSerialization['materialsSuggestions'],
      ),
      spaceOptimization: jsonSerialization['spaceOptimization'] as String,
      budgetBreakdown: _i3.Protocol().deserialize<Map<String, String>>(
        jsonSerialization['budgetBreakdown'],
      ),
      reasoning: jsonSerialization['reasoning'] as String,
      generatedImageUrl: jsonSerialization['generatedImageUrl'] as String?,
    );
  }

  String roomLayoutStrategy;

  List<_i2.FurnitureItem> furniturePlacement;

  String lightingDesign;

  List<String> colorPalette;

  List<String> materialsSuggestions;

  String spaceOptimization;

  Map<String, String> budgetBreakdown;

  String reasoning;

  String? generatedImageUrl;

  /// Returns a shallow copy of this [DesignResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DesignResult copyWith({
    String? roomLayoutStrategy,
    List<_i2.FurnitureItem>? furniturePlacement,
    String? lightingDesign,
    List<String>? colorPalette,
    List<String>? materialsSuggestions,
    String? spaceOptimization,
    Map<String, String>? budgetBreakdown,
    String? reasoning,
    String? generatedImageUrl,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'DesignResult',
      'roomLayoutStrategy': roomLayoutStrategy,
      'furniturePlacement': furniturePlacement.toJson(
        valueToJson: (v) => v.toJson(),
      ),
      'lightingDesign': lightingDesign,
      'colorPalette': colorPalette.toJson(),
      'materialsSuggestions': materialsSuggestions.toJson(),
      'spaceOptimization': spaceOptimization,
      'budgetBreakdown': budgetBreakdown.toJson(),
      'reasoning': reasoning,
      if (generatedImageUrl != null) 'generatedImageUrl': generatedImageUrl,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'DesignResult',
      'roomLayoutStrategy': roomLayoutStrategy,
      'furniturePlacement': furniturePlacement.toJson(
        valueToJson: (v) => v.toJsonForProtocol(),
      ),
      'lightingDesign': lightingDesign,
      'colorPalette': colorPalette.toJson(),
      'materialsSuggestions': materialsSuggestions.toJson(),
      'spaceOptimization': spaceOptimization,
      'budgetBreakdown': budgetBreakdown.toJson(),
      'reasoning': reasoning,
      if (generatedImageUrl != null) 'generatedImageUrl': generatedImageUrl,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DesignResultImpl extends DesignResult {
  _DesignResultImpl({
    required String roomLayoutStrategy,
    required List<_i2.FurnitureItem> furniturePlacement,
    required String lightingDesign,
    required List<String> colorPalette,
    required List<String> materialsSuggestions,
    required String spaceOptimization,
    required Map<String, String> budgetBreakdown,
    required String reasoning,
    String? generatedImageUrl,
  }) : super._(
         roomLayoutStrategy: roomLayoutStrategy,
         furniturePlacement: furniturePlacement,
         lightingDesign: lightingDesign,
         colorPalette: colorPalette,
         materialsSuggestions: materialsSuggestions,
         spaceOptimization: spaceOptimization,
         budgetBreakdown: budgetBreakdown,
         reasoning: reasoning,
         generatedImageUrl: generatedImageUrl,
       );

  /// Returns a shallow copy of this [DesignResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DesignResult copyWith({
    String? roomLayoutStrategy,
    List<_i2.FurnitureItem>? furniturePlacement,
    String? lightingDesign,
    List<String>? colorPalette,
    List<String>? materialsSuggestions,
    String? spaceOptimization,
    Map<String, String>? budgetBreakdown,
    String? reasoning,
    Object? generatedImageUrl = _Undefined,
  }) {
    return DesignResult(
      roomLayoutStrategy: roomLayoutStrategy ?? this.roomLayoutStrategy,
      furniturePlacement:
          furniturePlacement ??
          this.furniturePlacement.map((e0) => e0.copyWith()).toList(),
      lightingDesign: lightingDesign ?? this.lightingDesign,
      colorPalette: colorPalette ?? this.colorPalette.map((e0) => e0).toList(),
      materialsSuggestions:
          materialsSuggestions ??
          this.materialsSuggestions.map((e0) => e0).toList(),
      spaceOptimization: spaceOptimization ?? this.spaceOptimization,
      budgetBreakdown:
          budgetBreakdown ??
          this.budgetBreakdown.map(
            (
              key0,
              value0,
            ) => MapEntry(
              key0,
              value0,
            ),
          ),
      reasoning: reasoning ?? this.reasoning,
      generatedImageUrl: generatedImageUrl is String?
          ? generatedImageUrl
          : this.generatedImageUrl,
    );
  }
}

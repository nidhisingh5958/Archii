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

/// Enum for Large Scale Project Types
enum ProjectType implements _i1.SerializableModel {
  residentialRoom,
  residentialBuilding,
  township,
  university,
  hospital,
  hotel,
  resort,
  governmentBuilding,
  farmhouse,
  commercialComplex,
  industrialComplex,
  sector,
  society;

  static ProjectType fromJson(String name) {
    switch (name) {
      case 'residentialRoom':
        return ProjectType.residentialRoom;
      case 'residentialBuilding':
        return ProjectType.residentialBuilding;
      case 'township':
        return ProjectType.township;
      case 'university':
        return ProjectType.university;
      case 'hospital':
        return ProjectType.hospital;
      case 'hotel':
        return ProjectType.hotel;
      case 'resort':
        return ProjectType.resort;
      case 'governmentBuilding':
        return ProjectType.governmentBuilding;
      case 'farmhouse':
        return ProjectType.farmhouse;
      case 'commercialComplex':
        return ProjectType.commercialComplex;
      case 'industrialComplex':
        return ProjectType.industrialComplex;
      case 'sector':
        return ProjectType.sector;
      case 'society':
        return ProjectType.society;
      default:
        throw ArgumentError(
          'Value "$name" cannot be converted to "ProjectType"',
        );
    }
  }

  @override
  String toJson() => name;

  @override
  String toString() => name;
}

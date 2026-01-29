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
import 'budget_level.dart' as _i2;
import 'chat_message.dart' as _i3;
import 'design_request.dart' as _i4;
import 'design_result.dart' as _i5;
import 'furniture_item.dart' as _i6;
import 'greetings/greeting.dart' as _i7;
import 'large_scale_request.dart' as _i8;
import 'project.dart' as _i9;
import 'project_scale.dart' as _i10;
import 'project_status.dart' as _i11;
import 'project_type.dart' as _i12;
import 'room_type.dart' as _i13;
import 'style_type.dart' as _i14;
import 'vision_analysis.dart' as _i15;
import 'package:archii_server_client/src/protocol/chat_message.dart' as _i16;
import 'package:archii_server_client/src/protocol/project.dart' as _i17;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i18;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i19;
export 'budget_level.dart';
export 'chat_message.dart';
export 'design_request.dart';
export 'design_result.dart';
export 'furniture_item.dart';
export 'greetings/greeting.dart';
export 'large_scale_request.dart';
export 'project.dart';
export 'project_scale.dart';
export 'project_status.dart';
export 'project_type.dart';
export 'room_type.dart';
export 'style_type.dart';
export 'vision_analysis.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on FormatException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _i2.BudgetLevel) {
      return _i2.BudgetLevel.fromJson(data) as T;
    }
    if (t == _i3.ChatMessage) {
      return _i3.ChatMessage.fromJson(data) as T;
    }
    if (t == _i4.DesignRequest) {
      return _i4.DesignRequest.fromJson(data) as T;
    }
    if (t == _i5.DesignResult) {
      return _i5.DesignResult.fromJson(data) as T;
    }
    if (t == _i6.FurnitureItem) {
      return _i6.FurnitureItem.fromJson(data) as T;
    }
    if (t == _i7.Greeting) {
      return _i7.Greeting.fromJson(data) as T;
    }
    if (t == _i8.LargeScaleRequest) {
      return _i8.LargeScaleRequest.fromJson(data) as T;
    }
    if (t == _i9.Project) {
      return _i9.Project.fromJson(data) as T;
    }
    if (t == _i10.ProjectScale) {
      return _i10.ProjectScale.fromJson(data) as T;
    }
    if (t == _i11.ProjectStatus) {
      return _i11.ProjectStatus.fromJson(data) as T;
    }
    if (t == _i12.ProjectType) {
      return _i12.ProjectType.fromJson(data) as T;
    }
    if (t == _i13.RoomType) {
      return _i13.RoomType.fromJson(data) as T;
    }
    if (t == _i14.StyleType) {
      return _i14.StyleType.fromJson(data) as T;
    }
    if (t == _i15.VisionAnalysis) {
      return _i15.VisionAnalysis.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.BudgetLevel?>()) {
      return (data != null ? _i2.BudgetLevel.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.ChatMessage?>()) {
      return (data != null ? _i3.ChatMessage.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.DesignRequest?>()) {
      return (data != null ? _i4.DesignRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.DesignResult?>()) {
      return (data != null ? _i5.DesignResult.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.FurnitureItem?>()) {
      return (data != null ? _i6.FurnitureItem.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Greeting?>()) {
      return (data != null ? _i7.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.LargeScaleRequest?>()) {
      return (data != null ? _i8.LargeScaleRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.Project?>()) {
      return (data != null ? _i9.Project.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.ProjectScale?>()) {
      return (data != null ? _i10.ProjectScale.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.ProjectStatus?>()) {
      return (data != null ? _i11.ProjectStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.ProjectType?>()) {
      return (data != null ? _i12.ProjectType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.RoomType?>()) {
      return (data != null ? _i13.RoomType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.StyleType?>()) {
      return (data != null ? _i14.StyleType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.VisionAnalysis?>()) {
      return (data != null ? _i15.VisionAnalysis.fromJson(data) : null) as T;
    }
    if (t == Map<String, String>) {
      return (data as Map).map(
            (k, v) => MapEntry(deserialize<String>(k), deserialize<String>(v)),
          )
          as T;
    }
    if (t == _i1.getType<Map<String, String>?>()) {
      return (data != null
              ? (data as Map).map(
                  (k, v) =>
                      MapEntry(deserialize<String>(k), deserialize<String>(v)),
                )
              : null)
          as T;
    }
    if (t == List<_i6.FurnitureItem>) {
      return (data as List)
              .map((e) => deserialize<_i6.FurnitureItem>(e))
              .toList()
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i16.ChatMessage>) {
      return (data as List)
              .map((e) => deserialize<_i16.ChatMessage>(e))
              .toList()
          as T;
    }
    if (t == Map<String, dynamic>) {
      return (data as Map).map(
            (k, v) => MapEntry(deserialize<String>(k), deserialize<dynamic>(v)),
          )
          as T;
    }
    if (t == List<_i17.Project>) {
      return (data as List).map((e) => deserialize<_i17.Project>(e)).toList()
          as T;
    }
    try {
      return _i18.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i19.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.BudgetLevel => 'BudgetLevel',
      _i3.ChatMessage => 'ChatMessage',
      _i4.DesignRequest => 'DesignRequest',
      _i5.DesignResult => 'DesignResult',
      _i6.FurnitureItem => 'FurnitureItem',
      _i7.Greeting => 'Greeting',
      _i8.LargeScaleRequest => 'LargeScaleRequest',
      _i9.Project => 'Project',
      _i10.ProjectScale => 'ProjectScale',
      _i11.ProjectStatus => 'ProjectStatus',
      _i12.ProjectType => 'ProjectType',
      _i13.RoomType => 'RoomType',
      _i14.StyleType => 'StyleType',
      _i15.VisionAnalysis => 'VisionAnalysis',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst(
        'archii_server.',
        '',
      );
    }

    switch (data) {
      case _i2.BudgetLevel():
        return 'BudgetLevel';
      case _i3.ChatMessage():
        return 'ChatMessage';
      case _i4.DesignRequest():
        return 'DesignRequest';
      case _i5.DesignResult():
        return 'DesignResult';
      case _i6.FurnitureItem():
        return 'FurnitureItem';
      case _i7.Greeting():
        return 'Greeting';
      case _i8.LargeScaleRequest():
        return 'LargeScaleRequest';
      case _i9.Project():
        return 'Project';
      case _i10.ProjectScale():
        return 'ProjectScale';
      case _i11.ProjectStatus():
        return 'ProjectStatus';
      case _i12.ProjectType():
        return 'ProjectType';
      case _i13.RoomType():
        return 'RoomType';
      case _i14.StyleType():
        return 'StyleType';
      case _i15.VisionAnalysis():
        return 'VisionAnalysis';
    }
    className = _i18.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i19.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_core.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'BudgetLevel') {
      return deserialize<_i2.BudgetLevel>(data['data']);
    }
    if (dataClassName == 'ChatMessage') {
      return deserialize<_i3.ChatMessage>(data['data']);
    }
    if (dataClassName == 'DesignRequest') {
      return deserialize<_i4.DesignRequest>(data['data']);
    }
    if (dataClassName == 'DesignResult') {
      return deserialize<_i5.DesignResult>(data['data']);
    }
    if (dataClassName == 'FurnitureItem') {
      return deserialize<_i6.FurnitureItem>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i7.Greeting>(data['data']);
    }
    if (dataClassName == 'LargeScaleRequest') {
      return deserialize<_i8.LargeScaleRequest>(data['data']);
    }
    if (dataClassName == 'Project') {
      return deserialize<_i9.Project>(data['data']);
    }
    if (dataClassName == 'ProjectScale') {
      return deserialize<_i10.ProjectScale>(data['data']);
    }
    if (dataClassName == 'ProjectStatus') {
      return deserialize<_i11.ProjectStatus>(data['data']);
    }
    if (dataClassName == 'ProjectType') {
      return deserialize<_i12.ProjectType>(data['data']);
    }
    if (dataClassName == 'RoomType') {
      return deserialize<_i13.RoomType>(data['data']);
    }
    if (dataClassName == 'StyleType') {
      return deserialize<_i14.StyleType>(data['data']);
    }
    if (dataClassName == 'VisionAnalysis') {
      return deserialize<_i15.VisionAnalysis>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i18.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i19.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _i18.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i19.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}

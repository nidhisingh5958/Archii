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
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _i3;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i4;
import 'budget_level.dart' as _i5;
import 'chat_message.dart' as _i6;
import 'design_request.dart' as _i7;
import 'design_result.dart' as _i8;
import 'furniture_item.dart' as _i9;
import 'greetings/greeting.dart' as _i10;
import 'large_scale_request.dart' as _i11;
import 'project.dart' as _i12;
import 'project_scale.dart' as _i13;
import 'project_status.dart' as _i14;
import 'project_type.dart' as _i15;
import 'room_type.dart' as _i16;
import 'style_type.dart' as _i17;
import 'vision_analysis.dart' as _i18;
import 'package:archii_server_server/src/generated/chat_message.dart' as _i19;
import 'package:archii_server_server/src/generated/project.dart' as _i20;
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

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'chat_messages',
      dartName: 'ChatMessage',
      schema: 'public',
      module: 'archii_server',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'chat_messages_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'projectId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'content',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'isFromUser',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'timestamp',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'metadata',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'Map<String,String>?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'chat_messages_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'chat_project_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'projectId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'chat_user_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'projects',
      dartName: 'Project',
      schema: 'public',
      module: 'archii_server',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'projects_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'roomType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'style',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'imagePath',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'estimatedCost',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:ProjectStatus',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'projects_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'project_user_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    ..._i3.Protocol.targetTableDefinitions,
    ..._i4.Protocol.targetTableDefinitions,
    ..._i2.Protocol.targetTableDefinitions,
  ];

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

    if (t == _i5.BudgetLevel) {
      return _i5.BudgetLevel.fromJson(data) as T;
    }
    if (t == _i6.ChatMessage) {
      return _i6.ChatMessage.fromJson(data) as T;
    }
    if (t == _i7.DesignRequest) {
      return _i7.DesignRequest.fromJson(data) as T;
    }
    if (t == _i8.DesignResult) {
      return _i8.DesignResult.fromJson(data) as T;
    }
    if (t == _i9.FurnitureItem) {
      return _i9.FurnitureItem.fromJson(data) as T;
    }
    if (t == _i10.Greeting) {
      return _i10.Greeting.fromJson(data) as T;
    }
    if (t == _i11.LargeScaleRequest) {
      return _i11.LargeScaleRequest.fromJson(data) as T;
    }
    if (t == _i12.Project) {
      return _i12.Project.fromJson(data) as T;
    }
    if (t == _i13.ProjectScale) {
      return _i13.ProjectScale.fromJson(data) as T;
    }
    if (t == _i14.ProjectStatus) {
      return _i14.ProjectStatus.fromJson(data) as T;
    }
    if (t == _i15.ProjectType) {
      return _i15.ProjectType.fromJson(data) as T;
    }
    if (t == _i16.RoomType) {
      return _i16.RoomType.fromJson(data) as T;
    }
    if (t == _i17.StyleType) {
      return _i17.StyleType.fromJson(data) as T;
    }
    if (t == _i18.VisionAnalysis) {
      return _i18.VisionAnalysis.fromJson(data) as T;
    }
    if (t == _i1.getType<_i5.BudgetLevel?>()) {
      return (data != null ? _i5.BudgetLevel.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.ChatMessage?>()) {
      return (data != null ? _i6.ChatMessage.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.DesignRequest?>()) {
      return (data != null ? _i7.DesignRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.DesignResult?>()) {
      return (data != null ? _i8.DesignResult.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.FurnitureItem?>()) {
      return (data != null ? _i9.FurnitureItem.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.Greeting?>()) {
      return (data != null ? _i10.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.LargeScaleRequest?>()) {
      return (data != null ? _i11.LargeScaleRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.Project?>()) {
      return (data != null ? _i12.Project.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.ProjectScale?>()) {
      return (data != null ? _i13.ProjectScale.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.ProjectStatus?>()) {
      return (data != null ? _i14.ProjectStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.ProjectType?>()) {
      return (data != null ? _i15.ProjectType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.RoomType?>()) {
      return (data != null ? _i16.RoomType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.StyleType?>()) {
      return (data != null ? _i17.StyleType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.VisionAnalysis?>()) {
      return (data != null ? _i18.VisionAnalysis.fromJson(data) : null) as T;
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
    if (t == List<_i9.FurnitureItem>) {
      return (data as List)
              .map((e) => deserialize<_i9.FurnitureItem>(e))
              .toList()
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i19.ChatMessage>) {
      return (data as List)
              .map((e) => deserialize<_i19.ChatMessage>(e))
              .toList()
          as T;
    }
    if (t == Map<String, dynamic>) {
      return (data as Map).map(
            (k, v) => MapEntry(deserialize<String>(k), deserialize<dynamic>(v)),
          )
          as T;
    }
    if (t == List<_i20.Project>) {
      return (data as List).map((e) => deserialize<_i20.Project>(e)).toList()
          as T;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i4.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i5.BudgetLevel => 'BudgetLevel',
      _i6.ChatMessage => 'ChatMessage',
      _i7.DesignRequest => 'DesignRequest',
      _i8.DesignResult => 'DesignResult',
      _i9.FurnitureItem => 'FurnitureItem',
      _i10.Greeting => 'Greeting',
      _i11.LargeScaleRequest => 'LargeScaleRequest',
      _i12.Project => 'Project',
      _i13.ProjectScale => 'ProjectScale',
      _i14.ProjectStatus => 'ProjectStatus',
      _i15.ProjectType => 'ProjectType',
      _i16.RoomType => 'RoomType',
      _i17.StyleType => 'StyleType',
      _i18.VisionAnalysis => 'VisionAnalysis',
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
      case _i5.BudgetLevel():
        return 'BudgetLevel';
      case _i6.ChatMessage():
        return 'ChatMessage';
      case _i7.DesignRequest():
        return 'DesignRequest';
      case _i8.DesignResult():
        return 'DesignResult';
      case _i9.FurnitureItem():
        return 'FurnitureItem';
      case _i10.Greeting():
        return 'Greeting';
      case _i11.LargeScaleRequest():
        return 'LargeScaleRequest';
      case _i12.Project():
        return 'Project';
      case _i13.ProjectScale():
        return 'ProjectScale';
      case _i14.ProjectStatus():
        return 'ProjectStatus';
      case _i15.ProjectType():
        return 'ProjectType';
      case _i16.RoomType():
        return 'RoomType';
      case _i17.StyleType():
        return 'StyleType';
      case _i18.VisionAnalysis():
        return 'VisionAnalysis';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i4.Protocol().getClassNameForObject(data);
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
      return deserialize<_i5.BudgetLevel>(data['data']);
    }
    if (dataClassName == 'ChatMessage') {
      return deserialize<_i6.ChatMessage>(data['data']);
    }
    if (dataClassName == 'DesignRequest') {
      return deserialize<_i7.DesignRequest>(data['data']);
    }
    if (dataClassName == 'DesignResult') {
      return deserialize<_i8.DesignResult>(data['data']);
    }
    if (dataClassName == 'FurnitureItem') {
      return deserialize<_i9.FurnitureItem>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i10.Greeting>(data['data']);
    }
    if (dataClassName == 'LargeScaleRequest') {
      return deserialize<_i11.LargeScaleRequest>(data['data']);
    }
    if (dataClassName == 'Project') {
      return deserialize<_i12.Project>(data['data']);
    }
    if (dataClassName == 'ProjectScale') {
      return deserialize<_i13.ProjectScale>(data['data']);
    }
    if (dataClassName == 'ProjectStatus') {
      return deserialize<_i14.ProjectStatus>(data['data']);
    }
    if (dataClassName == 'ProjectType') {
      return deserialize<_i15.ProjectType>(data['data']);
    }
    if (dataClassName == 'RoomType') {
      return deserialize<_i16.RoomType>(data['data']);
    }
    if (dataClassName == 'StyleType') {
      return deserialize<_i17.StyleType>(data['data']);
    }
    if (dataClassName == 'VisionAnalysis') {
      return deserialize<_i18.VisionAnalysis>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i3.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i4.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i4.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i6.ChatMessage:
        return _i6.ChatMessage.t;
      case _i12.Project:
        return _i12.Project.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'archii_server';

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
      return _i3.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i4.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}

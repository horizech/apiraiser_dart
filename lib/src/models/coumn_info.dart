import 'package:apiraiser/src/enums/column_data_type.dart';

/// Column information model
class ColumnInfo {
  final String name;
  final ColumnDataType datatype;
  final bool isRequired;
  final bool isUnique;
  final bool isForeignKey;
  final String? foreignTable;
  final String? foreignName;
  final dynamic defaultValue;

  /// Constructor
  const ColumnInfo({
    required this.name,
    required this.datatype,
    this.isRequired = false,
    this.isUnique = false,
    this.isForeignKey = false,
    this.foreignTable,
    this.foreignName,
    this.defaultValue,
  });

  /// Get model from Json
  factory ColumnInfo.fromJson(Map<String, dynamic> json) {
    ColumnInfo info = ColumnInfo(
        name: json['Name'] as String,
        datatype: json['Datatype'] as ColumnDataType,
        isRequired: json['IsRequired'] as bool,
        isUnique: json['IsUnique'] as bool,
        isForeignKey: json['IsForeignKey'] as bool,
        foreignTable: json['ForeignTable'] as String?,
        foreignName: json['ForeignName'] as String?,
        defaultValue: json['DefaultValue'] as dynamic);
    return info;
  }

  /// Get Json from model
  Map<String, dynamic> toJson(ColumnInfo instance) => <String, dynamic>{
        'Name': instance.name,
        'Datatype': instance.datatype,
        'IsRequired': instance.isRequired,
        'IsUnique': instance.isUnique,
        'IsForeignKey': instance.isForeignKey,
        'ForeignTable': instance.foreignTable,
        'ForeignName': instance.foreignName,
        'DefaultValue': instance.defaultValue,
      };
}

import '../enums/attribute_data_type.dart';

/// Attribute information model
class AttributeInfo {
  final String name;
  final AttributeDataType datatype;
  final bool isRequired;
  final bool isUnique;
  final bool isForeignKey;
  final String? foreignCollection;
  final String? foreignName;
  final String? defaultValue;

  AttributeInfo({
    required this.name,
    required this.datatype,
    required this.isRequired,
    required this.isUnique,
    required this.isForeignKey,
    this.foreignCollection,
    this.foreignName,
    this.defaultValue,
  });
}

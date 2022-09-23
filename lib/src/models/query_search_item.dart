import 'dart:convert';

import 'package:apiraiser/src/enums/column_condition.dart';

/// Model used for conditions
class QuerySearchItem {
  String name;
  dynamic value;
  ColumnCondition condition;
  bool caseSensitive;

  /// Constructor
  QuerySearchItem({
    required this.name,
    this.value,
    this.condition = ColumnCondition.equal,
    this.caseSensitive = false,
  });

  /// Get model from Json
  factory QuerySearchItem.fromJson(Map<String, dynamic> json) {
    QuerySearchItem info = QuerySearchItem(
        name: json['Name'] as String,
        value: json['Value'],
        condition: json['Condition'] as ColumnCondition,
        caseSensitive: json['CaseSensitive'] as bool);
    return info;
  }

  /// Get model from Json
  static String toJsonList(List<QuerySearchItem> items) {
    // new list of json strings to pass into data map
    List<String> jsonList = [];

    for (final item in items) {
      String jsonItem = json.encode(item.toJson(item));
      jsonList.add(jsonItem);
    }
    //data['itemStockEntries'] = {'data': jsonList};

    return json.encode(jsonList);
  }

  /// Get Json from model
  Map<String, dynamic> toJson(QuerySearchItem instance) => <String, dynamic>{
        'Name': instance.name,
        'Value': instance.value,
        'Condition': instance.condition.index,
        'CaseSensitive': instance.caseSensitive
      };
}

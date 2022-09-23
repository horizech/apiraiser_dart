import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:apiraiser/src/helpers/state.dart';
import 'package:apiraiser/src/helpers/headers.dart';
import 'package:apiraiser/src/models/column_info.dart';
import 'package:apiraiser/src/models/api_result.dart';

/// Table APIs
class Table {
  /// Create a new table
  Future<APIResult> create(
    String table,
    String tableType,
    List<ColumnInfo> columns,
  ) async {
    var res = await http.post(
      Uri.parse(
          '${State.endPoint}/API/CreateTable?table=$table&tableType=$tableType'),
      headers: Headers.getHeaders(),
      body: jsonEncode(columns),
    );
    return APIResult.fromJson(json.decode(res.body));
  }

  /// Get all tables
  Future<APIResult> getList() async {
    var res = await http.get(Uri.parse('${State.endPoint}/API/GetTablesList'),
        headers: Headers.getHeaders());
    return APIResult.fromJson(json.decode(res.body));
  }
}

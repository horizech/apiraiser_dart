import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:apiraiser/src/helpers/state.dart';
import 'package:apiraiser/src/helpers/headers.dart';
import 'package:apiraiser/src/models/column_info.dart';
import 'package:apiraiser/src/models/api_result.dart';

/// Column APIs
class Column {
  /// Get predefined columns
  Future<APIResult> getPredefinedColumns() async {
    var res = await http.get(
        Uri.parse('${State.endPoint}/API/GetPredefinedColumns'),
        headers: Headers.getHeaders());
    return APIResult.fromJson(json.decode(res.body));
  }

  /// Get columns
  Future<APIResult> get(String table) async {
    var res = await http.get(Uri.parse('${State.endPoint}/API/$table/Columns'),
        headers: Headers.getHeaders());
    return APIResult.fromJson(json.decode(res.body));
  }

  /// Add a new column
  Future<APIResult> insert(String table, ColumnInfo columnInfo) async {
    Map<String, dynamic> data = columnInfo.toJson(columnInfo);
    try {
      var res = await http.post(
        Uri.parse('${State.endPoint}/API/$table/Column'),
        headers: Headers.getHeaders(),
        body: jsonEncode(data),
      );
      return APIResult.fromJson(json.decode(res.body));
    } catch (e) {
      rethrow;
    }
  }

  /// Remove column
  Future<APIResult> delete(String table, String column) async {
    try {
      var res = await http.delete(
        Uri.parse('${State.endPoint}/API/$table/Column/$column'),
        headers: Headers.getHeaders(),
      );
      return APIResult.fromJson(json.decode(res.body));
    } catch (e) {
      rethrow;
    }
  }
}

import 'dart:convert';
import 'dart:typed_data';
import 'package:apiraiser/apiraiser.dart';
import 'package:http/http.dart' as http;

import 'package:apiraiser/src/helpers/state.dart';
import 'package:apiraiser/src/helpers/headers.dart';

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

  /// Download table Definition File
  Future<Uint8List> downloadDefinitionFile(String table) async {
    var res = await http.get(
      Uri.parse('${State.endPoint}/API/DownloadTableDefinitionFile/$table'),
      headers: Headers.getHeaders(),
    );
    return res.bodyBytes;
  }

  /// Delete a table
  Future<APIResult> delete(
    String table,
  ) async {
    var res = await http.delete(
      Uri.parse('${State.endPoint}/API/DeleteTable?table=$table'),
      headers: Headers.getHeaders(),
    );
    return APIResult.fromJson(json.decode(res.body));
  }
}

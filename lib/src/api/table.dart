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
      String table, String tags, List<ColumnInfo> columns) async {
    try {
      List<Map<String, dynamic>> data =
          columns.map((e) => e.toJson(e)).toList();
      var res = await http.post(
        Uri.parse('${State.endPoint}/API/CreateTable?table=$table&tags=$tags'),
        headers: Headers.getHeaders(),
        body: jsonEncode(data),
      );
      return APIResult.fromJson(json.decode(res.body));
    } catch (e) {
      rethrow;
    }
  }

  /// Create a new table using Definition File
  ///
  /// /// Create a new table
  Future<APIResult> createUsingDefinitionFile(
      CreateTableUsingDefinitionFileRequest request) async {
    try {
      var res = await http.post(
        Uri.parse('${State.endPoint}/API/CreateTableUsingDefinitionFile'),
        headers: Headers.getHeaders(),
        body: jsonEncode(request),
      );
      return APIResult.fromJson(json.decode(res.body));
    } catch (e) {
      rethrow;
    }
  }

  /// Get all tables
  Future<APIResult> getList() async {
    try {
      var res = await http.get(Uri.parse('${State.endPoint}/API/GetTablesList'),
          headers: Headers.getHeaders());
      return APIResult.fromJson(json.decode(res.body));
    } catch (e) {
      rethrow;
    }
  }

  /// Download table Definition File
  Future<Uint8List> downloadDefinitionFile(String table) async {
    try {
      var res = await http.get(
        Uri.parse('${State.endPoint}/API/DownloadTableDefinitionFile/$table'),
        headers: Headers.getHeaders(),
      );
      return res.bodyBytes;
    } catch (e) {
      rethrow;
    }
  }

  /// Delete a table
  Future<APIResult> delete(String table) async {
    try {
      var res = await http.delete(
        Uri.parse('${State.endPoint}/API/DeleteTable?table=$table'),
        headers: Headers.getHeaders(),
      );
      return APIResult.fromJson(json.decode(res.body));
    } catch (e) {
      rethrow;
    }
  }
}

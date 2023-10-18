import 'dart:convert';
import 'dart:typed_data';
import 'package:apiraiser/apiraiser.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import 'package:apiraiser/src/helpers/state.dart';
import 'package:apiraiser/src/helpers/headers.dart' as helper;

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
        headers: helper.Headers.getHeaders(),
        body: jsonEncode(data),
      );
      return APIResult.fromJson(json.decode(res.body));
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Create a new table using Definition File
  ///
  /// /// Create a new table
  Future<APIResult> createUsingDefinitionFile(
      CreateTableUsingDefinitionFileRequest request) async {
    try {
      final dio = Dio();
      dio.options.headers['content-Type'] = 'application/json';
      if (State.jwt?.isNotEmpty ?? false) {
        dio.options.headers["authorization"] = "Bearer ${State.jwt}";
      }

      // single file
      FormData formData = FormData.fromMap({
        "FormFile": MultipartFile.fromBytes(
          request.file,
          filename: "file",
        ),
        "Tags": request.tags
      });
      var response = await dio.post(
          '${State.endPoint}/API/CreateTableUsingDefinitionFile',
          data: formData);
      return APIResult.fromJson(response.data);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get all tables
  Future<APIResult> getList() async {
    try {
      var res = await http.get(Uri.parse('${State.endPoint}/API/GetTablesList'),
          headers: helper.Headers.getHeaders());
      return APIResult.fromJson(json.decode(res.body));
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Download table Definition File
  Future<Uint8List> downloadDefinitionFile(String table) async {
    try {
      var res = await http.get(
        Uri.parse('${State.endPoint}/API/DownloadTableDefinitionFile/$table'),
        headers: helper.Headers.getHeaders(),
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
        headers: helper.Headers.getHeaders(),
      );
      return APIResult.fromJson(json.decode(res.body));
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }
}

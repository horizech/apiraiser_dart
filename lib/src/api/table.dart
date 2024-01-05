import 'dart:convert';
import 'dart:typed_data';
import 'package:apiraiser/apiraiser.dart';
import 'package:apiraiser/constants.dart';
import 'package:apiraiser/src/api/rest.dart';
import 'package:apiraiser/src/models/rest_params.dart';
import 'package:dio/dio.dart';
import 'package:apiraiser/src/helpers/state.dart';

/// Table APIs
class Table {
  /// Create a new table
  Future<APIResult> create(
      String table, String tags, List<ColumnInfo> columns) async {
    try {
      List<Map<String, dynamic>> data =
          columns.map((e) => e.toJson(e)).toList();
      var res = await Rest.post(
        RestParams(
          '/API/${Constants.version}/CreateTable?table=$table&tags=$tags',
          data: jsonEncode(data),
        ),
      );
      return APIResult.fromJson(res);
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
        '/API/${Constants.version}/CreateTableUsingDefinitionFile',
        data: formData,
      );
      return APIResult.fromJson(response.data);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get all tables
  Future<APIResult> getList() async {
    try {
      var res = await Rest.get(
        RestParams('/API/${Constants.version}/GetTablesList'),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Download table Definition File
  Future<Uint8List> downloadDefinitionFile(String table) async {
    try {
      var res = await Rest.get(
        RestParams(
          '/API/${Constants.version}/DownloadTableDefinitionFile/$table',
          responseType: ResponseType.stream,
        ),
      );
      return res;
    } catch (e) {
      rethrow;
    }
  }

  /// Delete a table
  Future<APIResult> delete(String table) async {
    try {
      var res = await Rest.delete(
        RestParams('/API/${Constants.version}/DeleteTable?table=$table'),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }
}

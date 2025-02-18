import 'dart:typed_data';
import 'package:apiraiser/apiraiser.dart';
import 'package:apiraiser/constants.dart';
import 'package:apiraiser/src/helpers/rest.dart';
import 'package:apiraiser/src/helpers/state.dart';

import 'package:apiraiser/src/models/rest_params.dart';
import 'package:dio/dio.dart';

/// ImportExport APIs
class ImportExport {
  static const String apiraiser = Constants.apiraiser;
  static const String version = Constants.version;
  static const String app = Constants.app;

  /// Export Excel
  Future<Uint8List?> exportExcel(
      String collection, List<QuerySearchItem> conditions) async {
    try {
      var res = await Rest.post(
        RestParams(
            '/$apiraiser/$version/$app/ImportExport/ExportExcel/$collection',
            data: QuerySearchItem.toJsonList(conditions),
            responseType: ResponseType.stream),
      );
      return res;
    } catch (e) {
      rethrow;
    }
  }

  /// Import Excel
  Future<APIResult> importExcel(String table, Uint8List file) async {
    try {
      final dio = Dio();
      dio.options.headers['content-Type'] = 'application/json';
      if (State.accessToken?.isNotEmpty ?? false) {
        dio.options.headers["authorization"] = "Bearer ${State.accessToken}";
      }

      // single file
      FormData formData = FormData.fromMap({
        "file": MultipartFile.fromBytes(
          file,
          filename: "file",
        ),
      });
      var response = await dio.post(
          '/$apiraiser/$version/$app/ImportExport/ImportExcel/$table',
          data: formData);
      return APIResult.fromJson(response.data);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get Template
  Future<APIResult> getTemplate(String collection) async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/$app/ImportExport/GetTemplate/$collection',
          responseType: ResponseType.stream,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }
}

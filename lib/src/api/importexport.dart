import 'dart:typed_data';
import 'package:apiraiser/apiraiser.dart';
import 'package:apiraiser/constants.dart';
import 'package:apiraiser/src/helpers/rest.dart';
import 'package:apiraiser/src/helpers/state.dart';

import 'package:apiraiser/src/models/rest_params.dart';
import 'package:dio/dio.dart';

/// ImportExport APIs
class ImportExport {
  /// Export Excel
  Future<Uint8List?> exportExcel(
      String table, List<QuerySearchItem> conditions) async {
    try {
      var res = await Rest.post(
        RestParams('/API/${Constants.version}/ImportExport/ExportExcel/$table',
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
          '${State.endPoint}/API/${Constants.version}/ImportExport/ImportExcel/$table',
          data: formData);
      return APIResult.fromJson(response.data);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }
}

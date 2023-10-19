import 'dart:convert';
import 'dart:typed_data';
import 'package:apiraiser/src/helpers/headers.dart' as headers;
import 'package:apiraiser/src/models/sorage_upload_request.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:apiraiser/src/helpers/state.dart';
import 'package:apiraiser/src/models/api_result.dart';

/// Storage APIs
class Storage {
  /// upload Storage
  Future<APIResult?> upload(StorageUploadRequest request) async {
    try {
      final dio = Dio();
      dio.options.headers['content-Type'] = 'application/json';
      if (State.jwt?.isNotEmpty ?? false) {
        dio.options.headers["authorization"] = "Bearer ${State.jwt}";
      }
      FormData formData = FormData.fromMap({});

      // single file
      if (request.file != null && request.file!.isNotEmpty) {
        formData = FormData.fromMap({
          "FormFile": MultipartFile.fromBytes(
            request.file!,
            filename: request.fileName ?? "image",
          ),
          "FileName": request.fileName ?? "image",
          "Path": request.path,
          "StorageSource": request.storageSource
        });
      }
      var response =
          await dio.post('${State.endPoint}/API/v1/Storage', data: formData);
      return APIResult.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }

  Future<APIResult?> update(
      String storageId, StorageUploadRequest request) async {
    try {
      final dio = Dio();
      dio.options.headers['content-Type'] = 'application/json';
      if (State.jwt?.isNotEmpty ?? false) {
        dio.options.headers["authorization"] = "Bearer ${State.jwt}";
      }
      FormData formData = FormData.fromMap({});

      // single file
      if (request.file != null && request.file!.isNotEmpty) {
        formData = FormData.fromMap({
          "FormFile": MultipartFile.fromBytes(
            request.file!,
            filename: request.fileName,
          ),
          "FileName": request.fileName,
          "Path": request.path,
          "StorageSource": request.storageSource
        });
      }
      var response = await dio
          .put('${State.endPoint}/API/v1/Storage/$storageId', data: formData);
      return APIResult.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }

  /// Delete Storage
  Future<APIResult> delete(String storageId) async {
    try {
      var res = await http.delete(
        Uri.parse('${State.endPoint}/API/v1/Storage/$storageId'),
        headers: headers.Headers.getHeaders(),
      );
      return APIResult.fromJson(json.decode(res.body));
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Download Storage
  Future<Uint8List> download(String storageId) async {
    try {
      var res = await http.get(
        Uri.parse('${State.endPoint}/API/v1/Storage/download/$storageId'),
        headers: headers.Headers.getHeaders(),
      );
      return res.bodyBytes;
    } catch (e) {
      rethrow;
    }
  }
}

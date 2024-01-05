import 'dart:typed_data';
import 'package:apiraiser/constants.dart';
import 'package:apiraiser/src/api/rest.dart';
import 'package:apiraiser/src/models/rest_params.dart';
import 'package:apiraiser/src/models/sorage_upload_request.dart';
import 'package:dio/dio.dart';
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
      var response = await dio.post(
        '${State.endPoint}/API/${Constants.version}/Storage',
        data: formData,
      );
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
      var response = await dio.put(
        '${State.endPoint}/API/${Constants.version}/Storage/$storageId',
        data: formData,
      );
      return APIResult.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }

  /// Delete Storage
  Future<APIResult> delete(String storageId) async {
    try {
      var res = await Rest.delete(
        RestParams('/API/${Constants.version}/Storage/$storageId'),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Download Storage
  Future<Uint8List> download(String storageId) async {
    try {
      var res = await Rest.get(
        RestParams(
          '/API/${Constants.version}/Storage/download/$storageId',
          responseType: ResponseType.stream,
        ),
      );
      return res;
    } catch (e) {
      rethrow;
    }
  }
}

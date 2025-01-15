import 'dart:typed_data';
import 'package:apiraiser/constants.dart';
import 'package:apiraiser/src/helpers/rest.dart';
import 'package:apiraiser/src/models/rest_params.dart';
import 'package:apiraiser/src/models/sorage_upload_request.dart';
import 'package:dio/dio.dart';
import 'package:apiraiser/src/models/api_result.dart';

/// Storage APIs
class StorageProvider {
  static const String apiraiser = Constants.apiraiser;
  static const String version = Constants.version;
  static const String provider = Constants.provider;

  /// Upload Storage
  Future<APIResult> upload(StorageUploadRequest storageUploadRequest) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/$provider/Storage',
          data: storageUploadRequest,
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Update Storage
  Future<APIResult> update(
      StorageUploadRequest storageUploadRequest, String storageId) async {
    try {
      var res = await Rest.put(
        RestParams(
          '/$apiraiser/$version/$provider/Storage/$storageId',
          data: storageUploadRequest,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Delete Storage
  Future<APIResult> delete(String storageId) async {
    try {
      var res = await Rest.delete(
        RestParams('/$apiraiser/$version/$provider/Storage/$storageId'),
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
          '/$apiraiser/$version/$provider/Storage/Download/$storageId',
          responseType: ResponseType.stream,
        ),
      );
      return res;
    } catch (e) {
      rethrow;
    }
  }

  /// Get Plugins
  Future<APIResult> getPlugins() async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/$provider/Storage/GetPlugins',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }
}

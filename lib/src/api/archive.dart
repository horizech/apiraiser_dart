import 'dart:convert';
import 'dart:typed_data';
import 'package:apiraiser/src/api/rest.dart';
import 'package:apiraiser/src/models/api_result.dart';
import 'package:apiraiser/src/models/rest_params.dart';

/// Archive APIs
class Archive {
  /// Create Archive
  Future<APIResult> createArchive(String path, String fileName) async {
    try {
      Map<String, String> map = {"Path": path, "FileName": fileName};
      var res = await Rest.post(
        RestParams(
          '/API/v1/CreateArchive',
          data: jsonEncode(map),
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Extract By Path
  Future<APIResult> extractByPath(String path, String destination) async {
    try {
      Map<String, String> map = {"Path": path, "Destination": destination};
      var res = await Rest.post(
        RestParams(
          '/API/v1/ExtractByPath',
          data: jsonEncode(map),
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Extract By Url
  Future<APIResult> extractByUrl(String url, String destination) async {
    try {
      Map<String, String> map = {"Url": url, "Destination": destination};
      var res = await Rest.post(
        RestParams(
          '/API/v1/ExtractByUrl',
          data: jsonEncode(map),
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Extract By Bytes
  Future<APIResult> extractByBytes(Uint8List bytes, String destination) async {
    try {
      Map<String, dynamic> map = {"Bytes": bytes, "Destination": destination};
      var res = await Rest.post(
        RestParams(
          '/API/v1/ExtractByBytes',
          data: jsonEncode(map),
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Extract Using Storage
  Future<APIResult> extractUsingStorage(
      String storage, String destination) async {
    try {
      var res = await Rest.post(
        RestParams(
            '/API/v1/ExtractUsingStorage?storageId=$storage&destination=$destination'),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }
}

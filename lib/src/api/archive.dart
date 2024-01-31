import 'dart:convert';
import 'dart:typed_data';
import 'package:apiraiser/constants.dart';
import 'package:apiraiser/src/api/rest.dart';
import 'package:apiraiser/src/enums/output_path_prefix.dart';
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
          '/API/${Constants.version}/Archive/CreateArchive',
          data: jsonEncode(map),
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Extract By Path
  Future<APIResult> extractByPath(
    String archivePath,
    String outputPath,
    OutputPathPrefix outputPathPrefix,
  ) async {
    try {
      Map<String, String> map = {
        "ArchivePath": archivePath,
        "OutputPath": outputPath,
        "OutputPathPrefix": outputPathPrefix.index.toString()
      };
      var res = await Rest.post(
        RestParams(
          '/API/${Constants.version}/Archive/ExtractByPath',
          data: jsonEncode(map),
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Extract By Url
  Future<APIResult> extractByUrl(
      String url, String outputPath, OutputPathPrefix outputPathPrefix) async {
    try {
      Map<String, String> map = {
        "Url": url,
        "OutputPath": outputPath,
        "OutputPathPrefix": outputPathPrefix.index.toString()
      };
      var res = await Rest.post(
        RestParams(
          '/API/${Constants.version}/Archive/ExtractByUrl',
          data: jsonEncode(map),
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Extract By Bytes
  Future<APIResult> extractByBytes(Uint8List bytes, String outputPath,
      OutputPathPrefix outputPathPrefix) async {
    try {
      Map<String, dynamic> map = {
        "Bytes": bytes,
        "OutputPath": outputPath,
        "OutputPathPrefix": outputPathPrefix.index.toString()
      };
      var res = await Rest.post(
        RestParams(
          '/API/${Constants.version}/Archive/ExtractByBytes',
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
    String storage,
    String outputPath,
    OutputPathPrefix outputPathPrefix,
  ) async {
    Map<String, dynamic> map = {
      "OutputPath": outputPath,
      "OutputPathPrefix": outputPathPrefix.index.toString()
    };

    try {
      var res = await Rest.post(
        RestParams(
          '/API/${Constants.version}/Archive/ExtractUsingStorage?storageId=$storage',
          data: jsonEncode(map),
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }
}

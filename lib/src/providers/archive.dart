import 'dart:convert';
import 'dart:typed_data';
import 'package:apiraiser/constants.dart';
import 'package:apiraiser/src/helpers/rest.dart';
import 'package:apiraiser/src/enums/output_path_prefix.dart';
import 'package:apiraiser/src/models/api_result.dart';
import 'package:apiraiser/src/models/rest_params.dart';

/// Archive APIs
class ArchiveProvider {
  static const String apiraiser = Constants.apiraiser;
  static const String version = Constants.version;
  static const String provider = Constants.provider;

  /// Create Archive
  Future<APIResult> createArchive(String path, String fileName) async {
    try {
      Map<String, String> map = {"Path": path, "FileName": fileName};
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/$provider/Archive/CreateArchive',
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
      String archivePath, String outputPath, OutputPathPrefix outputPathPrefix,
      {bool? overwriteFiles}) async {
    try {
      Map<String, dynamic> map = {
        "ArchivePath": archivePath,
        "OutputPath": outputPath,
        "OutputPathPrefix": outputPathPrefix.index
      };
      if (overwriteFiles != null) {
        map["OverwriteFiles"] = overwriteFiles;
      }
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/$provider/Archive/ExtractByPath',
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
      String url, String outputPath, OutputPathPrefix outputPathPrefix,
      {bool? overwriteFiles}) async {
    try {
      Map<String, dynamic> map = {
        "Url": url,
        "OutputPath": outputPath,
        "OutputPathPrefix": outputPathPrefix.index
      };
      if (overwriteFiles != null) {
        map["OverwriteFiles"] = overwriteFiles;
      }
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/$provider/Archive/ExtractByUrl',
          data: jsonEncode(map),
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Extract By Bytes
  Future<APIResult> extractByBytes(
      Uint8List bytes, String outputPath, OutputPathPrefix outputPathPrefix,
      {bool? overwriteFiles}) async {
    try {
      Map<String, dynamic> map = {
        "Bytes": bytes,
        "OutputPath": outputPath,
        "OutputPathPrefix": outputPathPrefix.index
      };
      if (overwriteFiles != null) {
        map["OverwriteFiles"] = overwriteFiles;
      }
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/$provider/Archive/ExtractByBytes',
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
      String storage, String outputPath, OutputPathPrefix outputPathPrefix,
      {bool? overwriteFiles}) async {
    Map<String, dynamic> map = {
      "OutputPath": outputPath,
      "OutputPathPrefix": outputPathPrefix.index
    };
    if (overwriteFiles != null) {
      map["OverwriteFiles"] = overwriteFiles;
    }
    try {
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/$provider/Archive/ExtractUsingStorage?storageId=$storage',
          data: jsonEncode(map),
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get Plugins
  Future<APIResult> getPlugins() async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/$provider/Archive/GetPlugins',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }
}

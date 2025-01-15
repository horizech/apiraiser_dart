import 'package:apiraiser/apiraiser.dart';
import 'package:apiraiser/constants.dart';
import 'package:apiraiser/src/enums/output_path_prefix.dart';
import 'package:apiraiser/src/helpers/rest.dart';
import 'package:apiraiser/src/models/rest_params.dart';

/// Zip Archive APIs
class ZipArchivePlugin {
  static const String apiraiser = Constants.apiraiser;
  static const String version = Constants.version;
  static const String plugin = Constants.plugin;

  /// Create Archive
  Future<APIResult> createArchive(String path, String filename) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/$plugin/Zip/CreateArchive',
          data: {
            "Path": path,
            "FileName": filename,
          },
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Extract By Path
  Future<APIResult> extractByPath(String archivePath, String outputPath,
      OutputPathPrefix outputPathPrefix, bool overwriteFiles) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/$plugin/Zip/ExtractByPath',
          data: {
            "ArchivePath": archivePath,
            "OutputPath": outputPath,
            "OutputPathPrefix": outputPathPrefix,
            "OverwriteFiles": overwriteFiles,
          },
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Extract By URL
  Future<APIResult> extractByUrl(String url, String outputPath,
      OutputPathPrefix outputPathPrefix, bool overwriteFiles) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/$plugin/Zip/ExtractByUrl',
          data: {
            "URL": url,
            "OutputPath": outputPath,
            "OutputPathPrefix": outputPathPrefix,
            "OverwriteFiles": overwriteFiles,
          },
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Extract By bytes
  Future<APIResult> extractByBytes(dynamic bytes, String outputPath,
      OutputPathPrefix outputPathPrefix, bool overwriteFiles) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/$plugin/Zip/ExtractByBytes',
          data: {
            "Bytes": bytes,
            "OutputPath": outputPath,
            "OutputPathPrefix": outputPathPrefix,
            "OverwriteFiles": overwriteFiles,
          },
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Extract By Storage
  Future<APIResult> extractUsingStorage(String storage, String outputPath,
      OutputPathPrefix outputPathPrefix, bool overwriteFiles) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/$plugin/Zip/ExtractUsingStorage?storageId=$storage',
          data: {
            "OutputPath": outputPath,
            "OutputPathPrefix": outputPathPrefix,
            "OverwriteFiles": overwriteFiles,
          },
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }
}

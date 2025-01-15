import 'package:apiraiser/constants.dart';
import 'package:apiraiser/src/helpers/rest.dart';
import 'package:apiraiser/src/interfaces/s3_delete_file_request.dart';
import 'package:apiraiser/src/interfaces/s3_download_request.dart';
import 'package:apiraiser/src/interfaces/s3_request.dart';
import 'package:apiraiser/src/interfaces/s3_upload_folder_request.dart';
import 'package:apiraiser/src/interfaces/s3_upload_request.dart';
import 'package:apiraiser/src/models/rest_params.dart';
import 'package:apiraiser/src/models/api_result.dart';

/// S3 APIs
class S3Provider {
  static const String apiraiser = Constants.apiraiser;
  static const String version = Constants.version;
  static const String provider = Constants.provider;

  /// Upload File Using Stream
  Future<APIResult> uploadFileUsingStream(S3UploadRequest request) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/$provider/S3/UploadFileUsingStream',
          data: request,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Upload File Using Path
  Future<APIResult> uploadFileUsingPath(S3UploadRequest request) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/$provider/S3/UploadFileUsingPath',
          data: request,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Upload File
  Future<APIResult> uploadFile(S3UploadRequest request) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/$provider/S3/UploadFile',
          data: request,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Download File
  Future<APIResult> downloadFile(S3DownloadRequest request) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/$provider/S3/DownloadFile',
          data: request,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get List Of Buckets
  Future<APIResult> getListOfBuckets(S3Request request) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/$provider/S3/GetListOfBuckets',
          data: request,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Delete File
  Future<APIResult> deleteFile(S3DeleteFileRequest request) async {
    try {
      var res = await Rest.delete(
        RestParams(
          '/$apiraiser/$version/$provider/S3/DeleteFile',
          data: request,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Delete File
  Future<APIResult> deleteByKey(String key) async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/$provider/S3/DeleteByKey?key=$key',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Upload folder
  Future<APIResult> uploadFolder(S3UploadFolderRequest request) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/$provider/S3/UploadFolder',
          data: request,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get Plugin
  Future<APIResult> getPlugins() async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/$provider/S3/GetPlugins',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }
}

import 'dart:typed_data';
import 'package:apiraiser/constants.dart';
import 'package:apiraiser/src/helpers/rest.dart';
import 'package:apiraiser/src/models/media_upload_request.dart';
import 'package:apiraiser/src/models/rest_params.dart';
import 'package:dio/dio.dart';
import 'package:apiraiser/src/models/api_result.dart';

/// Media APIs
class MediaProvider {
  static const String apiraiser = Constants.apiraiser;
  static const String version = Constants.version;
  static const String provider = Constants.provider;

  /// upload media
  Future<APIResult> upload(MediaUploadRequest mediaUploadRequest) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/$provider/Media',
          data: mediaUploadRequest,
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

  /// update media
  Future<APIResult> update(
      MediaUploadRequest mediaUploadRequest, String mediaId) async {
    try {
      var res = await Rest.put(
        RestParams(
          '/$apiraiser/$version/$provider/Media/$mediaId',
          data: mediaUploadRequest,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Delete a media
  Future<APIResult> delete(String mediaId) async {
    try {
      var res = await Rest.delete(
        RestParams('/$apiraiser/$version/$provider/Media/$mediaId'),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Download a media
  Future<Uint8List?> download(String mediaId) async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/$provider/Media/Download/$mediaId',
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
          '/$apiraiser/$version/$provider/Media/GetPlugins',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }
}

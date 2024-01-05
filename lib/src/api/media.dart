import 'dart:typed_data';
import 'package:apiraiser/constants.dart';
import 'package:apiraiser/src/api/rest.dart';
import 'package:apiraiser/src/models/media_upload_request.dart';
import 'package:apiraiser/src/models/rest_params.dart';
import 'package:dio/dio.dart';
import 'package:apiraiser/src/helpers/state.dart';
import 'package:apiraiser/src/models/api_result.dart';

/// Media APIs
class Media {
  /// upload media
  Future<APIResult?> upload(MediaUploadRequest request) async {
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
          "MediaSource": request.mediaSource
        });
      }
      var response = await dio.post(
          '${State.endPoint}/API/${Constants.version}/Media',
          data: formData);
      return APIResult.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }

  /// upload media
  Future<APIResult?> update(String mediaId, MediaUploadRequest request) async {
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
          "MediaSource": request.mediaSource
        });
      }
      var response = await dio.put(
          '${State.endPoint}/API/${Constants.version}/Media/$mediaId',
          data: formData);
      return APIResult.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }

  /// Delete a media
  Future<APIResult> delete(String mediaId) async {
    try {
      var res = await Rest.delete(
        RestParams('/API/${Constants.version}/Media/$mediaId'),
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
          '${State.endPoint}/API/${Constants.version}/Media/Download/$mediaId',
          responseType: ResponseType.stream,
        ),
      );
      return res;
    } catch (e) {
      rethrow;
    }
  }
}

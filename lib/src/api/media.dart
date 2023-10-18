import 'dart:convert';
import 'dart:typed_data';
import 'package:apiraiser/src/helpers/headers.dart' as headers;
import 'package:apiraiser/src/models/media_upload_request.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
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
      // else if (mediaUploadRequest.files != null &&
      //     mediaUploadRequest.files!.isNotEmpty) {
      //   // multiple files
      //   for (var file in mediaUploadRequest.files!) {
      //     request.files.add(
      //       http.MultipartFile.fromBytes("FormFile", file,
      //           filename: mediaUploadRequest.fileName ?? "image.jpg"),
      //     );
      //   }
      // }
      var response =
          await dio.post('${State.endPoint}/API/Media', data: formData);
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
      var response =
          await dio.put('${State.endPoint}/API/Media/$mediaId', data: formData);
      return APIResult.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }

  /// Delete a media
  Future<APIResult> delete(String mediaId) async {
    try {
      var res = await http.delete(
        Uri.parse('${State.endPoint}/API/Media/$mediaId'),
        headers: headers.Headers.getHeaders(),
      );
      return APIResult.fromJson(json.decode(res.body));
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Download a media
  Future<Uint8List?> download(String mediaId) async {
    try {
      var res = await http.get(
        Uri.parse('${State.endPoint}/API/Media/Download/$mediaId'),
        headers: headers.Headers.getHeaders(),
      );
      return res.bodyBytes;
    } catch (e) {
      rethrow;
    }
  }
}

import 'dart:convert';
import 'dart:html';

import 'dart:typed_data';
import 'package:apiraiser/src/helpers/headers.dart' as headers;
import 'package:apiraiser/src/models/media_upload_request.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:apiraiser/src/helpers/state.dart';
import 'package:apiraiser/src/models/api_result.dart';

final dio = Dio();

/// Media APIs
class Media {
  /// upload media
  Future<String?> upload(MediaUploadRequest mediaUploadRequest) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('${State.endPoint}/API/Media'),
      );
      // request.headers.addAll(
      //   Headers.getHeaders(),
      // );
      // if (mediaUploadRequest.fileName != null &&
      //     mediaUploadRequest.fileName!.isNotEmpty) {
      //   request.fields.addEntries({
      //     "FileName": "${mediaUploadRequest.fileName}",
      //   }.entries);
      // }
      // if (mediaUploadRequest.mediaSource != null &&
      //     mediaUploadRequest.mediaSource!.isNotEmpty) {
      //   request.fields.addEntries(
      //       {"MediaSource": "${mediaUploadRequest.mediaSource}"}.entries);
      // }
      // if (mediaUploadRequest.path != null &&
      //     mediaUploadRequest.path!.isNotEmpty) {
      //   request.fields
      //       .addEntries({"Path": "${mediaUploadRequest.path}"}.entries);
      // }
      if (mediaUploadRequest.file != null &&
          mediaUploadRequest.file!.isNotEmpty) {
        // single file
        // request.files.add(
        //   http.MultipartFile.fromBytes("FormFile", mediaUploadRequest.file!,
        //       contentType: MediaType("image", "jpeg"),
        //       filename: mediaUploadRequest.fileName ?? "image.jpg"),
        // );

        dio.options.headers['content-Type'] = 'application/json';
        if (State.jwt?.isNotEmpty ?? false) {
          dio.options.headers["authorization"] = "Bearer ${State.jwt}";
        }
        FormData formData = FormData.fromMap({
          "FileName": mediaUploadRequest.fileName ?? "image.jpg",
          "FormFile": MultipartFile.fromBytes(
            mediaUploadRequest.file!,
            filename: mediaUploadRequest.fileName ?? "image.jpg",
          )

          // http.MultipartFile.fromBytes(
          //   mediaUploadRequest.file!,
          //   filename: mediaUploadRequest.fileName ?? "image.jpg",
          // ),
        });
        var response =
            await dio.post('${State.endPoint}/API/Media', data: formData);
        return response.toString();
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
        // var res = await request.send();

        // return APIResult.fromJson(
        //   json.decode(
        //     await res.stream.bytesToString(),
        //   ),
        // );
      }
    } catch (e) {
      return null;
    }
    return null;
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
      rethrow;
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

import 'dart:convert';
import 'package:apiraiser/src/helpers/headers.dart';
import 'package:apiraiser/src/models/media_upload_request.dart';
import 'package:http/http.dart' as http;

import 'package:apiraiser/src/helpers/state.dart';
import 'package:apiraiser/src/models/api_result.dart';

/// Media APIs
class Media {
  /// upload media
  Future<APIResult> upload(MediaUploadRequest mediaUploadRequest) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('${State.endPoint}/API/Media'),
    );
    request.headers.addAll(
      Headers.getHeaders(),
    );
    request.fields.addEntries({
      "MediaId": "${mediaUploadRequest.mediaId}",
      "FileName": "${mediaUploadRequest.fileName}",
      "MediaSource": "${mediaUploadRequest.mediaSource}",
      "Path": "${mediaUploadRequest.path}"
    }.entries);
    if (mediaUploadRequest.file != null &&
        mediaUploadRequest.file!.isNotEmpty) {
      // single file
      request.files.add(
        http.MultipartFile.fromBytes("FormFile", mediaUploadRequest.file!,
            filename: mediaUploadRequest.fileName),
      );
    } else if (mediaUploadRequest.files != null &&
        mediaUploadRequest.files!.isNotEmpty) {
      // multiple files
      for (var file in mediaUploadRequest.files!) {
        request.files.add(
          http.MultipartFile.fromBytes("FormFile", file,
              filename: mediaUploadRequest.fileName),
        );
      }
    }
    var res = await request.send();

    return APIResult.fromJson(
      json.decode(
        await res.stream.bytesToString(),
      ),
    );
  }

  /// Delete a media
  Future<APIResult> delete(
    int mediaId,
  ) async {
    var res = await http.delete(
      Uri.parse('${State.endPoint}/API/Media?mediaId=$mediaId'),
      headers: Headers.getHeaders(),
    );
    return APIResult.fromJson(json.decode(res.body));
  }
}

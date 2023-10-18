import 'dart:convert';
import 'dart:typed_data';
import 'package:apiraiser/src/helpers/headers.dart';
import 'package:apiraiser/src/models/sorage_upload_request.dart';
import 'package:http/http.dart' as http;
import 'package:apiraiser/src/helpers/state.dart';
import 'package:apiraiser/src/models/api_result.dart';

/// Storage APIs
class Storage {
  /// upload Storage
  Future<APIResult> upload(StorageUploadRequest storageUploadRequest) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('${State.endPoint}/API/Storage'),
    );
    request.headers.addAll(
      Headers.getHeaders(),
    );
    request.fields.addEntries({
      "StorageId": "${storageUploadRequest.storageId}",
      "FileName": "${storageUploadRequest.fileName}",
      "StorageSource": "${storageUploadRequest.storageSource}",
      "Path": "${storageUploadRequest.path}"
    }.entries);
    if (storageUploadRequest.file != null &&
        storageUploadRequest.file!.isNotEmpty) {
      // single file
      request.files.add(
        http.MultipartFile.fromBytes("FormFile", storageUploadRequest.file!,
            filename: storageUploadRequest.fileName),
      );
    } else if (storageUploadRequest.files != null &&
        storageUploadRequest.files!.isNotEmpty) {
      // multiple files
      for (var file in storageUploadRequest.files!) {
        request.files.add(
          http.MultipartFile.fromBytes("FormFile", file,
              filename: storageUploadRequest.fileName),
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

  /// Delete Storage
  Future<APIResult> delete(String storageId) async {
    var res = await http.delete(
      Uri.parse('${State.endPoint}/API/Storage/$storageId'),
      headers: Headers.getHeaders(),
    );
    return APIResult.fromJson(json.decode(res.body));
  }

  /// Download Storage
  Future<Uint8List> download(String storageId) async {
    var res = await http.get(
      Uri.parse('${State.endPoint}/API/Storage/download/$storageId'),
      headers: Headers.getHeaders(),
    );
    return res.bodyBytes;
  }
}

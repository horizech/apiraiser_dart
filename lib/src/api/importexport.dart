import 'dart:typed_data';
import 'package:apiraiser/apiraiser.dart';
import 'package:apiraiser/src/helpers/headers.dart';
import 'package:http/http.dart' as http;

import 'package:apiraiser/src/helpers/state.dart';

/// ImportExport APIs
class ImportExport {
  /// Export Excel
  Future<Uint8List?> exportExcel(
      String table, List<QuerySearchItem> conditions) async {
    var res = await http.post(
      Uri.parse('${State.endPoint}/API/ImportExport/ExportExcel/$table'),
      headers: Headers.getHeaders(),
      body: QuerySearchItem.toJsonList(conditions),
    );
    return res.bodyBytes;
  }

  /// Import Excel
  Future<dynamic> importExcel(String table, ImportRequest importRequest) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('${State.endPoint}/API/ImportExport/ImportExcel/$table'),
    );

    request.headers.addAll(
      Headers.getHeaders(),
    );
    request.files.add(
      http.MultipartFile.fromBytes(
        "FormFile",
        importRequest.file,
      ),
    );
    var res = await request.send();

    return res;
  }
}

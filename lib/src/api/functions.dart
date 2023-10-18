import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:apiraiser/src/models/api_result.dart';
import 'package:apiraiser/src/helpers/state.dart';
import 'package:apiraiser/src/helpers/headers.dart';

/// Function APIs
class Functions {
  /// Execute Function by [id]
  Future<APIResult> excuteFunction(
      String id, Map<String, dynamic> jsonQuery) async {
    try {
      var res = await http.post(
        Uri.parse('${State.endPoint}/API/function/Execute/$id'),
        headers: Headers.getHeaders(),
        body: jsonEncode(jsonQuery),
      );
      return APIResult.fromJson(json.decode(res.body));
    } catch (e) {
      rethrow;
    }
  }
}

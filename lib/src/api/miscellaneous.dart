import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:apiraiser/src/helpers/state.dart';
import 'package:apiraiser/src/helpers/headers.dart';
import 'package:apiraiser/src/models/api_result.dart';

/// Miscellaneous APIs
class Miscellaneous {
  /// Get list of all actions
  static Future<APIResult> getAllActions() async {
    var res = await http.get(
        Uri.parse('${State.endPoint}/API/Apiraiser/GetAllActions'),
        headers: Headers.getHeaders());
    return APIResult.fromJson(json.decode(res.body));
  }

  /// Get Apiraiser information
  static Future<APIResult> getInfo() async {
    var res = await http.get(
        Uri.parse('${State.endPoint}/API/Apiraiser/GetInfo'),
        headers: Headers.getHeaders());
    return APIResult.fromJson(json.decode(res.body));
  }
}

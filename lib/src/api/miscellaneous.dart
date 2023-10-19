import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:apiraiser/src/helpers/state.dart';
import 'package:apiraiser/src/helpers/headers.dart';
import 'package:apiraiser/src/models/api_result.dart';

/// Miscellaneous APIs
class Miscellaneous {
  /// Get list of all actions
  Future<APIResult> getAllActions() async {
    var res = await http.get(
        Uri.parse('${State.endPoint}/API/v1/API/v1raiser/GetAllActions'),
        headers: Headers.getHeaders());
    return APIResult.fromJson(json.decode(res.body));
  }

  /// Get Apiraiser information
  Future<APIResult> getInfo() async {
    var res = await http.get(
        Uri.parse('${State.endPoint}/API/v1/API/v1raiser/GetInfo'),
        headers: Headers.getHeaders());
    return APIResult.fromJson(json.decode(res.body));
  }
}

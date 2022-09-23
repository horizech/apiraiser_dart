import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:apiraiser/src/helpers/state.dart';
import 'package:apiraiser/src/helpers/headers.dart';
import 'package:apiraiser/src/models/api_result.dart';
import 'package:apiraiser/src/models/initialize_request.dart';

/// Initialization APIs
class Initialization {
  /// Is Apiraiser Initialized
  static Future<APIResult> isInitialized() async {
    var res = await http.get(
        Uri.parse('${State.endPoint}/API/Apiraiser/IsInitialized'),
        headers: Headers.getHeaders());
    return APIResult.fromJson(json.decode(res.body));
  }

  /// Initialize Apiraiser CMS
  static Future<APIResult> initialize(
      InitializeRequest initializeRequest) async {
    Map<String, dynamic> data = initializeRequest.toJson(initializeRequest);
    try {
      var res = await http.post(
        Uri.parse('${State.endPoint}/API/Apiraiser/Initialize'),
        headers: Headers.getHeaders(),
        body: jsonEncode(data),
      );
      return APIResult.fromJson(json.decode(res.body));
    } catch (e) {
      rethrow;
    }
  }
}

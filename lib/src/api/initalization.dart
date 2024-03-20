import 'dart:convert';

import 'package:apiraiser/constants.dart';
import 'package:apiraiser/src/helpers/rest.dart';
import 'package:apiraiser/src/models/rest_params.dart';
import 'package:apiraiser/src/models/api_result.dart';
import 'package:apiraiser/src/models/initialize_request.dart';

/// Initialization APIs
class Initialization {
  /// Is Apiraiser Initialized
  static Future<APIResult> isInitialized() async {
    var res = await Rest.get(
      RestParams('/API/${Constants.version}/Apiraiser/IsInitialized'),
    );
    return APIResult.fromJson(res);
  }

  /// Initialize Apiraiser CMS
  static Future<APIResult> initialize(
      InitializeRequest initializeRequest) async {
    Map<String, dynamic> data = initializeRequest.toJson(initializeRequest);
    try {
      var res = await Rest.post(
        RestParams(
          '/API/${Constants.version}/Apiraiser/Initialize',
          data: jsonEncode(data),
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }
}

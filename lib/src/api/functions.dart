import 'dart:convert';

import 'package:apiraiser/constants.dart';
import 'package:apiraiser/src/helpers/rest.dart';
import 'package:apiraiser/src/models/rest_params.dart';
import 'package:apiraiser/src/models/api_result.dart';

/// Function APIs
class Functions {
  /// Execute Function by [id]
  Future<APIResult> excuteFunction(
      String id, Map<String, dynamic> jsonQuery) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/API/${Constants.version}/function/Execute/$id',
          data: jsonEncode(jsonQuery),
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }
}

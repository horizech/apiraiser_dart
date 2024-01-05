import 'package:apiraiser/constants.dart';
import 'package:apiraiser/src/api/rest.dart';
import 'package:apiraiser/src/models/rest_params.dart';

import 'package:apiraiser/src/models/api_result.dart';

/// Miscellaneous APIs
class Miscellaneous {
  /// Get list of all actions
  Future<APIResult> getAllActions() async {
    var res = await Rest.get(
      RestParams(
        '/API/${Constants.version}/Apiraiser/GetAllActions',
      ),
    );
    return APIResult.fromJson(res);
  }

  /// Get Apiraiser information
  Future<APIResult> getInfo() async {
    var res = await Rest.get(
      RestParams('/API/${Constants.version}/Apiraiser/GetInfo'),
    );
    return APIResult.fromJson(res);
  }
}

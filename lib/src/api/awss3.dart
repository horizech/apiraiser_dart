import 'package:apiraiser/src/api/rest.dart';
import 'package:apiraiser/src/models/api_result.dart';
import 'package:apiraiser/src/models/rest_params.dart';

/// AWSS3 APIs
class AWSS3 {
  /// Create AWSS3
  Future<APIResult> deleteByKey(String key) async {
    try {
      var res = await Rest.get(
        RestParams(
          '/API/v1/AWSS3/DeleteByKey?key=$key',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }
}

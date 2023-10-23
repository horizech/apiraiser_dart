import 'package:apiraiser/src/api/rest.dart';
import 'package:apiraiser/src/models/api_result.dart';
import 'package:apiraiser/src/models/rest_params.dart';

/// Feature APIs
class Feature {
  /// Install a new Feature
  Future<APIResult> install(String feature) async {
    try {
      var res = await Rest.post(
        RestParams('/API/v1/Feature/Install', params: {
          "feature": feature,
        }),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get Features List
  Future<APIResult> getList() async {
    try {
      var res = await Rest.get(
        RestParams('/API/v1/Feature/GetList'),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Delete a new Feature
  Future<APIResult> delete(String feature) async {
    try {
      var res = await Rest.delete(
        RestParams('/API/v1/Feature/Delete', params: {
          "feature": feature,
        }),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }
}

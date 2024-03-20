import 'package:apiraiser/constants.dart';
import 'package:apiraiser/src/helpers/rest.dart';
import 'package:apiraiser/src/models/api_result.dart';
import 'package:apiraiser/src/models/rest_params.dart';

/// Feature APIs
class Feature {
  /// Install a new Feature
  Future<APIResult> install(String feature) async {
    try {
      var res = await Rest.post(
        RestParams('/API/${Constants.version}/Feature/Install', params: {
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
        RestParams('/API/${Constants.version}/Feature/GetList'),
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
        RestParams('/API/${Constants.version}/Feature/Delete', params: {
          "feature": feature,
        }),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }
}

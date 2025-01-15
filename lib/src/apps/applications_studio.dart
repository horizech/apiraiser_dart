import 'package:apiraiser/constants.dart';
import 'package:apiraiser/src/helpers/rest.dart';
import 'package:apiraiser/src/models/api_result.dart';
import 'package:apiraiser/src/models/rest_params.dart';

/// Application Studio APIs
class ApplicationsStudioApp {
  static const String apiraiser = Constants.apiraiser;
  static const String version = Constants.version;
  static const String app = Constants.app;

  /// Get Data
  Future<APIResult> getData() async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/$app/ApplicationsStudio/GetData',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Modify Application
  Future<APIResult> modifyApplication(Object data) async {
    try {
      var res = await Rest.put(
        RestParams(
          '/$apiraiser/$version/$app/ApplicationsStudio/ModifyApplication',
          data: data,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }
}

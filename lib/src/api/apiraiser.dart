import 'package:apiraiser/apiraiser.dart';
import 'package:apiraiser/constants.dart';
import 'package:apiraiser/src/helpers/rest.dart';
import 'package:apiraiser/src/helpers/state.dart';
import 'package:apiraiser/src/models/rest_params.dart';

/// Apiraiser APIs
class ApiraiserClass {
  static const String apiraiser = Constants.apiraiser;
  static const String version = Constants.version;

  /// Is Apiraiser Initialized
  Future<APIResult> isInitialized() async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/IsInitialized',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Initialize Apiraiser CMS
  Future<dynamic> initialize(InitializeRequest initializeRequest) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/Initialize',
          data: initializeRequest,
        ),
      );
      return await State.processAuthenticationResult(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get list of all actions
  Future<dynamic> getAllActions() async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/GetAllActions',
        ),
      );
      return await State.processAuthenticationResult(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get Home
  Future<dynamic> getHome() async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/GetHome',
        ),
      );
      return await State.processAuthenticationResult(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get Apiraiser information
  Future<dynamic> getInfo() async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/GetInfo',
        ),
      );
      return await State.processAuthenticationResult(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get Apiraiser information
  Future<dynamic> getFavicon() async {
    try {
      var res = await Rest.get(
        RestParams(
          '/Favicon.ico',
        ),
      );
      return await State.processAuthenticationResult(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }
}

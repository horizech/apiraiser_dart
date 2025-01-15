import 'package:apiraiser/apiraiser.dart';
import 'package:apiraiser/constants.dart';
import 'package:apiraiser/src/helpers/rest.dart';
import 'package:apiraiser/src/models/rest_params.dart';

/// Email APIs
class EmailProvider {
  static const String apiraiser = Constants.apiraiser;
  static const String version = Constants.version;
  static const String provider = Constants.provider;

  /// Send Email
  Future<APIResult> sendEmail(EmailRequest requst) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/$provider/Email/SendEmail',
          data: requst,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get Plugin
  Future<APIResult> getPlugins() async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/$provider/Email/GetPlugins',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }
}

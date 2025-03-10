import 'dart:convert';

import 'package:apiraiser/apiraiser.dart';
import 'package:apiraiser/constants.dart';
import 'package:apiraiser/src/helpers/rest.dart';
import 'package:apiraiser/src/models/rest_params.dart';

/// SMTP Email Plugin APIs
class SMTPEmailPlugin {
  static const String apiraiser = Constants.apiraiser;
  static const String version = Constants.version;
  static const String plugin = Constants.plugin;

  /// Send Email
  Future<APIResult> sendEmail(EmailRequest request) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/$plugin/SMTP/SendEmail',
          data: jsonEncode(request),
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }
}

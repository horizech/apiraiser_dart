import 'dart:convert';

import 'package:apiraiser/constants.dart';
import 'package:apiraiser/src/helpers/rest.dart';
import 'package:apiraiser/src/models/api_result.dart';
import 'package:apiraiser/src/models/email_request.dart';
import 'package:apiraiser/src/models/rest_params.dart';

/// SMTP APIs
class SMTP {
  /// Send Email
  Future<APIResult> sendEmail(EmailRequest request) async {
    try {
      Map<String, dynamic> emailData = request.toJson(request);

      var res = await Rest.post(
        RestParams(
          '/API/${Constants.version}/SMTP/SendEmail',
          data: jsonEncode(emailData),
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }
}

import 'package:apiraiser/src/helpers/state.dart';

/// Headers class responsible for handing http headers
class Headers {
  /// Get headers by adding Authorization header if jwt exists
  static Map<String, String> getHeaders(
      {String? jwt, Map<String, String>? contentType}) {
    Map<String, String> headers = {};
    if (contentType != null) {
      headers = contentType;
    } else {
      headers = {"Content-Type": "application/json"};
    }
    if ((jwt?.isNotEmpty ?? false) ||
        (State.accessToken?.isNotEmpty ?? false)) {
      headers.addAll(
        {
          "Authorization": "Bearer ${jwt ?? State.accessToken}",
        },
      );
    }
    return headers;
  }
}

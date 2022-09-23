import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:apiraiser/src/models/api_result.dart';
import 'package:apiraiser/src/models/user.dart';

/// State class containing the token and endpoint
class State {
  /// JWT Token
  static String? jwt;

  /// Endpoint
  static String? endPoint;

  /// User
  static User? user;

  /// store provided [jwtToken] in state and Secure storage for future use
  static storeJwt(String? jwtToken) async {
    jwt = jwtToken;
    const storage = FlutterSecureStorage();
    await storage.write(key: "jwt", value: jwt);
  }

  /// Load jwt from Secure storage
  static Future<String?> loadJwt() async {
    const storage = FlutterSecureStorage();
    return await storage.read(key: "jwt");
  }

  /// Clear jwt
  static Future clearJwt() async {
    State.jwt = null;
    const storage = FlutterSecureStorage();
    return await storage.write(key: "jwt", value: null);
  }

  /// Process authentication result from [auth] as current user and returns [auth] back
  ///
  /// Loads user and jwt if successful, otherwise clears the jwt and current user.
  static APIResult processAuthenticationResult(APIResult auth) {
    if (auth.success) {
      /// The result seems good, load the user and jwt from it
      State.user = User.fromJson(auth.data);
      State.jwt = auth.data['token'];
      storeJwt(State.jwt);
    } else {
      /// The result was unsuccessful, clear the session if exists
      clearSession();
    }
    return auth;
  }

  /// Clear jwt
  static Future clearUser() async {
    State.user = null;
  }

  /// Clear session
  static Future clearSession() async {
    clearJwt();
    clearUser();
  }
}

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

  /// store provided RefreshToken in  Secure storage for future use
  static storeRefreshToken(String? token) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: "refresh_token", value: token);
  }

  /// Load jwt from Secure storage
  static Future<String?> loadRefreshToken() async {
    const storage = FlutterSecureStorage();
    return await storage.read(key: "refresh_token");
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
  static Future<APIResult> processAuthenticationResult(APIResult auth,
      {String? jwt}) async {
    if (auth.success) {
      /// The result seems good, load the user and jwt from it
      State.user = User.fromJson(auth.data);
      if (jwt != null) {
        State.jwt = jwt;
      } else if (auth.data['AccessToken'] != null) {
        State.jwt = auth.data['AccessToken'];
      }
      if (auth.data['RefreshToken'] != null) {
        await storeRefreshToken(auth.data['RefreshToken']);
      }
      await storeJwt(State.jwt);
    } else {
      /// The result was unsuccessful, clear the session if exists
      await clearSession();
    }
    return auth;
  }

  /// Clear jwt
  static void clearUser() {
    State.user = null;
  }

  /// Clear session
  static Future clearSession() async {
    await clearJwt();
    clearUser();
  }
}

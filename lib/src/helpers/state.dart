import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:apiraiser/src/models/api_result.dart';
import 'package:apiraiser/src/models/user.dart';

/// State class containing the token and endpoint
class State {
  /// JWT Acess Token
  static String? accessToken;

  /// JWT Refresh Token
  static String? refreshToken;

  /// Endpoint
  static String? endPoint;

  /// User
  static User? user;

  /// save provided [Session] in state and Secure storage for future use
  static saveSessionInSecureStorage(
      {String? accessToken, String? refreshToken}) async {
    accessToken = accessToken;
    refreshToken = refreshToken;
    const storage = FlutterSecureStorage();
    await storage.write(key: "access_token", value: accessToken);
    await storage.write(key: "refresh_token", value: refreshToken);
  }

  /// Load session from Secure storage
  static loadSessionFromSecureStorage() async {
    const storage = FlutterSecureStorage();
    accessToken = await storage.read(key: "access_token");
    refreshToken = await storage.read(key: "refresh_token");
  }

  /// Clear Session From Secure Storage
  static clearSessionFromSecureStorage() {
    State.accessToken = null;
    State.refreshToken = null;
    const storage = FlutterSecureStorage();
    storage.deleteAll();
  }

  /// Process authentication result from [auth] as current user and returns [auth] back
  ///
  /// Loads user and jwt if successful, otherwise clears the jwt and current user.
  static Future<APIResult> processAuthenticationResult(APIResult auth) async {
    try {
      if (auth.success) {
        /// The result seems good, load the user and jwt from it
        State.user = User.fromJson(auth.data);
        if (auth.data['AccessToken'] != null) {
          State.accessToken = auth.data['AccessToken'];
        }
        if (auth.data['RefreshToken'] != null) {
          State.refreshToken = auth.data['RefreshToken'];
        }
        await saveSessionInSecureStorage(
            accessToken: State.accessToken, refreshToken: State.refreshToken);
      }
    } catch (e) {
      return APIResult.error(e.toString());
    }
    return auth;
  }

  /// Clear user
  static void clearUser() {
    State.user = null;
  }

  /// Clear session
  static clearSession() {
    clearSessionFromSecureStorage();
    clearUser();
  }
}

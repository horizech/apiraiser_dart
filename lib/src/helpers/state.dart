import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// State class containing the token and endpoint
class State {
  /// JWT Token
  static String? jwt;

  /// Endpoint
  static String? endPoint;

  /// store provided [jwtToken] in state and Secure storage for future use
  static storeJwt(String jwtToken) async {
    jwt = jwtToken;
    const storage = FlutterSecureStorage();
    await storage.write(key: "jwt", value: jwt);
  }

  /// Load jwt from Secure storage
  static Future<String?> loadJwt() async {
    const storage = FlutterSecureStorage();
    return await storage.read(key: "jwt");
  }
}

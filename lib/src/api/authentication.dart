import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:apiraiser/src/models/api_result.dart';
import 'package:apiraiser/src/models/login_request.dart';
import 'package:apiraiser/src/models/signup_request.dart';
import 'package:apiraiser/src/models/user.dart';
import 'package:apiraiser/src/helpers/state.dart';

/// Authentication APIs
class Authentication {
  /// Login
  login(LoginRequest loginRequest) async {
    Map<String, dynamic> loginData = loginRequest.toJson(loginRequest);

    var res = await http.post(
      Uri.parse('${State.endPoint}/API/Authentication/Login'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(loginData),
    );
    return await State.processAuthenticationResult(
        APIResult.fromJson(json.decode(res.body)));
  }

  /// Signup
  signup(SignupRequest signupRequest) async {
    Map<String, dynamic> signupData = signupRequest.toJson(signupRequest);

    var res = await http.post(
      Uri.parse('${State.endPoint}/API/Authentication/Signup'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(signupData),
    );
    return await State.processAuthenticationResult(
        APIResult.fromJson(json.decode(res.body)));
  }

  /// Load last session
  loadLastSession() async {
    String? jwt = await State.loadJwt();
    if (jwt?.isNotEmpty ?? false) {
      var res = await http.get(
        Uri.parse('${State.endPoint}/API/Authentication/AuthLogin'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $jwt",
        },
      );
      return await State.processAuthenticationResult(
          APIResult.fromJson(json.decode(res.body)));
    } else {
      return APIResult(success: false, message: "No previous session found!");
    }
  }

  /// Whether the user is signed in
  bool isSignedIn() {
    return State.jwt?.isNotEmpty ?? false;
  }

  User? getCurrentUser() {
    return State.user;
  }
}

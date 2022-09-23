import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:apiraiser/src/helpers/state.dart';
import 'package:apiraiser/src/models/login_request.dart';
import 'package:apiraiser/src/models/signup_request.dart';
import 'package:apiraiser/src/models/api_result.dart';

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
    return APIResult.fromJson(json.decode(res.body));
  }

  /// Signup
  signup(SignupRequest signupRequest) async {
    Map<String, dynamic> signupData = signupRequest.toJson(signupRequest);

    var res = await http.post(
      Uri.parse('${State.endPoint}/API/Authentication/Signup'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(signupData),
    );
    return APIResult.fromJson(json.decode(res.body));
  }

  /// Perform auth login
  authLogin(String jwt) async {
    var res = await http.get(
      Uri.parse('${State.endPoint}/API/Authentication/AuthLogin'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $jwt",
      },
    );
    return APIResult.fromJson(json.decode(res.body));
  }

  /// Whether the user is signed in
  bool isSignedIn() {
    return State.jwt?.isNotEmpty ?? false;
  }
}

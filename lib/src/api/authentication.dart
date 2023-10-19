import 'dart:convert';
import 'package:apiraiser/src/helpers/headers.dart';
import 'package:http/http.dart' as http;

import 'package:apiraiser/src/models/api_result.dart';
import 'package:apiraiser/src/models/login_request.dart';
import 'package:apiraiser/src/models/signup_request.dart';
import 'package:apiraiser/src/models/user.dart';
import 'package:apiraiser/src/helpers/state.dart';

/// Authentication APIs
class Authentication {
  /// Login
  Future<APIResult> login(LoginRequest loginRequest) async {
    Map<String, dynamic> loginData = loginRequest.toJson(loginRequest);

    var res = await http.post(
      Uri.parse('${State.endPoint}/API/v1/Authentication/Login'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(loginData),
    );
    return await State.processAuthenticationResult(
        APIResult.fromJson(json.decode(res.body)));
  }

  /// Signup
  Future<APIResult> signup(SignupRequest signupRequest) async {
    Map<String, dynamic> signupData = signupRequest.toJson(signupRequest);

    var res = await http.post(
      Uri.parse('${State.endPoint}/API/v1/Authentication/Signup'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(signupData),
    );
    return await State.processAuthenticationResult(
        APIResult.fromJson(json.decode(res.body)));
  }

  /// Load last session
  Future<APIResult> loadSessionUsingJwt(String? jwt) async {
    if (jwt != null && jwt.isNotEmpty) {
      State.jwt = jwt;
      var res = await http.get(
        Uri.parse(
            '${State.endPoint}/API/v1/Authentication/LoadSessionUsingJwt'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $jwt",
        },
      );
      return await State.processAuthenticationResult(
          APIResult.fromJson(json.decode(res.body)),
          jwt: jwt);
    } else {
      return APIResult(
        success: false,
        data: null,
        message: 'Please provide JWT token!',
      );
    }
  }

  /// Refresh token
  Future<APIResult> refreshToken(String jwt) async {
    if (jwt.isNotEmpty) {
      var res = await http.get(
        Uri.parse('${State.endPoint}/API/v1/Authentication/RefreshToken'),
        headers: {"Content-Type": "application/json"},
      );
      return await State.processAuthenticationResult(
        APIResult.fromJson(json.decode(res.body)),
      );
    } else {
      return APIResult(
        success: false,
        errorCode: null,
        message: 'Please provide JWT token!',
        data: null,
      );
    }
  }

  /// Reset Password
  Future<APIResult> resetPassword(
      String token, String password, String confirmPassword) async {
    Map<String, dynamic> data = {
      "Token": token,
      "Password": password,
      "ConfirmPassword": confirmPassword,
    };
    var res = await http.post(
      Uri.parse('${State.endPoint}/API/v1/Authentication/ResetPassword'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(data),
    );
    return APIResult.fromJson(json.decode(res.body));
  }

  /// Forgot Password
  Future<APIResult> forgotPassword(String email) async {
    var res = await http.post(
      Uri.parse('${State.endPoint}/API/v1/Authentication/ForgotPassword'),
      headers: {"Content-Type": "application/json"},
      body: email,
    );
    return APIResult.fromJson(json.decode(res.body));
  }

  /// Verify
  Future<APIResult> verify(String token) async {
    var res = await http.post(
      Uri.parse('${State.endPoint}/API/v1/Authentication/Verify'),
      headers: {"Content-Type": "application/json"},
      body: token,
    );
    return APIResult.fromJson(json.decode(res.body));
  }

  /// Whether the user is signed in
  bool isSignedIn() {
    return State.jwt?.isNotEmpty ?? false;
  }

  /// Get current signed in user
  User? getCurrentUser() {
    return State.user;
  }

  /// Signout user by clearing session
  void signOut() async {
    await State.clearSession();
    await http.get(
      Uri.parse('${State.endPoint}/API/v1/Authentication/Logout'),
      headers: Headers.getHeaders(),
    );
  }
}

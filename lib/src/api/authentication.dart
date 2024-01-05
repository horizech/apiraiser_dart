import 'dart:convert';

import 'package:apiraiser/constants.dart';
import 'package:apiraiser/src/api/rest.dart';
import 'package:apiraiser/src/models/rest_params.dart';
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
    dynamic res = await Rest.post(
      RestParams(
        "/API/${Constants.version}/Authentication/Login",
        data: jsonEncode(loginData),
      ),
    );
    return await State.processAuthenticationResult(
      APIResult.fromJson(res),
    );
  }

  /// Signup
  Future<APIResult> signup(SignupRequest signupRequest) async {
    Map<String, dynamic> signupData = signupRequest.toJson(signupRequest);

    var res = await Rest.post(
      RestParams(
        "/API/${Constants.version}/Authentication/Signup",
        data: jsonEncode(signupData),
      ),
    );
    return await State.processAuthenticationResult(APIResult.fromJson(res));
  }

  /// Load last session
  Future<APIResult> loadSessionUsingJwt(String? jwt) async {
    try {
      if (jwt != null && jwt.isNotEmpty) {
        State.jwt = jwt;
        var res = await Rest.get(
          RestParams(
            "/API/${Constants.version}/Authentication/LoadSessionUsingJwt",
          ),
        );
        return await State.processAuthenticationResult(APIResult.fromJson(res),
            jwt: jwt);
      } else {
        return APIResult(
          success: false,
          data: null,
          message: 'Please provide JWT token!',
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  /// Refresh token
  Future<APIResult> refreshToken(String jwt) async {
    if (jwt.isNotEmpty) {
      var res = await Rest.get(
        RestParams(
          "/API/${Constants.version}/Authentication/RefreshToken",
        ),
      );
      return await State.processAuthenticationResult(
        APIResult.fromJson(res),
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
    var res = await Rest.post(RestParams(
      '/API/${Constants.version}/Authentication/ResetPassword',
      data: jsonEncode(data),
    ));
    return APIResult.fromJson(res);
  }

  /// Forgot Password
  Future<APIResult> forgotPassword(String email) async {
    var res = await Rest.post(RestParams(
      '/API/${Constants.version}/Authentication/ForgotPassword',
      data: jsonEncode(email),
    ));
    return APIResult.fromJson(res);
  }

  /// Verify
  Future<APIResult> verify(String token) async {
    var res = await Rest.post(RestParams(
      '/API/${Constants.version}/Authentication/Verify',
      data: jsonEncode(token),
    ));
    return APIResult.fromJson(res);
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
    await Rest.get(
      RestParams('/API/${Constants.version}/Authentication/Logout'),
    );
  }
}

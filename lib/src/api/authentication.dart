import 'dart:async';
import 'dart:convert';
import 'package:apiraiser/apiraiser.dart';
import 'package:apiraiser/constants.dart';
import 'package:apiraiser/src/helpers/rest.dart';
import 'package:apiraiser/src/models/rest_params.dart';
import 'package:apiraiser/src/helpers/state.dart';

/// Authentication APIs
class Authentication {
  Timer? _timer;
  Future<APIResult> loadPreviousSession() async {
    await State.loadSessionFromSecureStorage();
    APIResult result = await Apiraiser.authentication
        .loadSessionUsingJwt(accessToken: State.accessToken);
    if (!result.success) {
      return await Apiraiser.authentication.refreshToken(
          accessToken: State.accessToken, refreshToken: State.refreshToken);
    } else {
      return result;
    }
  }

  /// Start Refresh Token Timer
  startRefreshTokenTimer() {
    _timer = Timer.periodic(const Duration(minutes: 5), (timer) async {
      print("Timer is running");
      await State.loadSessionFromSecureStorage();
      await Apiraiser.authentication.refreshToken(
          accessToken: State.accessToken, refreshToken: State.refreshToken);
    });
  }

  /// Stop Refresh Token Timer
  stopRefreshTokenTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
  }

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
  Future<APIResult> loadSessionUsingJwt({String? accessToken}) async {
    try {
      if (accessToken != null) {
        var res = await Rest.get(
            RestParams(
              "/API/${Constants.version}/Authentication/LoadSessionUsingJwt",
            ),
            jwt: accessToken);
        return await State.processAuthenticationResult(APIResult.fromJson(res));
      } else {
        var res = await Rest.get(
          RestParams(
            "/API/${Constants.version}/Authentication/LoadSessionUsingJwt",
          ),
        );
        return await State.processAuthenticationResult(APIResult.fromJson(res));
      }
    } catch (e) {
      return APIResult(message: e.toString());
    }
  }

  /// Refresh token
  Future<APIResult> refreshToken(
      {String? accessToken, String? refreshToken}) async {
    try {
      Map<String, dynamic> data = {};
      if (accessToken != null && refreshToken != null) {
        data = {"AccessToken": accessToken, "RefreshToken": refreshToken};
      }
      var res = await Rest.post(
        RestParams(
          "/API/${Constants.version}/Authentication/RefreshToken",
          data: jsonEncode(data),
        ),
      );
      return await State.processAuthenticationResult(APIResult.fromJson(res));
    } catch (e) {
      return APIResult.error(e.toString());
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
    return State.accessToken?.isNotEmpty ?? false;
  }

  /// Get current signed in user
  User? getCurrentUser() {
    return State.user;
  }

  /// Signout user by clearing session
  void signOut() async {
    stopRefreshTokenTimer();
    State.clearSession();
    await Rest.get(
      RestParams('/API/${Constants.version}/Authentication/Logout'),
    );
  }
}

import 'dart:async';
import 'dart:convert';
import 'package:apiraiser/apiraiser.dart';
import 'package:apiraiser/constants.dart';
import 'package:apiraiser/src/helpers/rest.dart';
import 'package:apiraiser/src/models/rest_params.dart';
import 'package:apiraiser/src/helpers/state.dart';

/// Authentication APIs
class AuthenticationProvider {
  static const String apiraiser = Constants.apiraiser;
  static const String version = Constants.version;
  static const String provider = Constants.provider;

  Timer? _timer;
  Future<APIResult> loadPreviousSession() async {
    await State.loadSessionFromSecureStorage();
    APIResult result = await Apiraiser.provider.authentication
        .loadSessionUsingJwt(accessToken: State.accessToken);
    if (!result.success) {
      return await Apiraiser.provider.authentication.refreshToken(
          accessToken: State.accessToken, refreshToken: State.refreshToken);
    } else {
      return result;
    }
  }

  /// Resume last session
  Future<void> resumeLastSession() async {
    final result = await Rest.get(RestParams(
      '/$apiraiser/$version/$provider/Authentication/ResumeLastSession',
    ));
    await State.processAuthenticationResult(result);
  }

  /// Start Refresh Token Timer
  startRefreshTokenTimer() {
    _timer = Timer.periodic(const Duration(minutes: 5), (timer) async {
      await State.loadSessionFromSecureStorage();
      await Apiraiser.provider.authentication.refreshToken(
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
        "/$apiraiser/$version/$provider/Authentication/Login",
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
        "/$apiraiser/$version/$provider/Authentication/Signup",
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
              "/$apiraiser/$version/$provider/Authentication/LoadSessionUsingJwt",
            ),
            jwt: accessToken);
        return await State.processAuthenticationResult(APIResult.fromJson(res));
      } else {
        var res = await Rest.get(
          RestParams(
            "/$apiraiser/$version/$provider/Authentication/LoadSessionUsingJwt",
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
          "/$apiraiser/$version/$provider/Authentication/RefreshToken",
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
      '/$apiraiser/$version/$provider/Authentication/ResetPassword',
      data: jsonEncode(data),
    ));
    return APIResult.fromJson(res);
  }

  // Reset Email
  Future<APIResult> resetEmail(
      String token, String email, String confirmEmail) async {
    Map<String, dynamic> data = {
      "Token": token,
      "Email": email,
      "ConfirmEmail": confirmEmail,
    };
    var res = await Rest.post(RestParams(
      '/$apiraiser/$version/$provider/Authentication/ResetEmail',
      data: jsonEncode(data),
    ));
    return APIResult.fromJson(res);
  }

  /// Forgot Password
  Future<APIResult> forgotPassword(String email) async {
    var res = await Rest.post(RestParams(
      '/$apiraiser/$version/$provider/Authentication/ForgotPassword',
      data: jsonEncode(email),
    ));
    return APIResult.fromJson(res);
  }

  /// Change Email
  Future<APIResult> changeEmail(String email) async {
    final result = await Rest.post(RestParams(
      '/$apiraiser/$version/$provider/Authentication/ChangeEmail',
      data: email,
    ));
    return result;
  }

  /// Verify
  Future<APIResult> verify(String token) async {
    var res = await Rest.post(RestParams(
      '/$apiraiser/$version/$provider/Authentication/Verify',
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
      RestParams('/$apiraiser/$version/$provider/Authentication/Logout'),
    );
  }

  /// Get User Profile
  Future<dynamic> getUserProfile(String email) async {
    final result = await Rest.get(
      RestParams(
        '/$apiraiser/$version/$provider/Authentication/GetUserProfile',
      ),
    );
    return result;
  }

  /// Get Plugins
  Future<dynamic> getPlugins(String email) async {
    final result = await Rest.get(
      RestParams(
        '/$apiraiser/$version/$provider/Authentication/GetPlugins',
      ),
    );
    return result;
  }
}

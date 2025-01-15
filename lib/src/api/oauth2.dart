import 'package:apiraiser/constants.dart';
import 'package:apiraiser/src/helpers/rest.dart';
import 'package:apiraiser/src/interfaces/oauth2_authorization_request.dart';
import 'package:apiraiser/src/models/api_result.dart';
import 'package:apiraiser/src/models/rest_params.dart';

/// OAuth2 APIs
class OAuth2 {
  static const String apiraiser = Constants.apiraiser;
  static const String version = Constants.version;

  /// Refresh token
  Future<APIResult> getData(String scopes) async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/OAuth2/GetUserScopes?scopes=$scopes',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get supported claims
  Future<APIResult> getSupportedClaims() async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/OAuth2/GetSupportedClaims',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get OpenID Configuration
  Future<APIResult> getOpenIdConfiguration() async {
    try {
      var res = await Rest.get(
        RestParams(
          '/.well-known/openid-configuration',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Logout
  Future<APIResult> logout() async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/OAuth2/Logout',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Refresh token
  Future<APIResult> refreshToken(String refreshToken) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/OAuth2/RefreshToken',
          data: refreshToken,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Authorize
  Future<APIResult> authorize(OAuth2AuthorizationRequest request) async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/OAuth2/Authorize?client_id=${request.clientId}&redirect_uri=${request.redirectUri}&scope=${request.scope}&response_type=${request.responseType}&state=${request.state}&access_type=${request.accessType}',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Login
  Future<APIResult> login(OAuth2AuthorizationRequest request) async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/OAuth2/Login?client_id=${request.clientId}&redirect_uri=${request.redirectUri}&scope=${request.scope}&response_type=${request.responseType}&state=${request.state}&access_type=${request.accessType}',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Signup
  Future<APIResult> signup(OAuth2AuthorizationRequest request) async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/OAuth2/Signup?client_id=${request.clientId}&redirect_uri=${request.redirectUri}&scope=${request.scope}&response_type=${request.responseType}&state=${request.state}&access_type=${request.accessType}',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Consent
  Future<APIResult> consent(OAuth2AuthorizationRequest request) async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/OAuth2/Consent?client_id=${request.clientId}&redirect_uri=${request.redirectUri}&scope=${request.scope}&response_type=${request.responseType}&state=${request.state}&access_type=${request.accessType}',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Authenticate
  Future<APIResult> authenticate(OAuth2AuthorizationRequest request) async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/OAuth2/Authenticate?client_id=${request.clientId}&redirect_uri=${request.redirectUri}&scope=${request.scope}&response_type=${request.responseType}&state=${request.state}&access_type=${request.accessType}',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Token
  Future<APIResult> token(OAuth2AuthorizationRequest request) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/OAuth2/Token',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get UserInfo
  Future<APIResult> getUserInfo(OAuth2AuthorizationRequest request) async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/OAuth2/UserInfo',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }
}

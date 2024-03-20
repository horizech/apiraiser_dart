import 'dart:convert';

import 'package:apiraiser/constants.dart';
import 'package:apiraiser/src/helpers/rest.dart';
import 'package:apiraiser/src/models/oauth2_authentication_request.dart';
import 'package:apiraiser/src/models/oauth2_authorize_request.dart';
import 'package:apiraiser/src/models/oauth2_token_request.dart';
import 'package:apiraiser/src/models/api_result.dart';
import 'package:apiraiser/src/models/rest_params.dart';

/// OAuth2 APIs
class OAuth2 {
  /// Logout
  Future<APIResult> logout() async {
    var res = await Rest.get(
      RestParams('/API/${Constants.version}/OAuth2/Logout'),
    );
    return APIResult.fromJson(res);
  }

  /// Refresh token
  Future<APIResult> refreshToken(String token) async {
    var res = await Rest.get(
      RestParams('/API/${Constants.version}/OAuth2/Logout'),
    );
    return APIResult.fromJson(res);
  }

  /// Authorize
  Future<APIResult> authorize(OAuth2AuthorizeRequest request) async {
    var res = await Rest.get(
      RestParams(
          '/API/${Constants.version}/OAuth2/Authorize?client_id=${request.clientId}&redirect_uri=${request.redirectUri}&scope=${request.scope}&response_type=${request.responseType}&state=${request.state}&access_type=${request.accessType}'),
    );
    return APIResult.fromJson(res);
  }

  /// Login
  Future<APIResult> login(OAuth2AuthorizeRequest request) async {
    var res = await Rest.get(
      RestParams(
          '/API/${Constants.version}/OAuth2/Login?client_id=${request.clientId}&redirect_uri=${request.redirectUri}&scope=${request.scope}&response_type=${request.responseType}&state=${request.state}&access_type=${request.accessType}'),
    );
    return APIResult.fromJson(res);
  }

  /// Signup
  Future<APIResult> signup(OAuth2AuthorizeRequest request) async {
    var res = await Rest.get(
      RestParams(
          '/API/${Constants.version}/OAuth2/Signup?client_id=${request.clientId}&redirect_uri=${request.redirectUri}&scope=${request.scope}&response_type=${request.responseType}&state=${request.state}&access_type=${request.accessType}'),
    );
    return APIResult.fromJson(res);
  }

  /// Consent
  Future<APIResult> consent(OAuth2AuthenticateRequest request) async {
    var res = await Rest.get(
      RestParams(
          '/API/${Constants.version}/OAuth2/Consent?client_id=${request.clientId}&redirect_uri=${request.redirectUri}&scope=${request.scope}&response_type=${request.responseType}&state=${request.state}&access_type=${request.accessType}&request_token=${request.requestToken}'),
    );
    return APIResult.fromJson(res);
  }

  /// Authenticate
  Future<APIResult> authenticate(OAuth2AuthenticateRequest request) async {
    var res = await Rest.get(
      RestParams(
          '/API/${Constants.version}/OAuth2/Authenticate?client_id=${request.clientId}&redirect_uri=${request.redirectUri}&scope=${request.scope}&response_type=${request.responseType}&state=${request.state}&access_type=${request.accessType}&request_token=${request.requestToken}'),
    );
    return APIResult.fromJson(res);
  }

  /// Token
  Future<APIResult> token(OAuth2TokenRequest request) async {
    var res = await Rest.post(RestParams(
      '/API/${Constants.version}/OAuth2/Token',
      data: jsonEncode(request),
    ));
    return APIResult.fromJson(res);
  }

  /// Get UserInfo
  Future<APIResult> getUserInfo() async {
    var res = await Rest.get(
      RestParams('/API/${Constants.version}/OAuth2/UserInfo'),
    );
    return APIResult.fromJson(res);
  }

  /// Add a client
  Future<APIResult> addClient(String name, String displayname) async {
    Map<String, dynamic> data = {"Name": name, "DisplayName": displayname};
    var res = await Rest.post(RestParams(
      '/API/${Constants.version}/OAuth2/Client',
      data: jsonEncode(data),
    ));
    return APIResult.fromJson(res);
  }

  /// Get client
  Future<APIResult> getClient(String clientId) async {
    var res = await Rest.get(
      RestParams('/API/${Constants.version}/OAuth2/Client?client_id=$clientId'),
    );
    return APIResult.fromJson(res);
  }

  /// Update client
  Future<APIResult> updateClient(
      String clientId, String name, String displayname) async {
    Map<String, dynamic> data = {"Name": name, "DisplayName": displayname};
    var res = await Rest.put(RestParams(
        '/API/${Constants.version}/OAuth2/Client?client_id=$clientId',
        data: data));
    return APIResult.fromJson(res);
  }

  /// Delete client
  Future<APIResult> deleteClient(String clientId) async {
    var res = await Rest.delete(
      RestParams('/API/${Constants.version}/OAuth2/Client?client_id=$clientId'),
    );
    return APIResult.fromJson(res);
  }
}

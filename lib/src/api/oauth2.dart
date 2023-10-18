import 'dart:convert';
import 'package:apiraiser/src/helpers/headers.dart';
import 'package:apiraiser/src/models/oauth2_authentication_request.dart';
import 'package:apiraiser/src/models/oauth2_authorize_request.dart';
import 'package:apiraiser/src/models/oauth2_token_request.dart';
import 'package:http/http.dart' as http;

import 'package:apiraiser/src/helpers/state.dart';
import 'package:apiraiser/src/models/api_result.dart';

/// OAuth2 APIs
class OAuth2 {
  /// Logout
  Future<APIResult> logout() async {
    var res = await http.get(
      Uri.parse('${State.endPoint}/OAuth2/Logout'),
      headers: Headers.getHeaders(),
    );
    return APIResult.fromJson(json.decode(res.body));
  }

  /// Authorize
  Future<APIResult> authorize(OAuth2AuthorizeRequest request) async {
    var res = await http.get(
      Uri.parse(
          '${State.endPoint}/OAuth2/Authorize?client_id=${request.clientId}&redirect_uri=${request.redirectUri}&scope=${request.scope}&response_type=${request.responseType}&state=${request.state}&access_type=${request.accessType}'),
      headers: Headers.getHeaders(),
    );
    return APIResult.fromJson(json.decode(res.body));
  }

  /// Login
  Future<APIResult> login(OAuth2AuthorizeRequest request) async {
    var res = await http.get(
      Uri.parse(
          '${State.endPoint}/OAuth2/Login?client_id=${request.clientId}&redirect_uri=${request.redirectUri}&scope=${request.scope}&response_type=${request.responseType}&state=${request.state}&access_type=${request.accessType}'),
      headers: Headers.getHeaders(),
    );
    return APIResult.fromJson(json.decode(res.body));
  }

  /// Signup
  Future<APIResult> signup(OAuth2AuthorizeRequest request) async {
    var res = await http.get(
      Uri.parse(
          '${State.endPoint}/OAuth2/Signup?client_id=${request.clientId}&redirect_uri=${request.redirectUri}&scope=${request.scope}&response_type=${request.responseType}&state=${request.state}&access_type=${request.accessType}'),
      headers: Headers.getHeaders(),
    );
    return APIResult.fromJson(json.decode(res.body));
  }

  /// Consent
  Future<APIResult> consent(OAuth2AuthenticateRequest request) async {
    var res = await http.get(
      Uri.parse(
          '${State.endPoint}/OAuth2/Consent?client_id=${request.clientId}&redirect_uri=${request.redirectUri}&scope=${request.scope}&response_type=${request.responseType}&state=${request.state}&access_type=${request.accessType}&request_token=${request.requestToken}'),
      headers: Headers.getHeaders(),
    );
    return APIResult.fromJson(json.decode(res.body));
  }

  /// Authenticate
  Future<APIResult> authenticate(OAuth2AuthenticateRequest request) async {
    var res = await http.get(
      Uri.parse(
          '${State.endPoint}/OAuth2/Authenticate?client_id=${request.clientId}&redirect_uri=${request.redirectUri}&scope=${request.scope}&response_type=${request.responseType}&state=${request.state}&access_type=${request.accessType}&request_token=${request.requestToken}'),
      headers: Headers.getHeaders(),
    );
    return APIResult.fromJson(json.decode(res.body));
  }

  /// Token
  Future<APIResult> token(OAuth2TokenRequest request) async {
    var res = await http.post(
      Uri.parse('${State.endPoint}/OAuth2/Token'),
      headers: Headers.getHeaders(),
      body: jsonEncode(request),
    );
    return APIResult.fromJson(json.decode(res.body));
  }

  /// Get UserInfo
  Future<APIResult> getUserInfo() async {
    var res = await http.get(
      Uri.parse('${State.endPoint}/OAuth2/UserInfo'),
      headers: Headers.getHeaders(),
    );
    return APIResult.fromJson(json.decode(res.body));
  }

  /// Add a client
  Future<APIResult> addClient(String name, String displayname) async {
    Map<String, dynamic> data = {"Name": name, "DisplayName": displayname};
    var res = await http.post(
      Uri.parse('${State.endPoint}/OAuth2/Client'),
      headers: Headers.getHeaders(),
      body: jsonEncode(data),
    );
    return APIResult.fromJson(json.decode(res.body));
  }

  /// Get client
  Future<APIResult> getClient(String clientId) async {
    var res = await http.get(
      Uri.parse('${State.endPoint}/OAuth2/Client?client_id=$clientId'),
      headers: Headers.getHeaders(),
    );
    return APIResult.fromJson(json.decode(res.body));
  }

  /// Update client
  Future<APIResult> updateClient(
      String clientId, String name, String displayname) async {
    Map<String, dynamic> data = {"Name": name, "DisplayName": displayname};
    var res = await http.put(
        Uri.parse('${State.endPoint}/OAuth2/Client?client_id=$clientId'),
        headers: Headers.getHeaders(),
        body: jsonEncode(data));
    return APIResult.fromJson(json.decode(res.body));
  }

  /// Delete client
  Future<APIResult> deleteClient(String clientId) async {
    var res = await http.delete(
      Uri.parse('${State.endPoint}/OAuth2/Client?client_id=$clientId'),
      headers: Headers.getHeaders(),
    );
    return APIResult.fromJson(json.decode(res.body));
  }
}

import 'package:apiraiser/apiraiser.dart';
import 'package:apiraiser/constants.dart';
import 'package:apiraiser/src/helpers/rest.dart';
import 'package:apiraiser/src/interfaces/client_request.dart';
import 'package:apiraiser/src/models/rest_params.dart';

/// OAuthLink Plugin APIs
class OAuthLinkPlugin {
  static const String apiraiser = Constants.apiraiser;
  static const String version = Constants.version;
  static const String plugin = Constants.plugin;

  /// Get Client
  Future<APIResult> getClient(String clientId) async {
    try {
      var res = await Rest.get(
        RestParams('/$apiraiser/$version/$plugin/OAuthLink/Client/$clientId'),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Add Client
  Future<APIResult> getUsers(ClientRequest request) async {
    try {
      var res = await Rest.post(
        RestParams('/$apiraiser/$version/$plugin/OAuthLink/Client'),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Update Client
  Future<APIResult> updateClient(String clientId, ClientRequest request) async {
    try {
      var res = await Rest.put(
        RestParams('/$apiraiser/$version/$plugin/OAuthLink/Client/$clientId'),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Delete Client
  Future<APIResult> deleteClient(String clientId) async {
    try {
      var res = await Rest.delete(
        RestParams(
          '/$apiraiser/$version/$plugin/OAuthLink/Client/$clientId',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get Clients
  Future<APIResult> getClients(
      {pageSize = -1, page = -1, filtertext = ''}) async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/$plugin/OAuthLink/Clients?pageSize=$pageSize&page=$page${filtertext != null ? '&filtertext=${Uri.encodeComponent(filtertext)}' : ''}',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get Scopes
  Future<APIResult> getScopes(
      {pageSize = -1, page = -1, filtertext = ''}) async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/$plugin/OAuthLink/Scopes?pageSize=$pageSize&page=$page${filtertext != null ? '&filtertext=${Uri.encodeComponent(filtertext)}' : ''}',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get Scope by id
  Future<APIResult> getScopeById(String id) async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/$plugin/OAuthLink/Scope/$id',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Add Scope
  Future<APIResult> addScope(dynamic request) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/$plugin/OAuthLink/Scope',
          data: request,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Update Scope
  Future<APIResult> updateScope(String scope, dynamic request) async {
    try {
      var res = await Rest.put(
        RestParams(
          '/$apiraiser/$version/$plugin/OAuthLink/Scope/$scope',
          data: request,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Delete Scope
  Future<APIResult> deleteScope(String scope) async {
    try {
      var res = await Rest.delete(
        RestParams(
          '/$apiraiser/$version/$plugin/OAuthLink/Scope/$scope',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get Policies
  Future<APIResult> getPolicies() async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/$plugin/OAuthLink/Policies',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get Policy Attribute Types
  Future<APIResult> getPolicyAttributeTypes() async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/$plugin/OAuthLink/PolicyAttributeTypes',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get Policy Attribute
  Future<APIResult> getPolicyAttributes(
      List<QuerySearchItem> conditions) async {
    try {
      var res = await Rest.post(
        RestParams('/$apiraiser/$version/$plugin/OAuthLink/GetPolicyAttributes',
            data: conditions),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get Settings
  Future<APIResult> getSettings() async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/$plugin/OAuthLink/Settings',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Update Settings
  Future<APIResult> updateSettings(dynamic data) async {
    try {
      var res = await Rest.put(
        RestParams(
          '/$apiraiser/$version/$plugin/OAuthLink/Settings',
          data: data,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }
}

import 'package:apiraiser/constants.dart';
import 'package:apiraiser/src/helpers/rest.dart';
import 'package:apiraiser/src/interfaces/identity_user.dart';
import 'package:apiraiser/src/models/rest_params.dart';
import 'package:apiraiser/src/models/api_result.dart';

/// Identity APIs
class IdentityPlugin {
  static const String apiraiser = Constants.apiraiser;
  static const String version = Constants.version;
  static const String plugin = Constants.plugin;

  /// Get Roles
  Future<APIResult> getRoles({pageSize = -1, page = -1}) async {
    try {
      var res = await Rest.get(
        RestParams(
            '/$apiraiser/$version/$plugin/Identity/Roles?pageSize=$pageSize&page=$page'),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get Users
  Future<APIResult> getUsers(
      {pageSize = -1, page = -1, filtertext = ''}) async {
    try {
      var res = await Rest.get(
        RestParams(
            '/$apiraiser/$version/$plugin/Identity/Users?pageSize=$pageSize&page=$page${filtertext != null ? '&filtertext=${Uri.encodeComponent(filtertext)}' : ''}'),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get User by id
  Future<APIResult> getUserById(String id) async {
    try {
      var res = await Rest.get(
        RestParams('/$apiraiser/$version/$plugin/Identity/User/$id'),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Create user
  Future<APIResult> createUser(IdentityUser user) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/$plugin/Identity/User',
          data: user,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Update user
  Future<APIResult> updateuser(IdentityUser user) async {
    try {
      var res = await Rest.put(
        RestParams(
          '/$apiraiser/$version/$plugin/Identity/User',
          data: user,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Delete user
  Future<APIResult> deleteUser(String id) async {
    try {
      var res = await Rest.delete(
        RestParams(
          '/$apiraiser/$version/$plugin/Identity/User/$id',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Insert a role
  Future<APIResult> insertRole(Object data) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/$plugin/Identity/Role',
          data: data,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Update a role
  Future<APIResult> updateRole(String id, Object data) async {
    try {
      var res = await Rest.put(
        RestParams(
          '/$apiraiser/$version/$plugin/Identity/Role/$id',
          data: data,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }
}

import 'dart:convert';
import 'package:apiraiser/constants.dart';
import 'package:apiraiser/src/api/rest.dart';
import 'package:apiraiser/src/models/rest_params.dart';
import 'package:apiraiser/src/models/user.dart';
import 'package:apiraiser/src/models/api_result.dart';

/// Users APIs
class Users {
  /// Get user roles by [userId]
  Future<APIResult> getUserRoles(String userId) async {
    var res = await Rest.get(
      RestParams('/API/${Constants.version}/Users/GetUserRoles/$userId'),
    );
    return APIResult.fromJson(res);
  }

  /// Get user by [id]
  Future<APIResult> get(String id) async {
    var res = await Rest.get(
      RestParams('/API/${Constants.version}/Users/GetUser/$id'),
    );
    return APIResult.fromJson(res);
  }

  /// Get user by [role]
  Future<APIResult> getUserByRole(String role) async {
    var res = await Rest.get(
      RestParams('/API/${Constants.version}/Users/GetUserByRole/$role'),
    );
    return APIResult.fromJson(res);
  }

  /// Get all users
  Future<APIResult> getAll() async {
    var res = await Rest.get(
      RestParams('/API/${Constants.version}/Users/GetUsers'),
    );
    return APIResult.fromJson(res);
  }

  /// Check if username is available
  Future<APIResult> isUsernameAvailable(String username) async {
    var res = await Rest.get(
      RestParams(
          '/API/${Constants.version}/Users/IsUsernameAvailable/$username'),
    );
    return APIResult.fromJson(res);
  }

  /// Check if email is available
  Future<APIResult> isEmailAvailable(String email) async {
    var res = await Rest.get(
      RestParams('/API/${Constants.version}/Users/IsEmailAvailable/$email'),
    );
    return APIResult.fromJson(res);
  }

  /// Add a new user
  Future<APIResult> add(User user) async {
    Map<String, dynamic> data = {
      "Username": user.username,
      "Fullname": user.fullname,
      "Email": user.email,
      "Password": user.password,
      "Role": user.roleIds != null && user.roleIds!.isNotEmpty
          ? jsonEncode(user.roleIds)
          : null,
    };
    try {
      var res = await Rest.post(
        RestParams(
          '/API/${Constants.version}/Users/AddUser',
          data: jsonEncode(data),
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Update user by [id]
  Future<APIResult> update(String id, User user) async {
    try {
      Map<String, dynamic> data = {};

      if (user.fullname.isNotEmpty) {
        data["Fullname"] = user.fullname;
      }
      if (user.username.isNotEmpty) {
        data["Username"] = user.username;
      }
      if (user.email.isNotEmpty) {
        data["Email"] = user.email;
      }
      if (user.password != null && user.password!.isNotEmpty) {
        data["Password"] = user.password!;
      }
      if (user.roleIds != null && user.roleIds!.isNotEmpty) {
        data["Role"] = jsonEncode(user.roleIds!);
      }
      var res = await Rest.put(
        RestParams(
          '/API/${Constants.version}/Users/UpdateUser?Id=$id',
          data: jsonEncode(data),
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Delete user by [id]
  Future<APIResult> delete(String id) async {
    try {
      var res = await Rest.delete(
        RestParams('/API/${Constants.version}/Users/DeleteUser?Id=$id'),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }
}

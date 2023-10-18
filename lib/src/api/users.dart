import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:apiraiser/src/helpers/state.dart';
import 'package:apiraiser/src/helpers/headers.dart';
import 'package:apiraiser/src/models/user.dart';
import 'package:apiraiser/src/models/api_result.dart';

/// Users APIs
class Users {
  /// Get user roles by [userId]
  Future<APIResult> getUserRoles(String userId) async {
    var res = await http.get(
        Uri.parse('${State.endPoint}/API/Users/GetUserRoles/$userId'),
        headers: Headers.getHeaders());
    return APIResult.fromJson(json.decode(res.body));
  }

  /// Get user by [id]
  Future<APIResult> get(String id) async {
    var res = await http.get(
        Uri.parse('${State.endPoint}/API/Users/GetUser/$id'),
        headers: Headers.getHeaders());
    return APIResult.fromJson(json.decode(res.body));
  }

  /// Get all users
  Future<APIResult> getAll() async {
    var res = await http.get(Uri.parse('${State.endPoint}/API/Users/GetUsers'),
        headers: Headers.getHeaders());
    return APIResult.fromJson(json.decode(res.body));
  }

  /// Check if username is available
  Future<APIResult> isUsernameAvailable(String username) async {
    var res = await http.get(
        Uri.parse('${State.endPoint}/API/Users/IsUsernameAvailable/$username'),
        headers: Headers.getHeaders());
    return APIResult.fromJson(json.decode(res.body));
  }

  /// Check if email is available
  Future<APIResult> isEmailAvailable(String email) async {
    var res = await http.get(
        Uri.parse('${State.endPoint}/API/Users/IsEmailAvailable/$email'),
        headers: Headers.getHeaders());
    return APIResult.fromJson(json.decode(res.body));
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
      var res = await http.post(
        Uri.parse('${State.endPoint}/API/Users/AddUser'),
        headers: Headers.getHeaders(),
        body: jsonEncode(data),
      );
      return APIResult.fromJson(json.decode(res.body));
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
      var res = await http.put(
        Uri.parse('${State.endPoint}/API/Users/UpdateUser?Id=$id'),
        headers: Headers.getHeaders(),
        body: jsonEncode(data),
      );
      return APIResult.fromJson(json.decode(res.body));
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Delete user by [id]
  Future<APIResult> delete(String id) async {
    try {
      var res = await http.delete(
          Uri.parse('${State.endPoint}/API/Users/DeleteUser?Id=$id'),
          headers: Headers.getHeaders());
      return APIResult.fromJson(json.decode(res.body));
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }
}

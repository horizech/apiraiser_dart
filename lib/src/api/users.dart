import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:apiraiser/src/helpers/state.dart';
import 'package:apiraiser/src/helpers/headers.dart';
import 'package:apiraiser/src/models/user.dart';
import 'package:apiraiser/src/models/api_result.dart';

/// Users APIs
class Users {
  /// Get user roles by [userId]
  Future<APIResult> getUserRoles(int userId) async {
    var res = await http.get(
        Uri.parse('${State.endPoint}/API/Users/GetUserRoles/$userId'),
        headers: Headers.getHeaders());
    return APIResult.fromJson(json.decode(res.body));
  }

  /// Get user by [id]
  Future<APIResult> get(int id) async {
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

  /// Add a new user
  Future<APIResult> add(User user) async {
    Map<String, dynamic> data = {
      "Username": user.username,
      "Fullname": user.fullname,
      "Email": user.email,
      "Password": user.password,
      "Role": jsonEncode(user.roleIds),
    };
    try {
      var res = await http.post(
        Uri.parse('${State.endPoint}API/Users/AddUser'),
        headers: Headers.getHeaders(),
        body: jsonEncode(data),
      );
      return APIResult.fromJson(json.decode(res.body));
    } catch (e) {
      rethrow;
    }
  }

  /// Update user by [id]
  Future<APIResult> update(int id, User user) async {
    Map<String, dynamic> data = {
      "Username": user.username,
      "Fullname": user.fullname,
      "Email": user.email,
      "Password": user.password,
      "Role": jsonEncode(user.roleIds),
    };
    var res = await http.put(
      Uri.parse('${State.endPoint}/API/Users/UpdateUser?Id=$id'),
      headers: Headers.getHeaders(),
      body: jsonEncode(data),
    );
    return APIResult.fromJson(json.decode(res.body));
  }

  /// Delete user by [id]
  Future<APIResult> delete(int id) async {
    try {
      var res = await http.delete(
          Uri.parse('${State.endPoint}API/Users/DeleteUser?Id=$id'),
          headers: Headers.getHeaders());
      return APIResult.fromJson(json.decode(res.body));
    } catch (e) {
      rethrow;
    }
  }
}

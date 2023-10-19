import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:apiraiser/src/helpers/state.dart';
import 'package:apiraiser/src/helpers/headers.dart';
import 'package:apiraiser/src/models/api_result.dart';

/// Feature APIs
class Feature {
  /// Install a new Feature
  Future<APIResult> install(String feature) async {
    try {
      var res = await http.post(
        Uri.parse('${State.endPoint}/API/v1/Feature/Install?feature=$feature'),
        headers: Headers.getHeaders(),
      );
      return APIResult.fromJson(json.decode(res.body));
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get Features List
  Future<APIResult> getList() async {
    try {
      var res = await http.get(
        Uri.parse('${State.endPoint}/API/v1/Feature/GetList'),
        headers: Headers.getHeaders(),
      );
      return APIResult.fromJson(json.decode(res.body));
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Delete a new Feature
  Future<APIResult> delete(String feature) async {
    try {
      var res = await http.delete(
        Uri.parse('${State.endPoint}/API/v1/Feature/Delete?feature=$feature'),
        headers: Headers.getHeaders(),
      );
      return APIResult.fromJson(json.decode(res.body));
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }
}

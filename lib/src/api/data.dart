import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:apiraiser/src/models/api_result.dart';
import 'package:apiraiser/src/models/query_search_item.dart';
import 'package:apiraiser/src/helpers/headers.dart';
import 'package:apiraiser/src/helpers/state.dart';

/// Data APIs
class Data {
  /// Get table rows
  Future<APIResult> get(String table, int limit) async {
    try {
      var res = await http.get(
          Uri.parse(
              '${State.endPoint}/API/v1/table/$table${limit > 0 ? '?limit=$limit' : ''}'),
          headers: Headers.getHeaders());
      return APIResult.fromJson(json.decode(res.body));
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Insert a new row
  Future<APIResult> insert(String table, Map<String, dynamic> data) async {
    try {
      var res = await http.post(
        Uri.parse('${State.endPoint}/API/v1/table/$table'),
        headers: Headers.getHeaders(),
        body: jsonEncode(data),
      );
      return APIResult.fromJson(json.decode(res.body));
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get row
  Future<APIResult> getById(String table, String id) async {
    try {
      var res = await http.get(
          Uri.parse('${State.endPoint}/API/v1/table/$table/$id'),
          headers: Headers.getHeaders());
      return APIResult.fromJson(json.decode(res.body));
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Update row
  Future<APIResult> update(
      String table, String id, Map<String, dynamic> data) async {
    try {
      var res = await http.put(
        Uri.parse('${State.endPoint}/API/v1/table/$table/$id'),
        headers: Headers.getHeaders(),
        body: jsonEncode(data),
      );
      return APIResult.fromJson(json.decode(res.body));
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Delete row
  Future<APIResult> delete(String table, String id) async {
    try {
      var res = await http.delete(
          Uri.parse('${State.endPoint}/API/v1/table/$table/$id'),
          headers: Headers.getHeaders());
      return APIResult.fromJson(json.decode(res.body));
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get row by conditions
  Future<APIResult> getByConditions(
    String table,
    List<QuerySearchItem> conditions,
  ) async {
    try {
      var res = await http.post(
        Uri.parse('${State.endPoint}/API/v1/table/$table/GetRowsByConditions'),
        headers: Headers.getHeaders(),
        body: QuerySearchItem.toJsonList(conditions),
      );
      return APIResult.fromJson(json.decode(res.body));
    } catch (e) {
      return APIResult(message: e.toString());
    }
  }

  /// Insert a list of rows
  Future<APIResult> insertList(
      String table, List<Map<String, dynamic>> data) async {
    try {
      var res = await http.post(
        Uri.parse('${State.endPoint}/API/v1/table/$table/InsertRows'),
        headers: Headers.getHeaders(),
        body: jsonEncode(data),
      );
      return APIResult.fromJson(json.decode(res.body));
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Update rows by conditions
  Future<APIResult> updateByConditions(String table,
      List<QuerySearchItem> conditions, Map<String, dynamic> data) async {
    Map<String, dynamic> dataMap = {
      "Data": data,
      "Parameters": conditions.map((e) => e.toJson(e)).toList()
    };
    try {
      var res = await http.put(
        Uri.parse('${State.endPoint}/API/v1/table/$table/UpdateRows'),
        headers: Headers.getHeaders(),
        body: jsonEncode(dataMap),
      );
      return APIResult.fromJson(json.decode(res.body));
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Delete rows by conditions
  Future<APIResult> deleteByConditions(
    String table,
    List<QuerySearchItem> conditions,
  ) async {
    try {
      var res = await http.delete(
        Uri.parse('${State.endPoint}/API/v1/table/$table/DeleteRows'),
        headers: Headers.getHeaders(),
        body: QuerySearchItem.toJsonList(conditions),
      );
      return APIResult.fromJson(json.decode(res.body));
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }
}

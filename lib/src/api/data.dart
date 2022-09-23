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
    var res = await http.get(
        Uri.parse(
            '${State.endPoint}/API/table/$table${limit > 0 ? '?limit=$limit' : ''}'),
        headers: Headers.getHeaders());
    return APIResult.fromJson(json.decode(res.body));
  }

  /// Insert a new row
  Future<APIResult> insert(String table, Map<String, dynamic> data) async {
    try {
      var res = await http.post(
        Uri.parse('${State.endPoint}/API/table/$table'),
        headers: Headers.getHeaders(),
        body: jsonEncode(data),
      );
      return APIResult.fromJson(json.decode(res.body));
    } catch (e) {
      rethrow;
    }
  }

  /// Get row
  Future<APIResult> getById(String table, int id) async {
    var res = await http.get(
        Uri.parse('${State.endPoint}/API/table/$table/$id'),
        headers: Headers.getHeaders());
    return APIResult.fromJson(json.decode(res.body));
  }

  /// Update row
  Future<APIResult> update(
      String table, int id, Map<String, dynamic> data) async {
    var res = await http.put(
      Uri.parse('${State.endPoint}/API/table/$table/$id'),
      headers: Headers.getHeaders(),
      body: jsonEncode(data),
    );
    return APIResult.fromJson(json.decode(res.body));
  }

  /// Delete row
  Future<APIResult> delete(String table, int id) async {
    try {
      var res = await http.delete(
          Uri.parse('${State.endPoint}/API/table/$table/$id'),
          headers: Headers.getHeaders());
      return APIResult.fromJson(json.decode(res.body));
    } catch (e) {
      rethrow;
    }
  }

  /// Get row by conditions
  Future<APIResult> getByConditions(
    String table,
    List<QuerySearchItem> conditions,
  ) async {
    try {
      var res = await http.post(
        Uri.parse('${State.endPoint}/API/table/$table/GetRowsByConditions'),
        headers: Headers.getHeaders(),
        body: jsonEncode(conditions),
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
        Uri.parse('${State.endPoint}/API/table/$table/InsertRows'),
        headers: Headers.getHeaders(),
        body: jsonEncode(data),
      );
      return APIResult.fromJson(json.decode(res.body));
    } catch (e) {
      rethrow;
    }
  }

  /// Delete rows by conditions
  Future<APIResult> deleteByConditions(
    String table,
    List<QuerySearchItem> conditions,
  ) async {
    try {
      var res = await http.delete(
        Uri.parse('${State.endPoint}/API/table/$table/DeleteRows'),
        headers: Headers.getHeaders(),
        body: jsonEncode(conditions),
      );
      return APIResult.fromJson(json.decode(res.body));
    } catch (e) {
      rethrow;
    }
  }
}

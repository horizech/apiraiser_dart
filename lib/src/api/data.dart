import 'package:apiraiser/src/models/api_result.dart';
import 'package:apiraiser/src/models/query_search_item.dart';

import 'package:apiraiser/src/helpers/state.dart';
import 'package:apiraiser/src/api/rest.dart';
import 'package:apiraiser/src/models/rest_params.dart';

/// Data APIs
class Data {
  /// Get table rows
  Future<APIResult> get(String table, int limit) async {
    try {
      var res = await Rest.get(
        RestParams(
          "/API/v1/table/$table",
          params: limit > 0 ? {"limit": limit} : null,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Insert a new row
  Future<APIResult> insert(String table, Map<String, dynamic> data) async {
    try {
      var res = await Rest.post(
        RestParams(
          "/API/v1/table/$table",
          data: data,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get row
  Future<APIResult> getById(String table, String id) async {
    try {
      var res = await Rest.get(
        RestParams('/API/v1/table/$table/$id'),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Update row
  Future<APIResult> update(
      String table, String id, Map<String, dynamic> data) async {
    try {
      var res = await Rest.put(
        RestParams(
          '/API/v1/table/$table/$id',
          data: data,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Delete row
  Future<APIResult> delete(String table, String id) async {
    try {
      var res = await Rest.delete(
        RestParams(
          '${State.endPoint}/API/v1/table/$table/$id',
        ),
      );
      return APIResult.fromJson(res);
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
      var res = await Rest.post(
        RestParams(
          '/API/v1/table/$table/GetRowsByConditions',
          data: QuerySearchItem.toJsonList(conditions),
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString());
    }
  }

  /// Insert a list of rows
  Future<APIResult> insertList(
      String table, List<Map<String, dynamic>> data) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/API/v1/table/$table/InsertRows',
          data: data,
        ),
      );
      return APIResult.fromJson(res);
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
      var res = await Rest.put(
        RestParams(
          '/API/v1/table/$table/UpdateRows',
          data: dataMap,
        ),
      );
      return APIResult.fromJson(res);
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
      var res = await Rest.delete(
        RestParams(
          '/API/v1/table/$table/DeleteRows',
          data: QuerySearchItem.toJsonList(conditions),
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }
}

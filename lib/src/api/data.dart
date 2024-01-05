import 'dart:convert';
import 'package:apiraiser/constants.dart';
import 'package:apiraiser/src/models/api_result.dart';
import 'package:apiraiser/src/models/query_search_item.dart';
import 'package:apiraiser/src/api/rest.dart';
import 'package:apiraiser/src/models/rest_params.dart';

/// Data APIs
class Data {
  /// Get table rows
  Future<APIResult> get(
    String table, {
    int limit = -1,
    String? orderBy,
    String? orderDescendingBy,
    String? createdBy,
    String? updatedBy,
    int offset = -1,
  }) async {
    try {
      Map<String, dynamic> params = {};
      params["limit"] = limit;
      if (offset > 0) {
        params["offset"] = offset;
      }
      if (orderBy != null && orderBy.isNotEmpty) {
        params["orderBy"] = orderBy;
      }
      if (orderDescendingBy != null && orderDescendingBy.isNotEmpty) {
        params["orderDescendingBy"] = orderDescendingBy;
      }
      if (createdBy != null && createdBy.isNotEmpty) {
        params["createdBy"] = createdBy;
      }
      if (updatedBy != null && updatedBy.isNotEmpty) {
        params["updatedBy"] = updatedBy;
      }
      var res = await Rest.get(
        RestParams(
          "/API/${Constants.version}/table/$table",
          params: params,
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
          "/API/${Constants.version}/table/$table",
          data: jsonEncode(data),
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
        RestParams('/API/${Constants.version}/table/$table/$id'),
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
          '/API/${Constants.version}/table/$table/$id',
          data: jsonEncode(data),
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
          '/API/${Constants.version}/table/$table/$id',
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
    List<QuerySearchItem> conditions, {
    int limit = -1,
    int offset = -1,
    String? orderBy,
    String? orderDescendingBy,
  }) async {
    try {
      Map<String, dynamic> params = {};
      params["limit"] = limit;
      if (orderBy != null && orderBy.isNotEmpty) {
        params["orderBy"] = orderBy;
      }
      if (offset > 0) {
        params["offset"] = offset;
      }
      if (orderDescendingBy != null && orderDescendingBy.isNotEmpty) {
        params["orderDescendingBy"] = orderDescendingBy;
      }
      var res = await Rest.post(
        RestParams(
          '/API/${Constants.version}/table/$table/GetRowsByConditions',
          params: params,
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
          '/API/${Constants.version}/table/$table/InsertRows',
          data: jsonEncode(data),
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
          '/API/${Constants.version}/table/$table/UpdateRows',
          data: jsonEncode(dataMap),
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
          '/API/${Constants.version}/table/$table/DeleteRows',
          data: QuerySearchItem.toJsonList(conditions),
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }
}

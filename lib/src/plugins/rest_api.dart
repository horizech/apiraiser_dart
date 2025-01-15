import 'package:apiraiser/apiraiser.dart';
import 'package:apiraiser/constants.dart';
import 'package:apiraiser/src/helpers/rest.dart';
import 'package:apiraiser/src/models/rest_params.dart';

/// Rest API Plugin APIs
class RestAPIPlugin {
  static const String apiraiser = Constants.apiraiser;
  static const String version = Constants.version;
  static const String plugin = Constants.plugin;

  /// Insert a new record
  Future<APIResult> insert(String collection, Object data) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/$plugin/RestAPI/$collection',
          data: data,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get record by id
  Future<APIResult> getById(String collection, String id) async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/$plugin/RestAPI/$collection/$id',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Update record by id
  Future<APIResult> update(String collection, String id, Object data) async {
    try {
      var res = await Rest.put(
        RestParams(
          '/$apiraiser/$version/$plugin/RestAPI/$collection/$id',
          data: data,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Delete record by id
  Future<APIResult> delete(String collection, String id) async {
    try {
      var res = await Rest.delete(
        RestParams(
          '/$apiraiser/$version/$plugin/RestAPI/$collection/$id',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get records by conditions
  Future<APIResult> getRecordsByConditions({
    required String collection,
    int? pageSize,
    int? page,
    String? orderBy,
    String? orderDescendingBy,
    String? groupBy,
    List<QuerySearchItem>? conditions,
  }) async {
    try {
      final baseUrl =
          '/$apiraiser/$version/$plugin/RestAPI/GetRecordsByConditions/$collection';
      final queryParams = <String, String>{};

      if (orderBy != null) queryParams['orderBy'] = orderBy;
      if (orderDescendingBy != null) {
        queryParams['orderDescendingBy'] = orderDescendingBy;
      }
      if (groupBy != null) queryParams['groupBy'] = groupBy;
      if (pageSize != null && pageSize > 0) {
        queryParams['pageSize'] = pageSize.toString();
      }
      if (page != null) queryParams['page'] = page.toString();

      final url = Uri(
        path: baseUrl,
        queryParameters: queryParams.isNotEmpty ? queryParams : null,
      ).toString();

      final res = await Rest.post(
        RestParams(
          url,
          data: conditions ?? [],
        ),
      );

      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get records
  Future<APIResult> get({
    required String collection,
    int? limit,
    int? offset,
    String? orderBy,
    String? orderDescendingBy,
    String? groupBy,
  }) async {
    try {
      final baseUrl = '/$apiraiser/$version/$plugin/RestAPI/$collection';
      final queryParams = <String, String>{};

      if (orderBy != null) queryParams['orderBy'] = orderBy;
      if (orderDescendingBy != null) {
        queryParams['orderDescendingBy'] = orderDescendingBy;
      }
      if (groupBy != null) queryParams['groupBy'] = groupBy;
      if (limit != null && limit > 0) queryParams['limit'] = limit.toString();
      if (offset != null) queryParams['offset'] = offset.toString();

      final url = Uri(
        path: baseUrl,
        queryParameters: queryParams.isNotEmpty ? queryParams : null,
      ).toString();

      final res = await Rest.get(
        RestParams(url),
      );

      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }
}

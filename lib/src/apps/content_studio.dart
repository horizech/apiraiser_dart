import 'package:apiraiser/apiraiser.dart';
import 'package:apiraiser/constants.dart';
import 'package:apiraiser/src/helpers/rest.dart';
import 'package:apiraiser/src/models/rest_params.dart';

/// Content Studio APIs
class ContentStudioApp {
  static const String apiraiser = Constants.apiraiser;
  static const String version = Constants.version;
  static const String app = Constants.app;

  /// Get Data
  Future<APIResult> getData() async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/$app/ContentStudio/GetData',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get Foreign Collections
  Future<APIResult> getForeignCollections() async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/$app/ContentStudio/ForeignCollections',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get Records
  Future<dynamic> getRecords({
    required String collectionName,
    int pageSize = -1,
    int page = -1,
    String filtertext = '',
  }) async {
    try {
      String url =
          '/$apiraiser/$version/$app/ContentStudio/$collectionName?pageSize=$pageSize&page=$page';
      if (filtertext.isNotEmpty) {
        url += '&filtertext=${Uri.encodeComponent(filtertext)}';
      }

      // Call the API with the constructed URL
      var result = await Rest.get(RestParams(url));

      return result;
    } catch (e) {
      // Handle any errors here
      print('Error: $e');
      return null;
    }
  }

  /// Insert a new record
  Future<APIResult> insertRecord(String collection, Object data) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/$app/ContentStudio/$collection',
          data: data,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Update record by id
  Future<APIResult> updateRecord(
      String collection, String id, Object data) async {
    try {
      var res = await Rest.put(
        RestParams(
          '/$apiraiser/$version/$app/ContentStudio/$collection/$id',
          data: data,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Delete Record
  Future<APIResult> deleteRecord(String collection, String id) async {
    try {
      var res = await Rest.delete(
        RestParams(
          '/$apiraiser/$version/$app/ContentStudio/$collection/$id',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get all collections
  Future<APIResult> getCollectionList() async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/$app/ContentStudio/CollectionsList',
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
    final baseUrl =
        '/$apiraiser/$version/$app/ContentStudio/GetRecordsByConditions/$collection';

    final queryParams = <String, String>{};

    if (orderBy != null) {
      queryParams['orderBy'] = orderBy;
    }
    if (orderDescendingBy != null) {
      queryParams['orderDescendingBy'] = orderDescendingBy;
    }
    if (groupBy != null) {
      queryParams['groupBy'] = groupBy;
    }
    if (pageSize != null && pageSize > 0) {
      queryParams['pageSize'] = pageSize.toString();
    }
    if (page != null) {
      queryParams['page'] = page.toString();
    }

    final url = Uri.parse('$baseUrl?${Uri(queryParameters: queryParams)}');

    // Call the API with the constructed URL and conditions
    var result =
        await Rest.post(RestParams(url.toString(), data: conditions ?? []));

    return result;
  }

  /// Get Collection Attributes
  Future<APIResult> getCollectionAttributes(String collection) async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/$app/ContentStudio/Attribute/$collection',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get record by id
  Future<APIResult> getRecordById(String collection, String id) async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/$app/ContentStudio/Attribute/$collection/$id',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get Records Count
  Future<APIResult> getRecordsCount(
      String collection, List<QuerySearchItem> conditions) async {
    try {
      var res = await Rest.post(
        RestParams('/$apiraiser/$version/$app/ContentStudio/$collection/Count',
            data: conditions),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Update records by conditions
  Future<APIResult> updateRecordsByConditions(String collection,
      List<Object> data, List<QuerySearchItem> conditions) async {
    try {
      var res = await Rest.put(
        RestParams(
            '/$apiraiser/$version/$app/ContentStudio/UpdateRecordsByConditions/$collection',
            data: data,
            params: conditions),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Delete records by conditions
  Future<APIResult> deleteRecordsByConditions(
      String collection, List<QuerySearchItem> conditions) async {
    try {
      var res = await Rest.delete(
        RestParams(
          '/$apiraiser/$version/$app/ContentStudio/DeleteRecordsByConditions/$collection',
          data: conditions,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }
}

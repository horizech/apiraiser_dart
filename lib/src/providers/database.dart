import 'package:apiraiser/apiraiser.dart';
import 'package:apiraiser/constants.dart';
import 'package:apiraiser/src/helpers/rest.dart';
import 'package:apiraiser/src/interfaces/attribute_info.dart';
import 'package:apiraiser/src/interfaces/create_collection_using_definition_file_request.dart';
import 'package:apiraiser/src/models/rest_params.dart';
import 'package:dio/dio.dart';

/// Database APIs
class DatabaseProvider {
  static const String apiraiser = Constants.apiraiser;
  static const String version = Constants.version;
  static const String provider = Constants.provider;

  /// Get audit attributes
  Future<APIResult> getAuditAttributes() async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/$provider/Database/Attribute/GetAuditAttributes',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get Collection Attributes
  Future<APIResult> getCollectionAttributes(String collection) async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/$provider/Database/Attribute/$collection',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Add a new attribute
  Future<APIResult> insertAttribute(
      String collection, AttributeInfo attributeInfo) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/$provider/Database/Attribute/$collection',
          data: attributeInfo,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Remove Attribute
  Future<APIResult> deleteAttribute(String collection, String attribute) async {
    try {
      var res = await Rest.delete(
        RestParams(
          '/$apiraiser/$version/$provider/Database/Attribute/$collection/$attribute',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Create a new collection
  Future<APIResult> createCollection(
      String collection, String tags, List<AttributeInfo> attributes) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/$provider/Database/Collection?collection=$collection&tags=$tags',
          data: attributes,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Create a new collection using Definition File
  Future<dynamic> createCollectionUsingDefinitionFile(
      CreateCollectionUsingDefinitionFileRequest request) async {
    final result = await Rest.post(RestParams(
      '/$apiraiser/$version/$provider/Database/Collection/CreateCollectionUsingDefinitionFile',
      data: request,
      headers: {
        'Content-Type': 'multipart/form-data',
      },
    ));
    return result;
  }

  /// Delete a collection
  Future<APIResult> deleteCollection(String collection) async {
    try {
      var res = await Rest.delete(
        RestParams(
          '/$apiraiser/$version/$provider/Database/Collection?collection=$collection',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Download collection Definition File
  Future<APIResult> downloadCollectionDefinitionFile(String collection) async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/$provider/Database/Collection/DownloadCollectionDefinitionFile/$collection',
          responseType: ResponseType.bytes,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get all collections
  Future<APIResult> getCollectionList(String collection) async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/$provider/Database/Collection/GetCollectionsList',
          responseType: ResponseType.bytes,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Insert a new record
  Future<APIResult> insertRecord(String collection, Object data) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/$provider/Database/Record/$collection',
          data: data,
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
          '/$apiraiser/$version/$provider/Database/Record/$collection/$id',
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
          '/$apiraiser/$version/$provider/Database/Record/$collection/$id',
          data: data,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Delete record by id
  Future<APIResult> deleteRecord(String collection, String id) async {
    try {
      var res = await Rest.delete(
        RestParams(
          '/$apiraiser/$version/$provider/Database/Record/$collection/$id',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get count
  Future<APIResult> getRecordsCount(
      String collection, List<QuerySearchItem> conditions) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/$provider/Database/Record/$collection/GetCount',
          data: conditions,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Insert a list of records
  Future<APIResult> insertRecordsList(
      String collection, List<Object> data) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/$provider/Database/Record/$collection/InsertRecords',
          data: data,
        ),
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
          '/$apiraiser/$version/$provider/Database/Record/$collection/UpdateRecords',
          data: data,
          params: conditions,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Delete records by ids
  Future<APIResult> deleteRecordsByIds(
      String collection, List<String> ids) async {
    try {
      var res = await Rest.delete(
        RestParams(
          '/$apiraiser/$version/$provider/Database/Record/$collection/DeleteRecordsByIds',
          data: ids,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get records
  Future<APIResult> getRecords(
    String collection, {
    int? pageSize,
    int? page,
    String? orderBy,
    String? orderDescendingBy,
    String? groupBy,
    List<QuerySearchItem>? conditions,
  }) async {
    try {
      final baseUrl =
          '/$apiraiser/$version/$provider/Database/Record/GetRecords/$collection';

      // Building query parameters
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

      // Combine the base URL with query parameters
      final uri = Uri.parse(baseUrl).replace(queryParameters: queryParams);

      // Make the request
      final result = await Rest.post(
        RestParams(
          uri.toString(),
          data: QuerySearchItem.toJsonList(conditions ?? []),
        ),
      );

      return APIResult.fromJson(result);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get Plugins
  Future<APIResult> getPlugins() async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/$provider/Database/GetPlugins',
        ),
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
          '/$apiraiser/$version/$provider/Database/Record/$collection/DeleteRecords',
          data: conditions,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }
}

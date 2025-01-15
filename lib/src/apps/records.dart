import 'package:apiraiser/apiraiser.dart';
import 'package:apiraiser/constants.dart';
import 'package:apiraiser/src/helpers/rest.dart';
import 'package:apiraiser/src/models/rest_params.dart';

/// RecordsApp APIs
class RecordsApp {
  static const String apiraiser = Constants.apiraiser;
  static const String version = Constants.version;
  static const String app = Constants.app;

  /// Get Data
  Future<APIResult> getData() async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/$app/Records/GetData',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get Data By Collection
  Future<dynamic> getDataByCollection({
    required String collectionName,
    int pageSize = -1,
    int page = -1,
    String filterText = '',
  }) async {
    final baseUrl =
        '/$apiraiser/$version/$app/Records/$collectionName?pageSize=$pageSize&page=$page';
    final url = filterText.isNotEmpty
        ? '$baseUrl&filtertext=${Uri.encodeComponent(filterText)}'
        : baseUrl;

    var result = await Rest.get(RestParams(url));
    return result;
  }

  /// Insert a new record
  Future<APIResult> insert(String collection, Object data) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/$app/Records/$collection',
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
          '/$apiraiser/$version/$app/Records/$collection/$id',
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
          '/$apiraiser/$version/$app/Records/$collection/$id',
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
          '/$apiraiser/$version/$app/Records/$collection/$id',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Delete records by ids
  Future<APIResult> deleteByIds(String collection, List<String> ids) async {
    try {
      var res = await Rest.delete(
        RestParams(
          '/$apiraiser/$version/$app/Records/$collection/DeleteRecordsByIds',
          data: ids,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }
}

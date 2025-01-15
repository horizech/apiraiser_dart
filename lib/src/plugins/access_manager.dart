import 'package:apiraiser/constants.dart';
import 'package:apiraiser/src/helpers/rest.dart';
import 'package:apiraiser/src/models/api_result.dart';
import 'package:apiraiser/src/models/rest_params.dart';

/// Access Manager APIs
class AccessManagerPlugin {
  static const String apiraiser = Constants.apiraiser;
  static const String version = Constants.version;
  static const String plugin = Constants.plugin;

  /// Get Data
  Future<APIResult> getData(String collectionName) async {
    try {
      var res = await Rest.get(
        RestParams(
          // ignore: unnecessary_null_comparison
          '/$apiraiser/$version/$plugin/AccessManager/GetData${collectionName != null ? '?collectionName=${Uri.encodeComponent(collectionName)}' : ''}',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Insert a new record
  Future<APIResult> insert(String collection, Object data) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/$plugin/AccessManager/$collection',
          data: data,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Update a new record
  Future<APIResult> update(String collection, String id, Object data) async {
    try {
      var res = await Rest.put(
        RestParams(
          '/$apiraiser/$version/$plugin/AccessManager/$collection/$id',
          data: data,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Delete a new record
  Future<APIResult> delete(String collection, String id) async {
    try {
      var res = await Rest.delete(
        RestParams(
          '/$apiraiser/$version/$plugin/AccessManager/$collection/$id',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }
}

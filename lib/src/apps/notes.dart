import 'package:apiraiser/apiraiser.dart';
import 'package:apiraiser/constants.dart';
import 'package:apiraiser/src/helpers/rest.dart';
import 'package:apiraiser/src/models/rest_params.dart';

/// NotesApp APIs
class NotesApp {
  static const String apiraiser = Constants.apiraiser;
  static const String version = Constants.version;
  static const String app = Constants.app;

  /// Insert a new record
  Future<APIResult> insert(Object data) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/$app/Notes',
          data: data,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Update record
  Future<APIResult> update(String id, Object data) async {
    try {
      var res = await Rest.put(
        RestParams(
          '/$apiraiser/$version/$app/Notes/$id',
          data: data,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Delete record
  Future<APIResult> delete(String id) async {
    try {
      var res = await Rest.delete(
        RestParams(
          '/$apiraiser/$version/$app/Notes/$id',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get records
  Future<APIResult> getNotes({int? pageSize, int? page}) async {
    final baseUrl = '/$apiraiser/$version/$app/Notes';

    final queryParams = <String, String>{};
    if (pageSize != null && pageSize > 0) {
      queryParams['pageSize'] = pageSize.toString();
    }
    if (page != null) {
      queryParams['page'] = page.toString();
    }

    final url = queryParams.isNotEmpty
        ? '$baseUrl?${Uri(queryParameters: queryParams)}'
        : baseUrl;

    var result = await Rest.get(RestParams(url));
    return result;
  }
}

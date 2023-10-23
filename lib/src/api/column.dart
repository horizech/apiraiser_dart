import 'package:apiraiser/src/api/rest.dart';
import 'package:apiraiser/src/models/column_info.dart';
import 'package:apiraiser/src/models/api_result.dart';
import 'package:apiraiser/src/models/rest_params.dart';

/// Column APIs
class Column {
  /// Get predefined columns
  Future<APIResult> getPredefinedColumns() async {
    try {
      var res = await Rest.get(
        RestParams(
          '/API/v1/GetPredefinedColumns',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get columns
  Future<APIResult> get(String table) async {
    try {
      var res = await Rest.get(
        RestParams(
          '/API/v1/$table/Columns',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Add a new column
  Future<APIResult> insert(String table, ColumnInfo columnInfo) async {
    Map<String, dynamic> data = columnInfo.toJson(columnInfo);
    try {
      var res = await Rest.post(RestParams(
        '/API/v1/$table/Column',
        data: data,
      ));
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Remove column
  Future<APIResult> delete(String table, String column) async {
    try {
      var res = await Rest.delete(
        RestParams('/API/v1/$table/Column/$column'),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }
}

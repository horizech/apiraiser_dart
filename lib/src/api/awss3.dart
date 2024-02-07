import 'dart:convert';

import 'package:apiraiser/constants.dart';
import 'package:apiraiser/src/api/rest.dart';
import 'package:apiraiser/src/models/api_result.dart';
import 'package:apiraiser/src/models/rest_params.dart';

/// AWSS3 APIs
class AWSS3 {
  /// Delete By Key
  Future<APIResult> deleteByKey(String key) async {
    try {
      var res = await Rest.get(
        RestParams(
          '/API/${Constants.version}/AWSS3/DeleteByKey?key=$key',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Upload folder
  Future<APIResult> uploadFolder(String key, String folder,
      {bool deleteSourceFolderAfterUpload = false}) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/API/${Constants.version}/AWSS3/UploadFolder?key=$key&deleteSourceFolderAfterUpload=$deleteSourceFolderAfterUpload',
          data: jsonEncode(folder),
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }
}

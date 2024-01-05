import 'dart:convert';

import 'package:apiraiser/constants.dart';
import 'package:apiraiser/src/api/rest.dart';
import 'package:apiraiser/src/models/api_result.dart';
import 'package:apiraiser/src/models/rest_params.dart';

/// Encryption APIs
class Encryption {
  /// Generate AES RSA Pair
  Future<APIResult> generateAESRSAPair(String password) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/API/${Constants.version}/Encryption/GenerateAESRSAPair',
          data: jsonEncode(password),
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get Encryption Keys
  Future<APIResult> getEncryptionKeys(
    String password,
  ) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/API/${Constants.version}/Encryption/GetEncryptionKeys',
          data: jsonEncode(password),
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Encrypt Data
  Future<APIResult> encryptData(String password, String data) async {
    try {
      Map<String, String> map = {"Password": password, "Data": data};
      var res = await Rest.post(
        RestParams(
          '/API/${Constants.version}/Encryption/EncryptData',
          data: jsonEncode(map),
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Decrypt Data
  Future<APIResult> decryptData(String password, String data) async {
    try {
      Map<String, String> map = {"Password": password, "Data": data};
      var res = await Rest.post(
        RestParams(
          '/API/${Constants.version}/Encryption/DecryptData',
          data: jsonEncode(map),
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }
}

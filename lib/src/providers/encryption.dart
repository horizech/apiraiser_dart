import 'dart:convert';

import 'package:apiraiser/constants.dart';
import 'package:apiraiser/src/helpers/rest.dart';
import 'package:apiraiser/src/interfaces/encryption_request.dart';
import 'package:apiraiser/src/models/api_result.dart';
import 'package:apiraiser/src/models/rest_params.dart';

/// Encryption APIs
class EncryptionProvider {
  static const String apiraiser = Constants.apiraiser;
  static const String version = Constants.version;
  static const String provider = Constants.provider;

  /// Generate AES RSA Pair
  Future<APIResult> generateAESRSAPair(String password) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/$provider/Encryption/GenerateAESRSAPair',
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
          '/$apiraiser/$version/$provider/Encryption/GetEncryptionKeys',
          data: jsonEncode(password),
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Encrypt Data
  Future<APIResult> encryptData(EncryptionRequest data) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/$provider/Encryption/EncryptData',
          data: data,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Decrypt Data
  Future<APIResult> decryptData(EncryptionRequest data) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/$provider/Encryption/DecryptData',
          data: data,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get Plugin
  Future<APIResult> getPlugins() async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/$provider/Encryption/GetPlugins',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }
}

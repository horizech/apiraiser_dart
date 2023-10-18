import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:apiraiser/src/helpers/state.dart';
import 'package:apiraiser/src/helpers/headers.dart';
import 'package:apiraiser/src/models/api_result.dart';

/// Encryption APIs
class Encryption {
  /// Generate AES RSA Pair
  Future<APIResult> generateAESRSAPair(String password) async {
    try {
      var res = await http.post(
        Uri.parse('${State.endPoint}/API/Encryption/GenerateAESRSAPair'),
        headers: Headers.getHeaders(),
        body: jsonEncode(password),
      );
      return APIResult.fromJson(json.decode(res.body));
    } catch (e) {
      rethrow;
    }
  }

  /// Get Encryption Keys
  Future<APIResult> getEncryptionKeys(
    String password,
  ) async {
    try {
      var res = await http.post(
        Uri.parse('${State.endPoint}/API/Encryption/GetEncryptionKeys'),
        headers: Headers.getHeaders(),
        body: jsonEncode(password),
      );
      return APIResult.fromJson(json.decode(res.body));
    } catch (e) {
      rethrow;
    }
  }

  /// Encrypt Data
  Future<APIResult> encryptData(String password, String data) async {
    try {
      Map<String, String> map = {"Password": password, "Data": data};
      var res = await http.post(
        Uri.parse('${State.endPoint}/API/Encryption/EncryptData'),
        headers: Headers.getHeaders(),
        body: jsonEncode(map),
      );
      return APIResult.fromJson(json.decode(res.body));
    } catch (e) {
      rethrow;
    }
  }

  /// Decrypt Data
  Future<APIResult> decryptData(String password, String data) async {
    try {
      Map<String, String> map = {"Password": password, "Data": data};
      var res = await http.post(
        Uri.parse('${State.endPoint}/API/Encryption/DecryptData'),
        headers: Headers.getHeaders(),
        body: jsonEncode(map),
      );
      return APIResult.fromJson(json.decode(res.body));
    } catch (e) {
      rethrow;
    }
  }
}

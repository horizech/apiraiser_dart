import 'dart:convert';

import 'package:apiraiser/src/api/rest.dart';
import 'package:apiraiser/src/models/find_product_request.dart';
import 'package:apiraiser/src/models/rest_params.dart';
import 'package:apiraiser/src/models/api_result.dart';

/// Commerce APIs
class Commerce {
  /// Find attribute values
  Future<APIResult> findAttributeValues(String collection) async {
    try {
      var res = await Rest.get(
        RestParams(
            '/API/v1/Commerce/FindAttributeValues?collection=$collection'),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Find products
  Future<APIResult> findProducts(FindProductRequest request) async {
    try {
      var res = await Rest.post(
        RestParams('/API/v1/Commerce/FindProducts',
            data: jsonEncode(request.toJson(request))),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }
}

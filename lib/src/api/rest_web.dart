import 'package:apiraiser/src/helpers/state.dart';
import 'package:apiraiser/src/models/rest_params.dart';

import 'package:apiraiser/src/helpers/headers.dart' as helper;
import 'package:dio/dio.dart';
import 'package:dio/browser.dart';

Dio _dio = Dio();

class RestPlatform {
  Future<dynamic> get(RestParams restParams, {String? jwt}) async {
    try {
      BaseOptions options = BaseOptions(
        baseUrl: State.endPoint ?? "",
        validateStatus: (_) => true,
        method: "GET",
        headers: helper.Headers.getHeaders(jwt: jwt),
        responseType: restParams.responseType,
      );
      _dio = Dio(options);
      _dio.httpClientAdapter = BrowserHttpClientAdapter(withCredentials: true);
      Response<dynamic> res = await _dio.get(
        restParams.url,
        queryParameters: restParams.params,
      );
      return res.data;
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> post(RestParams restParams, {String? jwt}) async {
    try {
      BaseOptions options = BaseOptions(
        baseUrl: '${State.endPoint}',
        validateStatus: (_) => true,
        method: "POST",
        headers: helper.Headers.getHeaders(jwt: jwt),
        responseType: restParams.responseType,
      );
      _dio = Dio(options);
      _dio.httpClientAdapter = BrowserHttpClientAdapter(withCredentials: true);
      Response<dynamic> response = await _dio.post(
        restParams.url,
        queryParameters: restParams.params,
        data: restParams.data,
      );
      return response.data;
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> put(RestParams restParams, {String? jwt}) async {
    try {
      BaseOptions options = BaseOptions(
        baseUrl: '${State.endPoint}',
        validateStatus: (_) => true,
        headers: helper.Headers.getHeaders(jwt: jwt),
        method: "PUT",
        responseType: restParams.responseType,
      );
      _dio = Dio(options);
      _dio.httpClientAdapter = BrowserHttpClientAdapter(withCredentials: true);
      Response<dynamic> res = await _dio.put(
        restParams.url,
        queryParameters: restParams.params,
        data: restParams.data,
      );
      return res.data;
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> delete(RestParams restParams, {String? jwt}) async {
    try {
      BaseOptions options = BaseOptions(
        baseUrl: '${State.endPoint}',
        headers: helper.Headers.getHeaders(jwt: jwt),
        validateStatus: (status) => true,
        responseType: restParams.responseType,
        method: "DELETE",
      );
      _dio = Dio(options);
      _dio.httpClientAdapter = BrowserHttpClientAdapter(withCredentials: true);
      Response<dynamic> res = await _dio.delete(
        restParams.url,
        queryParameters: restParams.params,
        data: restParams.data,
      );
      return res.data;
    } catch (e) {
      return e;
    }
  }
}

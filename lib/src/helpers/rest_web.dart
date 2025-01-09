import 'package:apiraiser/src/helpers/rest.dart';
import 'package:apiraiser/src/helpers/state.dart';
import 'package:apiraiser/src/models/rest_params.dart';
import 'package:apiraiser/src/helpers/headers.dart' as helper;
import 'package:dio/dio.dart';
import 'package:dio/browser.dart';

HttpClientAdapter makeHttpClientAdapter() {
  final adapter = HttpClientAdapter() as BrowserHttpClientAdapter;
  adapter.withCredentials = true;
  return adapter;
}

class RestPlatform extends Interceptor {
  Future<dynamic> get(RestParams restParams, {String? jwt}) async {
    try {
      BaseOptions options = BaseOptions(
        baseUrl: State.endPoint ?? "",
        validateStatus: (_) => true,
        method: "GET",
        headers: helper.Headers.getHeaders(jwt: jwt),
        responseType: restParams.responseType,
      );
      dio.options = options;
      dio.httpClientAdapter = makeHttpClientAdapter();
      Response<dynamic> res = await dio.get(
        restParams.url,
        queryParameters: restParams.params,
      );
      return res.data;
    } on DioException catch (e) {
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
      dio.options = options;
      dio.httpClientAdapter = makeHttpClientAdapter();
      Response<dynamic> response = await dio.post(
        restParams.url,
        queryParameters: restParams.params,
        data: restParams.data,
      );
      return response.data;
    } on DioException catch (e) {
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
      dio.options = options;
      dio.httpClientAdapter = makeHttpClientAdapter();
      Response<dynamic> res = await dio.put(
        restParams.url,
        queryParameters: restParams.params,
        data: restParams.data,
      );
      return res.data;
    } on DioException catch (e) {
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
      dio.options = options;
      dio.httpClientAdapter = makeHttpClientAdapter();
      Response<dynamic> res = await dio.delete(
        restParams.url,
        queryParameters: restParams.params,
        data: restParams.data,
      );
      return res.data;
    } on DioException catch (e) {
      return e;
    }
  }
}

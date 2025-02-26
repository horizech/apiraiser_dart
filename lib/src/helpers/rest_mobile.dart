import 'package:apiraiser/src/helpers/rest.dart';
import 'package:apiraiser/src/helpers/state.dart';
import 'package:apiraiser/src/models/rest_params.dart';
import 'package:apiraiser/src/helpers/headers.dart' as helper;
import 'package:dio/dio.dart';

class RestPlatform extends Interceptor {
  Future<dynamic> get(RestParams restParams, {String? jwt}) async {
    try {
      BaseOptions options = BaseOptions(
        baseUrl: State.endPoint ?? "",
        validateStatus: (_) => true,
        method: "GET",
        headers: helper.Headers.getHeaders(
            jwt: jwt, contentType: restParams.headers),
        responseType: restParams.responseType,
      );
      dio.options = options;

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
        method: "POST",
        validateStatus: (_) => true,
        headers: helper.Headers.getHeaders(
            jwt: jwt, contentType: restParams.headers),
        responseType: restParams.responseType,
      );
      dio.options = options;

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
        validateStatus: (status) => true,
        headers: helper.Headers.getHeaders(jwt: jwt),
        responseType: restParams.responseType,
        method: "DELETE",
      );
      dio.options = options;
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

import 'package:apiraiser/src/helpers/state.dart';
import 'package:apiraiser/src/models/rest_params.dart';
import 'package:dio/browser.dart';
import 'package:flutter/foundation.dart';
import 'package:apiraiser/src/helpers/headers.dart' as helper;
import 'package:dio/dio.dart';

Dio dio = Dio();

class Rest {
  static Future<dynamic> get(RestParams restParams, {String? jwt}) async {
    try {
      BaseOptions options = BaseOptions(
        baseUrl: State.endPoint ?? "",
        method: "GET",
        headers: helper.Headers.getHeaders(jwt: jwt),
        responseType: restParams.responseType,
      );
      dio = Dio(options);
      if (kIsWeb) {
        dio.httpClientAdapter = BrowserHttpClientAdapter(withCredentials: true);
      }
      Response<dynamic> res = await dio.get(
        restParams.url,
        queryParameters: restParams.params,
      );
      return res.data;
    } catch (e) {
      return e;
    }
  }

  static Dio getClient(options) {
    Dio dio = Dio(options);
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // dio.interceptors.requestLock.lock();

        options.headers['cookie'] = "accessToken=sdfsdf; refreshToken=dsfsdfsd";
        // dio.interceptors.requestLock.unlock();

        return handler.next(options);
      },
    ));
    return dio;
    // onResponse: (response, handler) {
    //   response.headers.forEach((name, values) async {
    //     if (name == HttpHeaders.setCookieHeader) {
    //       final cookieMap = <String, String>{};
    //       cookieMap
    //           .forEach((key, value) => cookiesFormatted += '$key=$value; ');

    //       await localData.write('cookie', cookiesFormatted);

    //       return;
    //     }
    //   });

    // return handler.next(response);
    // },
  }

  static Future<dynamic> post(RestParams restParams, {String? jwt}) async {
    try {
      BaseOptions options = BaseOptions(
        baseUrl: '${State.endPoint}',
        method: "POST",
        headers: helper.Headers.getHeaders(jwt: jwt),
        responseType: restParams.responseType,
      );
      dio = Dio(options);
      Response<dynamic> response = await dio.post(
        restParams.url,
        queryParameters: restParams.params,
        data: restParams.data,
      );
      return response.data;
    } catch (e) {
      return e;
    }
  }

  static Future<dynamic> put(RestParams restParams, {String? jwt}) async {
    try {
      BaseOptions options = BaseOptions(
        baseUrl: '${State.endPoint}',
        headers: helper.Headers.getHeaders(jwt: jwt),
        method: "PUT",
        responseType: restParams.responseType,
      );
      dio = Dio(options);
      Response<dynamic> res = await dio.put(
        restParams.url,
        queryParameters: restParams.params,
        data: restParams.data,
      );
      return res.data;
    } catch (e) {
      return e;
    }
  }

  static Future<dynamic> delete(RestParams restParams, {String? jwt}) async {
    try {
      BaseOptions options = BaseOptions(
        baseUrl: '${State.endPoint}',
        headers: helper.Headers.getHeaders(jwt: jwt),
        responseType: restParams.responseType,
        method: "DELETE",
      );
      dio = Dio(options);
      Response<dynamic> res = await dio.delete(
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

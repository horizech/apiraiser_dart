import 'package:apiraiser/src/helpers/rest.dart';
import 'package:dio/dio.dart';

setupDioInterceptors(Function? onUnauthenticated) {
  dio.interceptors.add(InterceptorsWrapper(
    onError: (DioException error, handler) async {
      if (error.response?.statusCode == 401 ||
          error.response?.statusCode == 403) {
        if (onUnauthenticated != null) {
          onUnauthenticated();
        }
      }
      return handler.next(error);
    },
    onResponse: (response, handler) async {
      if (response.statusCode == 401 || response.statusCode == 403) {
        if (onUnauthenticated != null) {
          onUnauthenticated();
        }
      }
      if (response.statusCode == 200 && response.data != null) {}
      return handler.next(response);
    },
  ));
}

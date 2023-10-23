import 'package:dio/dio.dart';

class RestParams {
  final String url;
  final dynamic data;
  final Map<String, dynamic>? params;
  final ResponseType responseType;
  RestParams(
    this.url, {
    this.data,
    this.params,
    this.responseType = ResponseType.json,
  });
}

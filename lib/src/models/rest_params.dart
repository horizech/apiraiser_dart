import 'package:dio/dio.dart';

class RestParams {
  final String url;
  final dynamic data;
  final dynamic params;
  final ResponseType responseType;
  final Map<String, String>? headers;
  RestParams(
    this.url, {
    this.data,
    this.params,
    this.responseType = ResponseType.json,
    this.headers,
  });
}

import 'package:apiraiser/src/helpers/rest_mobile.dart'
    if (dart.library.html) 'package:apiraiser/src/helpers/rest_web.dart';
import 'package:dio/dio.dart';

Dio dio = Dio();
RestPlatform Rest = RestPlatform();

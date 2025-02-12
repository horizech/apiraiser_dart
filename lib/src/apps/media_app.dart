import 'package:apiraiser/apiraiser.dart';
import 'package:apiraiser/constants.dart';
import 'package:apiraiser/src/helpers/rest.dart';
import 'package:apiraiser/src/models/rest_params.dart';
import 'package:dio/dio.dart';

/// MediaApp APIs
class MediaApp {
  static const String apiraiser = Constants.apiraiser;
  static const String version = Constants.version;
  static const String app = Constants.app;

  /// Get Data
  Future<APIResult> getData() async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/$app/Media/GetData',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get Media
  Future<dynamic> getMedia({
    String? filterText,
    String? mediaType,
    int? pageSize,
    int? page,
    String? orderBy,
    String? orderDescendingBy,
    String? groupBy,
  }) async {
    try {
      final baseUrl = '/$apiraiser/$version/$app/Media/GetMedia';

      final queryParams = <String, String>{};

      if (mediaType != null) {
        queryParams['mediaType'] = mediaType;
      }
      if (orderBy != null) {
        queryParams['orderBy'] = orderBy;
      }
      if (orderDescendingBy != null) {
        queryParams['orderDescendingBy'] = orderDescendingBy;
      }
      if (groupBy != null) {
        queryParams['groupBy'] = groupBy;
      }
      if (pageSize != null && pageSize > 0) {
        queryParams['pageSize'] = pageSize.toString();
      }
      if (page != null) {
        queryParams['page'] = page.toString();
      }

      final url = Uri.parse('$baseUrl?${Uri(queryParameters: queryParams)}');

      // Send the POST request with the filterText as the body
      var result =
          await Rest.post(RestParams(url.toString(), data: filterText));

      return result;
    } catch (e) {
      // Handle errors here
      print('Error: $e');
      return null;
    }
  }

  /// Get Images
  Future<APIResult> getImages() async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/$app/Media/GetImages',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get Media Count
  Future<dynamic> getMediaCount({
    String? filterText,
    String? mediaType,
  }) async {
    try {
      final url =
          '/$apiraiser/$version/$app/Media/GetMediaCount${mediaType != null ? '?mediaType=$mediaType' : ''}';
      var result = await Rest.post(RestParams(url, data: filterText));

      return result;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  /// Upload media
  Future<APIResult> upload(MediaUploadRequest mediaUploadRequest) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/$app/Media',
          data: mediaUploadRequest,
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Update media
  Future<APIResult> update(String mediaId, dynamic request) async {
    try {
      var res = await Rest.put(
        RestParams(
          '/$apiraiser/$version/$app/Media/$mediaId',
          data: request,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Delete media
  Future<APIResult> delete(String mediaId) async {
    try {
      var res = await Rest.delete(
        RestParams(
          '/$apiraiser/$version/$app/Media/$mediaId',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Download media
  Future<APIResult> download(String mediaId) async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/$app/Media/Download/$mediaId',
          responseType: ResponseType.stream,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }
}

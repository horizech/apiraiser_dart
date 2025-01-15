import 'package:apiraiser/constants.dart';
import 'package:apiraiser/src/helpers/rest.dart';
import 'package:apiraiser/src/interfaces/attribute_info.dart';
import 'package:apiraiser/src/interfaces/create_collection_using_definition_file_request.dart';
import 'package:apiraiser/src/models/api_result.dart';
import 'package:apiraiser/src/models/rest_params.dart';
import 'package:dio/dio.dart';

/// Collection Studio APIs
class CollectionsStudioApp {
  static const String apiraiser = Constants.apiraiser;
  static const String version = Constants.version;
  static const String app = Constants.app;

  /// Get Data
  Future<APIResult> getData() async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/$app/CollectionsStudio/GetData',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Add a new attribute
  Future<APIResult> insertAttribute(
      String collection, AttributeInfo attributeInfo) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/$app/CollectionsStudio/Attribute/$collection',
          data: attributeInfo,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get Attributes
  Future<APIResult> getAttributes(String collection) async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/$app/CollectionsStudio/Attribute/$collection',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Remove Attribute
  Future<APIResult> deleteAttribute(String collection, String attribute) async {
    try {
      var res = await Rest.delete(
        RestParams(
          '/$apiraiser/$version/$app/CollectionsStudio/Attribute/$collection/$attribute',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Modify Collection
  Future<APIResult> modifyCollection(Object data) async {
    try {
      var res = await Rest.put(
        RestParams(
          '/$apiraiser/$version/$app/CollectionsStudio/Collection',
          data: data,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Delete a collection
  Future<APIResult> deleteCollection(String collection) async {
    try {
      var res = await Rest.delete(
        RestParams(
          '/$apiraiser/$version/$app/CollectionsStudio/Collection/$collection',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get Foreign Collections
  Future<APIResult> getForeignCollections() async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/$app/CollectionsStudio/GetForeignCollections',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Create a new collection
  Future<APIResult> createCollection(
      String collection, String tags, List<AttributeInfo> attributes) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/$app/CollectionsStudio/Collection/$collection?tags=$tags',
          data: attributes,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Create a new collection using Definition File
  Future<APIResult> createCollectionUsingDefinitionFile(
      CreateCollectionUsingDefinitionFileRequest request) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/$app/CollectionsStudio/Collection/CreateCollectionUsingDefinitionFile',
          data: request,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Download collection Definition File
  Future<APIResult> downloadCollectionDefinitionFile(String collection) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/$app/CollectionsStudio/Collection/DownloadCollectionDefinitionFile/$collection',
          responseType: ResponseType.stream,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }
}

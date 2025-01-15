import 'package:apiraiser/constants.dart';
import 'package:apiraiser/src/helpers/rest.dart';
import 'package:apiraiser/src/interfaces/add_update_translations.dart';
import 'package:apiraiser/src/models/api_result.dart';
import 'package:apiraiser/src/models/rest_params.dart';

/// Internationalization APIs
class InternationalizationService {
  static const String apiraiser = Constants.apiraiser;
  static const String version = Constants.version;
  static const String provider = Constants.provider;

  // Get Data
  Future<APIResult> getData() async {
    try {
      var res = await Rest.post(RestParams(
          '/$apiraiser/$version/$provider/Internationalization/GetData'));
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  // Get Translations by Locale
  Future<APIResult> getTranslationsByLocale(String locale) async {
    try {
      var res = await Rest.post(RestParams(
        '/$apiraiser/$version/$provider/Internationalization/GetTranslationsByLocale',
        data: locale,
      ));
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  // Get Translations with Pagination and Filter
  Future<APIResult> getTranslations(int pageSize, int page,
      {String? filterText}) async {
    String url =
        '/$apiraiser/$version/$provider/Internationalization/Translations?pageSize=$pageSize&page=$page';
    if (filterText != null) {
      url += '&filtertext=${Uri.encodeComponent(filterText)}';
    }

    try {
      var res = await Rest.post(RestParams(url));
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  // Insert I18n Label
  Future<APIResult> insertI18n(String label) async {
    try {
      var res = await Rest.post(RestParams(
        '/$apiraiser/$version/$provider/Internationalization/I18n',
        data: {'Label': label},
      ));
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  // Add or Update Translations
  Future<APIResult> addUpdateTranslations(
      AddUpdateTranslationsRequest request) async {
    try {
      var res = await Rest.post(RestParams(
        '/$apiraiser/$version/$provider/Internationalization/Translations',
        data: request,
      ));
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  // Delete Translations
  Future<APIResult> deleteTranslation(
      AddUpdateTranslationsRequest deleteTranslationsRequest) async {
    try {
      var res = await Rest.delete(RestParams(
        '/$apiraiser/$version/$provider/Internationalization/Translations',
        data: deleteTranslationsRequest,
      ));
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  // Insert a New Locale
  Future<APIResult> insertLocale(Object data) async {
    try {
      var res = await Rest.post(RestParams(
        '/$apiraiser/$version/$provider/Internationalization/Locale',
        data: data,
      ));
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  // Update Locale
  Future<APIResult> updateLocale(String id, Object data) async {
    try {
      var res = await Rest.put(RestParams(
        '/$apiraiser/$version/$provider/Internationalization/Locale/$id',
        data: data,
      ));
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  // Delete Locale
  Future<APIResult> deleteLocale(String id) async {
    try {
      var res = await Rest.delete(RestParams(
        '/$apiraiser/$version/$provider/Internationalization/Locale/$id',
      ));
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  // Insert Currency
  Future<APIResult> insertCurrency(Object data) async {
    try {
      var res = await Rest.post(RestParams(
        '/$apiraiser/$version/$provider/Internationalization/Currency',
        data: data,
      ));
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  // Update Currency
  Future<APIResult> updateCurrency(String id, Object data) async {
    try {
      var res = await Rest.put(RestParams(
        '/$apiraiser/$version/$provider/Internationalization/Currency/$id',
        data: data,
      ));
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  // Delete Currency
  Future<APIResult> deleteCurrency(String id) async {
    try {
      var res = await Rest.delete(RestParams(
        '/$apiraiser/$version/$provider/Internationalization/Currency/$id',
      ));
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  // Get Plugins
  Future<APIResult> getPlugins() async {
    try {
      var res = await Rest.get(RestParams(
        '/$apiraiser/$version/$provider/Internationalization/GetPlugins',
      ));
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }
}

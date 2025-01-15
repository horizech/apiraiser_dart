import 'package:apiraiser/constants.dart';
import 'package:apiraiser/src/helpers/rest.dart';
import 'package:apiraiser/src/interfaces/add_update_translations.dart';
import 'package:apiraiser/src/interfaces/delete_translations_request.dart';
import 'package:apiraiser/src/models/rest_params.dart';
import 'package:apiraiser/src/models/api_result.dart';

/// i18n APIs
class I18nPlugin {
  static const String apiraiser = Constants.apiraiser;
  static const String version = Constants.version;
  static const String plugin = Constants.plugin;

  /// Get Data
  Future<APIResult> getData() async {
    try {
      var res = await Rest.get(
        RestParams(
            // ignore: unnecessary_null_comparison
            '/$apiraiser/$version/$plugin/i18n/GetData'),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get Translations
  Future<APIResult> getTranslationsByLocale(String locale) async {
    try {
      var res = await Rest.post(
        RestParams(
          // ignore: unnecessary_null_comparison
          '/$apiraiser/$version/$plugin/i18n/GetTranslationsByLocale',
          data: locale,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get Translations
  Future<APIResult> getTrasnlations(
      int pageSize, int page, String? filtertext) async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/$plugin/i18n/Translations?pageSize=$pageSize&page=$page${filtertext != null ? '&filtertext=${Uri.encodeComponent(filtertext)}' : ''}',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Insert I18n
  Future<APIResult> insertI18n(String label) async {
    try {
      var res = await Rest.post(
        RestParams(
          // ignore: unnecessary_null_comparison
          '/$apiraiser/$version/$plugin/i18n/I18n',
          data: {
            "Label": label,
          },
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Add Update Translations
  Future<APIResult> addUpdateTranslations(
      AddUpdateTranslationsRequest request) async {
    try {
      var res = await Rest.post(
        RestParams(
          // ignore: unnecessary_null_comparison
          '/$apiraiser/$version/$plugin/i18n/Translations',
          data: request,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Delete Translations
  Future<APIResult> deleteTranslation(
      DeleteTranslationsRequest deleteTranslationsRequest) async {
    try {
      var res = await Rest.delete(
        RestParams(
          '/$apiraiser/$version/$plugin/i18n/Translations',
          data: deleteTranslationsRequest,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Insert a new locale
  Future<APIResult> insertLocale(Object data) async {
    try {
      var res = await Rest.post(
        RestParams(
          // ignore: unnecessary_null_comparison
          '/$apiraiser/$version/$plugin/i18n/Locale',
          data: data,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Update locale
  Future<APIResult> updateLocale(String id, Object data) async {
    try {
      var res = await Rest.put(
        RestParams(
          // ignore: unnecessary_null_comparison
          '/$apiraiser/$version/$plugin/i18n/Locale/$id',
          data: data,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Delete a locale
  Future<APIResult> deleteLocale(String id) async {
    try {
      var res = await Rest.delete(
        RestParams(
          // ignore: unnecessary_null_comparison
          '/$apiraiser/$version/$plugin/i18n/Locale/$id',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Insert a currency
  Future<APIResult> insertCurrency(Object data) async {
    try {
      var res = await Rest.post(
        RestParams(
          // ignore: unnecessary_null_comparison
          '/$apiraiser/$version/$plugin/i18n/Currency/',
          data: data,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Update currency
  Future<APIResult> updateCurrency(String id, Object data) async {
    try {
      var res = await Rest.put(
        RestParams(
          // ignore: unnecessary_null_comparison
          '/$apiraiser/$version/$plugin/i18n/Currency/$id',
          data: data,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Delete a currency
  Future<APIResult> deleteCurrency(String id) async {
    try {
      var res = await Rest.delete(
        RestParams(
          // ignore: unnecessary_null_comparison
          '/$apiraiser/$version/$plugin/i18n/Currency/$id',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }
}

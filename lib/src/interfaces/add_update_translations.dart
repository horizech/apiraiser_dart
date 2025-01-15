class AddUpdateTranslationsRequest {
  String i18nId;
  Map<String, TranslationDetail> locales;

  AddUpdateTranslationsRequest({
    required this.i18nId,
    required this.locales,
  });

  // Convert from JSON to AddUpdateTranslationsRequest
  factory AddUpdateTranslationsRequest.fromJson(Map<String, dynamic> json) {
    var localesFromJson = <String, TranslationDetail>{};
    if (json['Locales'] != null) {
      json['Locales'].forEach((key, value) {
        localesFromJson[key] = TranslationDetail.fromJson(value);
      });
    }

    return AddUpdateTranslationsRequest(
      i18nId: json['I18nId'] ?? '',
      locales: localesFromJson,
    );
  }

  // Convert AddUpdateTranslationsRequest to JSON
  Map<String, dynamic> toJson() {
    var localesToJson = <String, dynamic>{};
    locales.forEach((key, value) {
      localesToJson[key] = value.toJson();
    });

    return {
      'I18nId': i18nId,
      'Locales': localesToJson,
    };
  }
}

class TranslationDetail {
  String translation;
  String translationId;

  TranslationDetail({
    required this.translation,
    required this.translationId,
  });

  // Convert from JSON to TranslationDetail
  factory TranslationDetail.fromJson(Map<String, dynamic> json) {
    return TranslationDetail(
      translation: json['Translation'] ?? '',
      translationId: json['TranslationId'] ?? '',
    );
  }

  // Convert TranslationDetail to JSON
  Map<String, dynamic> toJson() {
    return {
      'Translation': translation,
      'TranslationId': translationId,
    };
  }
}

class DeleteTranslationsRequest {
  final List<String> translationIds;
  final String? i18nId;

  DeleteTranslationsRequest({
    required this.translationIds,
    this.i18nId,
  });
}

/// Find product model
class FindProductRequest {
  final String? name;
  final List<String>? collections;
  final List<String>? keywords;
  final Map<String, dynamic>? meta;
  final Map<String, List<String>>? filters;

  /// Constructor
  const FindProductRequest({
    this.name,
    this.collections,
    this.keywords,
    this.meta,
    this.filters,
  });

  /// Get model from Json
  factory FindProductRequest.fromJson(Map<String, dynamic> json) {
    FindProductRequest findProductRequest = FindProductRequest(
      name: json['Name'] as String?,
      collections: json['Collections'] as List<String>?,
      keywords: json['Keywords'] as List<String>?,
      meta: json['Meta'] as Map<String, dynamic>?,
      filters: json['Filters'] as Map<String, List<String>>?,
    );
    return findProductRequest;
  }

  /// Get Json from model
  Map<String, dynamic> toJson(FindProductRequest instance) {
    Map<String, dynamic> map = {
      'Name': instance.name,
      'Collections': instance.collections,
      'Keywords': instance.keywords,
      'Meta': instance.meta,
      'Filters': instance.filters,
    };
    return map;
  }
}

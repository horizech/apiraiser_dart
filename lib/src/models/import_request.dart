import 'dart:typed_data';

/// ImportRequest Upload model
class ImportRequest {
  final String? fileName;
  final Uint8List file;

  /// Constructor
  const ImportRequest({
    required this.file,
    this.fileName,
  });

  /// Get model from Json
  factory ImportRequest.fromJson(Map<String, dynamic> json) {
    ImportRequest importRequest = ImportRequest(
      fileName: json['FileName'] as String?,
      file: json['FormFile'] as Uint8List,
    );
    return importRequest;
  }

  /// Get Json from model
  Map<String, dynamic> toJson(ImportRequest instance) => <String, dynamic>{
        'FileName': instance.fileName,
        'FormFile': instance.file,
      };
}

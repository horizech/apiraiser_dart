import 'dart:typed_data';

/// CreateTableUsingDefinitionFileRequest model
class CreateTableUsingDefinitionFileRequest {
  final Uint8List file;
  final String? tags;

  /// Constructor
  const CreateTableUsingDefinitionFileRequest({
    required this.file,
    this.tags,
  });

  /// Get model from Json
  factory CreateTableUsingDefinitionFileRequest.fromJson(
      Map<String, dynamic> json) {
    CreateTableUsingDefinitionFileRequest info =
        CreateTableUsingDefinitionFileRequest(
      tags: json['Tags'] as String?,
      file: json['FormFile'] as Uint8List,
    );
    return info;
  }

  /// Get Json from model
  Map<String, dynamic> toJson(CreateTableUsingDefinitionFileRequest instance) =>
      <String, dynamic>{
        'FormFile': instance.file,
        'Tags': instance.tags,
      };
}

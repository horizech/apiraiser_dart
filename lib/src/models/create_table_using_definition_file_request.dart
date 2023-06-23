import 'dart:typed_data';

/// CreateTableUsingDefinitionFileRequest model
class CreateTableUsingDefinitionFileRequest {
  final Uint8List file;
  final int menuGroup;

  /// Constructor
  const CreateTableUsingDefinitionFileRequest({
    required this.file,
    required this.menuGroup,
  });

  /// Get model from Json
  factory CreateTableUsingDefinitionFileRequest.fromJson(
      Map<String, dynamic> json) {
    CreateTableUsingDefinitionFileRequest info =
        CreateTableUsingDefinitionFileRequest(
      menuGroup: json['MenuGroup'] as int,
      file: json['FormFile'] as Uint8List,
    );
    return info;
  }

  /// Get Json from model
  Map<String, dynamic> toJson(CreateTableUsingDefinitionFileRequest instance) =>
      <String, dynamic>{
        'FormFile': instance.file,
        'MenuGroup': instance.menuGroup,
      };
}

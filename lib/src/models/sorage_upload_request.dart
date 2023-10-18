import 'dart:typed_data';

/// Storage Upload model
class StorageUploadRequest {
  final String? storageId;
  final String? fileName;
  final String? path;
  final String? storageSource;
  final Uint8List? file;
  final List<Uint8List>? files;

  /// Constructor
  const StorageUploadRequest({
    this.file,
    this.fileName,
    this.files,
    this.storageId,
    this.storageSource,
    this.path,
  });

  /// Get model from Json
  factory StorageUploadRequest.fromJson(Map<String, dynamic> json) {
    StorageUploadRequest storageUploadRequest = StorageUploadRequest(
      fileName: json['FileName'] as String?,
      file: json['FormFile'] as Uint8List?,
      files: json['FormFiles'] as List<Uint8List>?,
      path: json['Path'] as String?,
      storageId: json['StorageId'] as String?,
      storageSource: json['StorageSource'] as String?,
    );
    return storageUploadRequest;
  }

  /// Get Json from model
  Map<String, dynamic> toJson(StorageUploadRequest instance) =>
      <String, dynamic>{
        'FileName': instance.fileName,
        'Path': instance.path,
        'FormFile': instance.file,
        'FormFiles': instance.files,
        'StorageId': instance.storageId,
        'StorageSource': instance.storageSource,
      };
}

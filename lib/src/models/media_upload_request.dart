import 'dart:typed_data';

/// Media Upload model
class MediaUploadRequest {
  final String? mediaId;
  final String? fileName;
  final String? path;
  final String? mediaSource;
  final Uint8List? file;
  final List<Uint8List>? files;

  /// Constructor
  const MediaUploadRequest({
    this.file,
    this.fileName,
    this.files,
    this.mediaId,
    this.mediaSource,
    this.path,
  });

  /// Get model from Json
  factory MediaUploadRequest.fromJson(Map<String, dynamic> json) {
    MediaUploadRequest mediaUploadRequest = MediaUploadRequest(
      fileName: json['FileName'] as String?,
      file: json['FormFile'] as Uint8List?,
      files: json['FormFiles'] as List<Uint8List>?,
      path: json['Path'] as String?,
      mediaId: json['MediaId'] as String?,
      mediaSource: json['MediaSource'] as String?,
    );
    return mediaUploadRequest;
  }

  /// Get Json from model
  Map<String, dynamic> toJson(MediaUploadRequest instance) => <String, dynamic>{
        'FileName': instance.fileName,
        'Path': instance.path,
        'FormFile': instance.file,
        'FormFiles': instance.files,
        'MediaId': instance.mediaId,
        'MediaSource': instance.mediaSource,
      };
}

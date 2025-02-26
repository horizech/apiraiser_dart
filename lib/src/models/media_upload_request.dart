import 'dart:typed_data';

import 'package:dio/dio.dart';

/// Media Upload model
class MediaUploadRequest {
  final String? fileName;
  final String? title;
  final String? caption;
  final String? description;
  final Uint8List? file;
  final List<Uint8List>? files;
  final String? path;
  final String? mediaSource;
  final String? mediaType;

  /// Constructor
  const MediaUploadRequest({
    this.fileName,
    this.title,
    this.caption,
    this.description,
    this.file,
    this.files,
    this.path,
    this.mediaSource,
    this.mediaType,
  });

  /// Convert to FormData
  FormData toFormData() {
    return FormData.fromMap({
      'FileName': fileName,
      'Title': title,
      'Caption': caption,
      'Description': description,
      'Path': path,
      'MediaSource': mediaSource,
      'MediaType': mediaType,
      if (file != null)
        'FormFile': MultipartFile.fromBytes(file!, filename: fileName),
      if (files != null && files!.isNotEmpty)
        'FormFiles': files!.map((f) => MultipartFile.fromBytes(f)).toList(),
    });
  }

  /// Get model from Json
  factory MediaUploadRequest.fromJson(Map<String, dynamic> json) {
    MediaUploadRequest mediaUploadRequest = MediaUploadRequest(
      fileName: json['FileName'] as String?,
      title: json['Title'] as String?,
      caption: json['Caption'] as String?,
      description: json['Description'] as String?,
      file: json['FormFile'] as Uint8List?,
      files: json['FormFiles'] as List<Uint8List>?,
      path: json['Path'] as String?,
      mediaSource: json['MediaSource'] as String?,
      mediaType: json['MediaType'] as String?,
    );
    return mediaUploadRequest;
  }

  /// Get Json from model
  Map<String, dynamic> toJson(MediaUploadRequest instance) => <String, dynamic>{
        'FileName': instance.fileName,
        'Title': instance.title,
        'Caption': instance.caption,
        'Description': instance.description,
        'FormFile': instance.file,
        'FormFiles': instance.files,
        'Path': instance.path,
        'MediaSource': instance.mediaSource,
        'MediaType': instance.mediaType,
      };
}

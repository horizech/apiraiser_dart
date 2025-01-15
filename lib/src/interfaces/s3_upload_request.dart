class S3UploadRequest {
  final String accessKeyId;
  final String secretAccessKey;
  final dynamic region; // Replace 'dynamic' with the appropriate type if known
  final String bucket;
  final String key;
  final String?
      filePath; // Use String for file path instead of File for simplicity
  final Stream<List<int>>? stream; // Optional stream for upload
  final String? contentType;
  final String path;

  S3UploadRequest({
    required this.accessKeyId,
    required this.secretAccessKey,
    required this.region,
    required this.bucket,
    required this.key,
    this.filePath,
    this.stream,
    this.contentType,
    required this.path,
  });
}

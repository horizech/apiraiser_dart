class S3DeleteFileRequest {
  final String accessKeyId;
  final String secretAccessKey;
  final dynamic region; // Replace 'dynamic' with a specific type if known
  final String bucket;
  final String key;

  S3DeleteFileRequest({
    required this.accessKeyId,
    required this.secretAccessKey,
    required this.region,
    required this.bucket,
    required this.key,
  });
}

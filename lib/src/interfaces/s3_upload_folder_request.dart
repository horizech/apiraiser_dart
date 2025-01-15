class S3UploadFolderRequest {
  final String key;
  final String folder;
  final bool deleteSourceFolderAfterUpload;

  S3UploadFolderRequest({
    required this.key,
    required this.folder,
    required this.deleteSourceFolderAfterUpload,
  });
}

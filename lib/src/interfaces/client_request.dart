class ClientRequest {
  final String name;
  final String? displayName;
  final String? redirectUrls;

  ClientRequest({
    required this.name,
    this.displayName,
    this.redirectUrls,
  });
}

/// OAuth2AuthorizeRequest model
class OAuth2AuthorizeRequest {
  final String clientId;
  final String redirectUri;
  final String scope;
  final String responseType;
  final String? state;
  final String? accessType;

  /// Constructor
  const OAuth2AuthorizeRequest({
    required this.clientId,
    required this.redirectUri,
    required this.scope,
    required this.accessType,
    required this.responseType,
    required this.state,
  });
}

/// OAuth2AuthenticateRequest model
class OAuth2AuthenticateRequest {
  final String clientId;
  final String redirectUri;
  final String scope;
  final String responseType;
  final String? state;
  final String? accessType;
  final String? requestToken;

  /// Constructor
  const OAuth2AuthenticateRequest(
      {required this.clientId,
      required this.redirectUri,
      required this.scope,
      this.accessType,
      required this.responseType,
      this.state,
      this.requestToken});
}

/// OAuth2 Authorization Request model
class OAuth2AuthorizationRequest {
  final String clientId;
  final String redirectUri;
  final String scope;
  final String responseType;
  final String? state;
  final String? accessType;

  OAuth2AuthorizationRequest({
    required this.clientId,
    required this.redirectUri,
    required this.scope,
    required this.responseType,
    this.state,
    this.accessType,
  });
}

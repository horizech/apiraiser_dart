/// OAuth2TokenRequest model
class OAuth2TokenRequest {
  final String clientId;
  final String redirectUri;
  final String clientSecret;
  final String code;
  final String grantType;
  final String? state;
  final String? server;
  final String? tokenEndpoint;

  /// Constructor
  const OAuth2TokenRequest({
    required this.clientId,
    required this.redirectUri,
    required this.clientSecret,
    required this.grantType,
    required this.code,
    this.server,
    this.state,
    this.tokenEndpoint,
  });

  /// Get Json from model
  Map<String, dynamic> toJson(OAuth2TokenRequest instance) => <String, dynamic>{
        'clientID': instance.clientId,
        'clientSecret': instance.clientSecret,
        'grant_type': instance.grantType,
        'redirect_uri': instance.redirectUri,
        'code': instance.code,
        'server': instance.server,
        'state': instance.state,
        'tokenEndpoint': instance.tokenEndpoint,
      };
}

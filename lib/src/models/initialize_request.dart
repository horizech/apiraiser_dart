/// Model used for making initialize Apiraiser request
class InitializeRequest {
  final String username;
  final String email;
  final String password;
  final String? template;

  /// Constructor
  const InitializeRequest({
    required this.username,
    required this.email,
    required this.password,
    this.template,
  });

  /// Get model from Json
  factory InitializeRequest.fromJson(Map<String, dynamic> json) {
    try {
      InitializeRequest initializeRequest = InitializeRequest(
        username: json['Username'] as String,
        email: json['Email'] as String,
        password: json['Password'] as String,
        template: json['Template'] as String?,
      );
      return initializeRequest;
    } catch (e) {
      rethrow;
    }
  }

  /// Get Json from model
  Map<String, dynamic> toJson(InitializeRequest instance) => <String, dynamic>{
        'Username': instance.username,
        'Email': instance.email,
        'Password': instance.password,
        'Template': instance.template,
      };
}

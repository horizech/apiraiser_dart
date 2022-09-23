/// Model used for making login request
class LoginRequest {
  final String? username;
  final String? email;
  final String password;

  /// Constructor
  const LoginRequest({
    this.username,
    this.email,
    required this.password,
  });

  /// Get model from Json
  factory LoginRequest.fromJson(Map<String, dynamic> json) {
    try {
      LoginRequest loginRequest = LoginRequest(
        username: json['Username'] as String?,
        email: json['Email'] as String?,
        password: json['Password'] as String,
      );
      return loginRequest;
    } catch (e) {
      rethrow;
    }
  }

  /// Get Json from model
  Map<String, dynamic> toJson(LoginRequest instance) => <String, dynamic>{
        'Username': instance.username,
        'Email': instance.email,
        'Password': instance.password,
      };
}

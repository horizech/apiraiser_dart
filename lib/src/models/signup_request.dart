/// Model used for making Signup request
class SignupRequest {
  final String username;
  final String email;
  final String fullName;
  final String password;

  /// Constructor
  const SignupRequest({
    required this.username,
    required this.fullName,
    required this.email,
    required this.password,
  });

  /// Get model from Json
  factory SignupRequest.fromJson(Map<String, dynamic> json) {
    try {
      SignupRequest signupRequest = SignupRequest(
        username: json['Username'] as String,
        fullName: json['Fullname'] as String,
        email: json['Email'] as String,
        password: json['Password'] as String,
      );
      return signupRequest;
    } catch (e) {
      rethrow;
    }
  }

  /// Get Json from model
  Map<String, dynamic> toJson(SignupRequest instance) => <String, dynamic>{
        'Username': instance.username,
        'Fullname': instance.fullName,
        'Email': instance.email,
        'Password': instance.password,
      };
}

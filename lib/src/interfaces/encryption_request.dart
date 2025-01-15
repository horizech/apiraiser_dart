/// Model for encryption requests
class EncryptionRequest {
  final String data;
  final String password;

  EncryptionRequest({
    required this.data,
    required this.password,
  });

  /// Convert a JSON map to an EncryptionRequest instance
  factory EncryptionRequest.fromJson(Map<String, dynamic> json) {
    return EncryptionRequest(
      data: json['Data'] as String,
      password: json['Password'] as String,
    );
  }

  /// Convert an EncryptionRequest instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'Data': data,
      'Password': password,
    };
  }
}

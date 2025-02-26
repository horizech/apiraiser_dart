import 'package:apiraiser/apiraiser.dart';

/// Example demonstrating how to use Apiraiser library
void main() async {
  /// Initialize the library
  await Apiraiser.init("https://apiraiser-api-endpoint.com");

  /// Authentication
  await Apiraiser.provider.authentication
      .login(LoginRequest(username: "test", password: "P@ssword1"));
  // or
  await Apiraiser.provider.authentication
      .login(LoginRequest(email: "test@example.com", password: "P@ssword1"));
}

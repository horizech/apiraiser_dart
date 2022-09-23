import 'package:apiraiser/apiraiser.dart';
import 'package:apiraiser/src/models/login_request.dart';

/// Example demonstrating how to use Apiraiser library
void main() {
  /// Initialize the library
  Apiraiser.init("https://apiraiser-api-endpoint.com");

  /// Authentication
  Apiraiser.authentication
      .login(LoginRequest(username: "test", password: "P@ssword1"));
  // or
  Apiraiser.authentication
      .login(LoginRequest(email: "test@example.com", password: "P@ssword1"));

  /// Get table rows
  Apiraiser.data.get("my-table", -1);
}

/// User model
class User {
  final int? id;
  final String username;
  final String fullname;
  final String email;
  final String? password;
  final String? token;
  final List<dynamic>? roles;
  final List<int>? roleIds;
  final List<String>? roleNames;

  /// Constructor
  User({
    this.id,
    required this.username,
    required this.fullname,
    required this.email,
    this.password,
    this.token,
    this.roles,
    this.roleIds,
    this.roleNames,
  });

  /// Get model from Json
  factory User.fromJson(Map<String, dynamic> json) {
    try {
      User user = User(
          id: json['Id'] as int?,
          username: json['Username'] as String,
          fullname: json['Fullname'] ? json['Fullname'] as String : "",
          email: json['Email'] as String,
          password: json['Password'] ? json['Password'] as String : null,
          token: json['Token'] as String,
          roles: (json['Roles'] as List<dynamic>),
          roleIds: (json['Roles'] as List<dynamic>)
              .map((x) => (x as Map<String, dynamic>)["Id"] as int)
              .toList(),
          roleNames: (json['Roles'] as List<dynamic>)
              .map((x) => (x as Map<String, dynamic>)["Name"] as String)
              .toList());
      return user;
    } catch (e) {
      rethrow;
    }
  }

  /// Get Json from model
  Map<String, dynamic> toJson(User instance) => <String, dynamic>{
        'Id': instance.id,
        'Username': instance.username,
        'Fullname': instance.fullname,
        'Email': instance.email,
        'Password': instance.password,
        'Token': instance.token,
        'Role': instance.roles,
        'RoleIds': instance.roleIds,
        'RoleNames': instance.roleNames,
      };
}

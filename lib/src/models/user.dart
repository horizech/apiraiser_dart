/// User model
class User {
  final String? id;
  final String username;
  final String fullname;
  final String email;
  final String? password;
  final String? accessToken;
  final String? refreshToken;
  final List<dynamic>? roles;
  final List<String>? roleIds;
  final List<String>? roleNames;
  final bool? emailVerified;
  final String? phone;
  final String? address;
  final String? verificationToken;
  final String? status;

  /// Constructor
  User({
    this.id,
    required this.username,
    required this.fullname,
    required this.email,
    this.password,
    this.accessToken,
    this.refreshToken,
    this.address,
    this.emailVerified,
    this.phone,
    this.roles,
    this.roleIds,
    this.roleNames,
    this.status,
    this.verificationToken,
  });

  /// Get model from Json
  factory User.fromJson(Map<String, dynamic> json) {
    try {
      User user = User(
        id: json['Id'] as String?,
        username: json['Username'] as String,
        fullname: json['Fullname'] != null ? json['Fullname'] as String : "",
        email: json['Email'] as String,
        password: json['Password'] != null ? json['Password'] as String : null,
        accessToken: json['AccessToken'] as String?,
        refreshToken: json['RefreshToken'] as String?,
        address: json['Address'] as String?,
        phone: json['Phone'] as String?,
        roles: (json['Roles'] as List<dynamic>),
        roleIds: (json['Roles'] as List<dynamic>)
            .map((x) => (x as Map<String, dynamic>)["Id"] as String)
            .toList(),
        roleNames: (json['Roles'] as List<dynamic>)
            .map((x) => (x as Map<String, dynamic>)["Name"] as String)
            .toList(),
        emailVerified: (json['EmailVerified'] as bool?) != null
            ? json['EmailVerified'] as bool
            : false,
        status: (json['Status'] as String?),
        verificationToken: (json['VerificationToken'] as String?),
      );
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
        'AccessToken': instance.accessToken,
        'RefreshToken': instance.refreshToken,
        'Address': instance.address,
        'Phone': instance.phone,
        'EmailVerified': instance.emailVerified,
        'Role': instance.roles,
        'RoleIds': instance.roleIds,
        'RoleNames': instance.roleNames,
      };
}

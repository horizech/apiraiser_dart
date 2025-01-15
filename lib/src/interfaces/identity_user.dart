class IdentityUser {
  final String username;
  final String? id;
  final String fullname;
  final String email;
  final String? password;
  final String? address;
  final bool emailVerified;
  final List<String> roleIds;

  IdentityUser({
    required this.username,
    this.id,
    required this.fullname,
    required this.email,
    this.password,
    this.address,
    required this.emailVerified,
    required this.roleIds,
  });
}

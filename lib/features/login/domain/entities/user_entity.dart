class UserEntity {
  final String id;
  final String email;
  final String password;
  final String name;
  final int gender;
  final DateTime birthDay;
  String? token;

  UserEntity({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.gender,
    required this.birthDay,
    this.token,
  });
}

class UserModel {
  final String? id;
  final String? email;
  final String? password;
  final String? name;
  final int? gender;
  final DateTime? birthDay;

  const UserModel({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.gender,
    required this.birthDay,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'name': name,
      'gender': gender,
      'birthDay': birthDay?.toIso8601String(),
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      name: map['name'] as String,
      gender: map['gender'] as int,
      birthDay: DateTime.parse(map['birthDay']),
    );
  }
}

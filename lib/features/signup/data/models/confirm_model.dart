class ConfirmModel {
  final String email;
  final String password;

  const ConfirmModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory ConfirmModel.fromJson(Map<String, dynamic> map) {
    return ConfirmModel(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }
}

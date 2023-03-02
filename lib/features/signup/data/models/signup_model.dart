class SignupModel {
  final String email;
  final String password;

  const SignupModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory SignupModel.fromJson(Map<String, dynamic> map) {
    return SignupModel(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }
}

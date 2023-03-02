class ResetPassModel {
  final String? email;
  final String? password;
  final String? code;

  const ResetPassModel({
    this.email,
    this.password,
    this.code,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'code': code,
    };
  }

  factory ResetPassModel.fromJson(Map<String, dynamic> map) {
    return ResetPassModel(
      email: map['email'] as String,
      password: map['password'] as String,
      code: map['code'] as String,
    );
  }
}

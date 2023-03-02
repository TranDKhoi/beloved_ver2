class VerifyEmailModel {
  final String? email;
  final String? code;

  VerifyEmailModel({this.email, this.code});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'code': code,
    };
  }

  factory VerifyEmailModel.fromJson(Map<String, dynamic> map) {
    return VerifyEmailModel(
      email: map['email'] as String,
      code: map['code'] as String,
    );
  }
}

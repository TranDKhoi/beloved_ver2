class ConfirmEntity {
  final String email;
  final String password;
  final String rePassword;

  ConfirmEntity(
      {required this.email, required this.password, required this.rePassword});
}

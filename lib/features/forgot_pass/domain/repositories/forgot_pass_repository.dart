abstract class ForgotPassRepository {
  Future<void> sendVerifyCode(String email);
  Future<String> confirmVerifyCode(String code);
}

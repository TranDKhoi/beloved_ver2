abstract class ForgotPassRepository {
  Future<void> sendVerifyCode(String email);
  Future<String> confirmVerifyCode(String email, String code);
  Future<void> resendCode(String email);
}

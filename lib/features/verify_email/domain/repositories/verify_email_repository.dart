abstract class VerifyEmailRepository {
  Future<void> confirmVerifyCode(String code);
  Future<void> resendVerifyCode(String email);
}

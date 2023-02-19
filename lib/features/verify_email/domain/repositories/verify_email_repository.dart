abstract class VerifyEmailRepository {
  Future<void> sendVerifyCode(String code);
}

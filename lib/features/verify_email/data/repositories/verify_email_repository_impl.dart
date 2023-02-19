import 'package:beloved_ver2/features/verify_email/data/data_sources/remote/verify_email_service.dart';
import 'package:beloved_ver2/features/verify_email/domain/repositories/verify_email_repository.dart';

class VerifyEmailRepositoryImpl implements VerifyEmailRepository {
  @override
  Future<void> confirmVerifyCode(String code) async {
    await VerifyEmailService.ins.confirmVerifyCode(code);
  }

  @override
  Future<void> resendVerifyCode(String email) async {
    await VerifyEmailService.ins.resendVerifyCode(email);
  }
}

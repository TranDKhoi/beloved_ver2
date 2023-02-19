import 'package:beloved_ver2/features/verify_email/data/data_sources/remote/verify_email_service.dart';
import 'package:beloved_ver2/features/verify_email/domain/repositories/verify_email_repository.dart';

class VerifyEmailRepositoryImpl implements VerifyEmailRepository {
  @override
  Future<void> sendVerifyCode(String code) async {
    await VerifyEmailService.ins.sendVerifyCode(code);
  }
}

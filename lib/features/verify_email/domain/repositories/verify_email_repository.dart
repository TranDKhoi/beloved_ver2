import 'package:beloved_ver2/features/verify_email/domain/entities/verify_email_entity.dart';

import '../../../login/domain/entities/user_entity.dart';

abstract class VerifyEmailRepository {
  Future<UserEntity> confirmVerifyCode(VerifyEmailEntity verifyEmailEntity);
  Future<void> resendVerifyCode(String email, String password);
}

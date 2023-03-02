import 'package:beloved_ver2/exceptions/app_exception.dart';
import 'package:beloved_ver2/features/login/domain/entities/user_entity.dart';
import 'package:beloved_ver2/features/verify_email/domain/entities/verify_email_entity.dart';
import 'package:beloved_ver2/features/verify_email/domain/repositories/verify_email_repository.dart';
import 'package:beloved_ver2/utils/extensions/translate_extension.dart';

import '../../../../configs/langs/r.dart';

abstract class VerifyEmailUseCase {
  Future<UserEntity> confirmVerifyCode(VerifyEmailEntity verifyEmailEntity);
  Future<void> resendVerifyCode(String email, String password);
}

class VerifyEmailUseCaseImpl implements VerifyEmailUseCase {
  VerifyEmailUseCaseImpl(this._repository);

  final VerifyEmailRepository _repository;

  @override
  Future<UserEntity> confirmVerifyCode(
      VerifyEmailEntity verifyEmailEntity) async {
    if (verifyEmailEntity.code.isEmpty) {
      throw InvalidPassword(R.pleasefillalltheinformation.translate);
    }
    return await _repository.confirmVerifyCode(verifyEmailEntity);
  }

  @override
  Future<void> resendVerifyCode(String email, String password) async {
    await _repository.resendVerifyCode(email, password);
  }
}

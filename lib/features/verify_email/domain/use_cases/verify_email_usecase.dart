import 'package:beloved_ver2/exceptions/app_exception.dart';
import 'package:beloved_ver2/features/verify_email/domain/repositories/verify_email_repository.dart';
import 'package:beloved_ver2/utils/extensions/translate_extension.dart';

import '../../../../configs/langs/r.dart';

abstract class VerifyEmailUseCase {
  Future<void> confirmVerifyCode(String code);
  Future<void> resendVerifyCode(String email);
}

class VerifyEmailUseCaseImpl implements VerifyEmailUseCase {
  VerifyEmailUseCaseImpl(this._repository);

  final VerifyEmailRepository _repository;

  @override
  Future<void> confirmVerifyCode(String code) async {
    if (code.isEmpty) {
      throw InvalidPassword(R.pleasefillalltheinformation.translate);
    }
    await _repository.confirmVerifyCode(code);
  }

  @override
  Future<void> resendVerifyCode(String email) async {
    await _repository.resendVerifyCode(email);
  }
}

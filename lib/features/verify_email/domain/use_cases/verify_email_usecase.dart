import 'package:beloved_ver2/exceptions/app_exception.dart';
import 'package:beloved_ver2/features/verify_email/domain/repositories/verify_email_repository.dart';
import 'package:beloved_ver2/utils/extensions/translate_extension.dart';

import '../../../../configs/langs/r.dart';

abstract class VerifyEmailUseCase {
  Future<void> sendVerifyCode(String code);
}

class VerifyEmailUseCaseImpl implements VerifyEmailUseCase {
  VerifyEmailUseCaseImpl(this._repository);

  final VerifyEmailRepository _repository;

  @override
  Future<void> sendVerifyCode(String code) async {
    if (code.isEmpty) {
      throw InvalidPassword(R.pleasefillalltheinformation.translate);
    }
    await _repository.sendVerifyCode(code);
  }
}

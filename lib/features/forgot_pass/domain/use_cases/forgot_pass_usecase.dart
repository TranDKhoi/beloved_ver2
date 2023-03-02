import 'package:beloved_ver2/exceptions/app_exception.dart';
import 'package:beloved_ver2/utils/extensions/translate_extension.dart';
import 'package:beloved_ver2/utils/validation.dart';

import '../../../../configs/langs/r.dart';
import '../repositories/forgot_pass_repository.dart';

abstract class ForgotPassUseCase {
  Future<void> sendVerifyCode(String email);
  Future<void> resendCode(String email);
  Future<String> confirmVerifyCode(String email, String code);
}

class ForgotPassUseCaseImpl implements ForgotPassUseCase {
  ForgotPassUseCaseImpl(this._repository);

  final ForgotPassRepository _repository;

  @override
  Future<void> sendVerifyCode(String email) async {
    if (email.isEmpty) {
      throw InvalidEmptyField(R.pleasefillalltheinformation.translate);
    }
    if (!Validation.validEmail(email)) {
      throw InvalidEmail(R.invalidemailformat.translate);
    }
    await _repository.sendVerifyCode(email);
  }

  @override
  Future<String> confirmVerifyCode(String email, String code) async {
    if (code.isEmpty) {
      throw InvalidEmptyField(R.pleasefillalltheinformation.translate);
    }
    return await _repository.confirmVerifyCode(email, code);
  }

  @override
  Future<void> resendCode(String email) async {
    await _repository.resendCode(email);
  }
}

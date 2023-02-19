import 'package:beloved_ver2/exceptions/app_exception.dart';
import 'package:beloved_ver2/features/signup/domain/entities/confirm_entity.dart';
import 'package:beloved_ver2/features/signup/domain/repositories/signup_repository.dart';
import 'package:beloved_ver2/utils/extensions/translate_extension.dart';
import 'package:beloved_ver2/utils/validation.dart';

import '../../../../configs/langs/r.dart';

abstract class SignupUseCase {
  Future<void> confirmEmailPassword(ConfirmEntity confirmEntity);
}

class SignupUseCaseImpl implements SignupUseCase {
  final SignupRepository signupRepository;

  SignupUseCaseImpl(this.signupRepository);

  @override
  Future<void> confirmEmailPassword(ConfirmEntity confirmEntity) async {
    if (confirmEntity.email.isEmpty ||
        confirmEntity.password.isEmpty ||
        confirmEntity.rePassword.isEmpty) {
      throw InvalidEmail(R.pleasefillalltheinformation.translate);
    }
    if (!Validation.validEmail(confirmEntity.email)) {
      throw InvalidEmail(R.invalidemailformat.translate);
    }
    if (confirmEntity.password.length < 6 ||
        confirmEntity.rePassword.length < 6) {
      throw InvalidPassword(R.passwordmustbeatleast6characters.translate);
    }
    if (confirmEntity.password != confirmEntity.rePassword) {
      throw InvalidPassword(R.passworddonotmatch.translate);
    }

    await signupRepository.confirmSignup(confirmEntity);
  }
}

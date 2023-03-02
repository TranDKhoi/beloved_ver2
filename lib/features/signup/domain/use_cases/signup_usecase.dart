import 'package:beloved_ver2/exceptions/app_exception.dart';
import 'package:beloved_ver2/features/signup/domain/entities/signup_entity.dart';
import 'package:beloved_ver2/features/signup/domain/repositories/signup_repository.dart';
import 'package:beloved_ver2/utils/extensions/translate_extension.dart';
import 'package:beloved_ver2/utils/validation.dart';

import '../../../../configs/langs/r.dart';

abstract class SignupUseCase {
  Future<void> signup(SignupEntity confirmEntity);
}

class SignupUseCaseImpl implements SignupUseCase {
  final SignupRepository signupRepository;

  SignupUseCaseImpl(this.signupRepository);

  @override
  Future<void> signup(SignupEntity signupEntity) async {
    if (signupEntity.email.isEmpty ||
        signupEntity.password.isEmpty ||
        signupEntity.rePassword.isEmpty) {
      throw InvalidEmptyField(R.pleasefillalltheinformation.translate);
    }
    if (!Validation.validEmail(signupEntity.email)) {
      throw InvalidEmail(R.invalidemailformat.translate);
    }
    if (signupEntity.password.length < 6 ||
        signupEntity.rePassword.length < 6) {
      throw InvalidPassword(R.passwordmustbeatleast6characters.translate);
    }
    if (signupEntity.password != signupEntity.rePassword) {
      throw InvalidPassword(R.passworddonotmatch.translate);
    }

    await signupRepository.signup(signupEntity);
  }
}

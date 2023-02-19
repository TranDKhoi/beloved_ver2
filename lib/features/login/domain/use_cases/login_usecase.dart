import 'package:beloved_ver2/features/login/domain/entities/login_entity.dart';
import 'package:beloved_ver2/utils/extensions/translate_extension.dart';

import '../../../../configs/langs/r.dart';
import '../../../../exceptions/app_exception.dart';
import '../../../../utils/validation.dart';
import '../entities/user_entity.dart';
import '../repositories/login_repository.dart';

abstract class LoginUseCase {
  Future<UserEntity> login(LoginEntity loginEntity);
}

class LoginUseCaseImpl implements LoginUseCase {
  final LoginRepository _loginRepository;

  LoginUseCaseImpl(this._loginRepository);

  @override
  Future<UserEntity> login(LoginEntity loginEntity) async {
    if (loginEntity.email.isEmpty || loginEntity.password.isEmpty) {
      throw InvalidEmptyField(R.pleasefillalltheinformation.translate);
    }
    if (!Validation.validEmail(loginEntity.email)) {
      throw InvalidEmail(R.invalidemailformat.translate);
    }
    if (loginEntity.password.length < 6) {
      throw InvalidPassword(R.passwordmustbeatleast6characters.translate);
    }

    return await _loginRepository.login(loginEntity);
  }
}

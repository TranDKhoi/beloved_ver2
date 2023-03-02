import 'package:beloved_ver2/exceptions/app_exception.dart';
import 'package:beloved_ver2/features/forgot_pass/domain/entities/reset_pass_entity.dart';
import 'package:beloved_ver2/features/login/domain/entities/user_entity.dart';
import 'package:beloved_ver2/utils/extensions/translate_extension.dart';

import '../../../../configs/langs/r.dart';
import '../repositories/reset_pass_repository.dart';

abstract class ResetPassUseCase {
  Future<UserEntity> resetPassword(
      String pass, String repass, ResetPassEntity entity);
}

class ResetPassUseCaseImpl implements ResetPassUseCase {
  ResetPassUseCaseImpl(this._repo);

  final ResetPassRepository _repo;

  @override
  Future<UserEntity> resetPassword(
      String pass, String repass, ResetPassEntity entity) async {
    if (pass.isEmpty || repass.isEmpty) {
      throw InvalidEmptyField(R.pleasefillalltheinformation.translate);
    }
    if (pass != repass) {
      throw InvalidPassword(R.passworddonotmatch);
    }

    var newEntity =
        ResetPassEntity(email: entity.email, password: pass, code: entity.code);

    return await _repo.resetPassword(newEntity);
  }
}

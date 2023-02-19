import 'package:beloved_ver2/exceptions/app_exception.dart';
import 'package:beloved_ver2/utils/extensions/translate_extension.dart';

import '../../../../configs/langs/r.dart';
import '../repositories/reset_pass_repository.dart';

abstract class ResetPassUseCase {
  Future<void> resetPassword(String pass, String repass, String token);
}

class ResetPassUseCaseImpl implements ResetPassUseCase {
  ResetPassUseCaseImpl(this._repo);

  final ResetPassRepository _repo;

  @override
  Future<void> resetPassword(String pass, String repass, String token) async {
    if (pass.isEmpty || repass.isEmpty) {
      throw InvalidEmptyField(R.pleasefillalltheinformation.translate);
    }
    if (pass != repass) {
      throw InvalidPassword(R.passworddonotmatch);
    }

    await _repo.resetPassword(pass, token);
  }
}

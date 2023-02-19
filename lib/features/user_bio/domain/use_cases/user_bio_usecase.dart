import 'package:beloved_ver2/exceptions/app_exception.dart';
import 'package:beloved_ver2/features/user_bio/domain/entities/create_user_bio.dart';
import 'package:beloved_ver2/features/user_bio/domain/repositories/user_bio_repository.dart';
import 'package:beloved_ver2/utils/extensions/translate_extension.dart';

import '../../../../configs/langs/r.dart';

abstract class UserBioUseCase {
  Future saveUserBio(CreateUserBioEntity bio);
}

class UserBioUseCaseImpl implements UserBioUseCase {
  UserBioUseCaseImpl(this._repository);

  final UserBioRepository _repository;

  @override
  Future saveUserBio(CreateUserBioEntity bio) async {
    if (bio.name.isEmpty) {
      throw InvalidEmptyField(R.pleasefillalltheinformation.translate);
    }

    await _repository.saveUserBio(bio);
  }
}

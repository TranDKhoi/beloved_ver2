import 'package:beloved_ver2/features/user_bio/domain/repositories/user_bio_repository.dart';

abstract class UserBioUseCase {
  Future saveUserBio();
}

class UserBioUseCaseImpl implements UserBioUseCase {
  UserBioUseCaseImpl(this._repository);

  final UserBioRepository _repository;

  @override
  Future saveUserBio() async {
    await _repository.saveUserBio();
  }
}

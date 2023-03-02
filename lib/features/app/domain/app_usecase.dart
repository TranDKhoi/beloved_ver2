import '../../login/domain/entities/user_entity.dart';
import 'app_repository.dart';

abstract class AppUseCase {
  Future<UserEntity> getUserData();
}

class AppUseCaseImpl implements AppUseCase {
  AppUseCaseImpl(this._repo);
  final AppRepository _repo;

  @override
  Future<UserEntity> getUserData() async {
    return await _repo.getUserData();
  }
}

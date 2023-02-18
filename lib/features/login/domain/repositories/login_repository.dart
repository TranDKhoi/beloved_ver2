import '../entities/login_entity.dart';
import '../entities/user_entity.dart';

abstract class LoginRepository {
  Future<UserEntity> login(LoginEntity loginEntity);
}

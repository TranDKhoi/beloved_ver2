import 'package:beloved_ver2/features/login/domain/entities/user_entity.dart';

abstract class AppRepository {
  Future<UserEntity> getUserData();
}
